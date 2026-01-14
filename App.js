import React, { useState, useEffect } from 'react';
import {
  StyleSheet,
  View,
  Text,
  TouchableOpacity,
  StatusBar,
  Platform,
  Alert,
  ActivityIndicator,
} from 'react-native';
import { Camera } from 'expo-camera';
import * as MediaLibrary from 'expo-media-library';
import { Video } from 'expo-av';
import CartoonCameraView from './src/components/CartoonCameraView';
import VideoPreview from './src/components/VideoPreview';

export default function App() {
  const [hasPermission, setHasPermission] = useState(null);
  const [isRecording, setIsRecording] = useState(false);
  const [recordedVideo, setRecordedVideo] = useState(null);
  const [cameraReady, setCameraReady] = useState(false);

  useEffect(() => {
    (async () => {
      const { status: cameraStatus } = await Camera.requestCameraPermissionsAsync();
      const { status: audioStatus } = await Camera.requestMicrophonePermissionsAsync();
      const { status: mediaStatus } = await MediaLibrary.requestPermissionsAsync();
      
      setHasPermission(
        cameraStatus === 'granted' &&
        audioStatus === 'granted' &&
        mediaStatus === 'granted'
      );
    })();
  }, []);

  const handleStartRecording = () => {
    setIsRecording(true);
  };

  const handleStopRecording = (uri) => {
    setIsRecording(false);
    setRecordedVideo(uri);
  };

  const handleRetake = () => {
    setRecordedVideo(null);
  };

  const handleSend = async () => {
    if (recordedVideo) {
      try {
        // Save to media library
        await MediaLibrary.createAssetAsync(recordedVideo);
        Alert.alert('Success', 'Video message saved!');
        // Here you would typically send the video to a server or messaging service
        setRecordedVideo(null);
      } catch (error) {
        Alert.alert('Error', 'Failed to save video: ' + error.message);
      }
    }
  };

  if (hasPermission === null) {
    return (
      <View style={styles.container}>
        <ActivityIndicator size="large" color="#007AFF" />
        <Text style={styles.loadingText}>Requesting permissions...</Text>
      </View>
    );
  }

  if (hasPermission === false) {
    return (
      <View style={styles.container}>
        <Text style={styles.errorText}>
          No access to camera or microphone. Please enable permissions in settings.
        </Text>
      </View>
    );
  }

  return (
    <View style={styles.container}>
      <StatusBar barStyle="light-content" />
      {recordedVideo ? (
        <VideoPreview
          videoUri={recordedVideo}
          onRetake={handleRetake}
          onSend={handleSend}
        />
      ) : (
        <CartoonCameraView
          onStartRecording={handleStartRecording}
          onStopRecording={handleStopRecording}
          isRecording={isRecording}
          onCameraReady={() => setCameraReady(true)}
        />
      )}
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#000',
    justifyContent: 'center',
    alignItems: 'center',
  },
  loadingText: {
    marginTop: 20,
    color: '#fff',
    fontSize: 16,
  },
  errorText: {
    color: '#fff',
    fontSize: 16,
    textAlign: 'center',
    padding: 20,
  },
});
