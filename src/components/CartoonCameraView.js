import React, { useRef, useState, useEffect } from 'react';
import {
  StyleSheet,
  View,
  TouchableOpacity,
  Text,
  Dimensions,
  Platform,
} from 'react-native';
import { Camera } from 'expo-camera';
import CartoonFilter from './CartoonFilter';

const { width, height } = Dimensions.get('window');

export default function CartoonCameraView({
  onStartRecording,
  onStopRecording,
  isRecording,
  onCameraReady,
}) {
  const cameraRef = useRef(null);
  const [type, setType] = useState(Camera.Constants.Type.front);
  const [isProcessing, setIsProcessing] = useState(false);
  const recordingRef = useRef(null);

  useEffect(() => {
    if (onCameraReady) {
      onCameraReady();
    }
  }, []);

  const toggleCameraType = () => {
    setType(
      type === Camera.Constants.Type.back
        ? Camera.Constants.Type.front
        : Camera.Constants.Type.back
    );
  };

  const startRecording = async () => {
    if (cameraRef.current && !isRecording) {
      try {
        const video = await cameraRef.current.recordAsync({
          quality: Platform.OS === 'ios' ? Camera.Constants.VideoQuality['720p'] : '720p',
          maxDuration: 60, // 60 seconds max
        });
        recordingRef.current = video;
        onStartRecording();
      } catch (error) {
        console.error('Error starting recording:', error);
      }
    }
  };

  const stopRecording = async () => {
    if (cameraRef.current && isRecording && recordingRef.current) {
      try {
        cameraRef.current.stopRecording();
        const videoUri = recordingRef.current.uri;
        recordingRef.current = null;
        onStopRecording(videoUri);
      } catch (error) {
        console.error('Error stopping recording:', error);
      }
    }
  };

  const handleRecordPress = () => {
    if (isRecording) {
      stopRecording();
    } else {
      startRecording();
    }
  };

  return (
    <View style={styles.container}>
      <Camera
        ref={cameraRef}
        style={styles.camera}
        type={type}
        ratio="16:9"
        onCameraReady={() => setIsProcessing(true)}
      >
        <CartoonFilter
          cameraType={type}
          isProcessing={isProcessing}
          onProcessingChange={setIsProcessing}
        />
        
        <View style={styles.controls}>
          <TouchableOpacity
            style={styles.flipButton}
            onPress={toggleCameraType}
          >
            <Text style={styles.flipButtonText}>Flip</Text>
          </TouchableOpacity>
        </View>

        <View style={styles.bottomControls}>
          <View style={styles.recordContainer}>
            <TouchableOpacity
              style={[
                styles.recordButton,
                isRecording && styles.recordButtonActive,
              ]}
              onPress={handleRecordPress}
              disabled={isProcessing}
            >
              {isRecording && <View style={styles.recordIndicator} />}
            </TouchableOpacity>
            {isRecording && (
              <Text style={styles.recordingText}>Recording...</Text>
            )}
          </View>
        </View>
      </Camera>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
  },
  camera: {
    flex: 1,
  },
  controls: {
    position: 'absolute',
    top: 50,
    right: 20,
    zIndex: 10,
  },
  flipButton: {
    backgroundColor: 'rgba(0, 0, 0, 0.5)',
    padding: 12,
    borderRadius: 25,
  },
  flipButtonText: {
    color: '#fff',
    fontSize: 14,
    fontWeight: '600',
  },
  bottomControls: {
    position: 'absolute',
    bottom: 50,
    left: 0,
    right: 0,
    alignItems: 'center',
    justifyContent: 'center',
  },
  recordContainer: {
    alignItems: 'center',
  },
  recordButton: {
    width: 70,
    height: 70,
    borderRadius: 35,
    backgroundColor: '#fff',
    borderWidth: 4,
    borderColor: '#007AFF',
    justifyContent: 'center',
    alignItems: 'center',
  },
  recordButtonActive: {
    backgroundColor: '#FF3B30',
    borderColor: '#FF3B30',
  },
  recordIndicator: {
    width: 20,
    height: 20,
    borderRadius: 10,
    backgroundColor: '#fff',
  },
  recordingText: {
    color: '#fff',
    fontSize: 16,
    marginTop: 10,
    fontWeight: '600',
    textShadowColor: 'rgba(0, 0, 0, 0.75)',
    textShadowOffset: { width: 0, height: 1 },
    textShadowRadius: 3,
  },
});
