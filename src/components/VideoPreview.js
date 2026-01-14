import React from 'react';
import {
  StyleSheet,
  View,
  TouchableOpacity,
  Text,
  Dimensions,
} from 'react-native';
import { Video } from 'expo-av';

const { width, height } = Dimensions.get('window');

export default function VideoPreview({ videoUri, onRetake, onSend }) {
  const videoRef = React.useRef(null);

  return (
    <View style={styles.container}>
      <Video
        ref={videoRef}
        source={{ uri: videoUri }}
        style={styles.video}
        useNativeControls
        resizeMode="contain"
        isLooping
        shouldPlay
      />
      
      <View style={styles.controls}>
        <TouchableOpacity style={styles.button} onPress={onRetake}>
          <Text style={styles.buttonText}>Retake</Text>
        </TouchableOpacity>
        
        <TouchableOpacity
          style={[styles.button, styles.sendButton]}
          onPress={onSend}
        >
          <Text style={[styles.buttonText, styles.sendButtonText]}>Send</Text>
        </TouchableOpacity>
      </View>
    </View>
  );
}

const styles = StyleSheet.create({
  container: {
    flex: 1,
    backgroundColor: '#000',
  },
  video: {
    flex: 1,
    width: width,
    height: height * 0.8,
  },
  controls: {
    flexDirection: 'row',
    justifyContent: 'space-around',
    padding: 20,
    backgroundColor: '#000',
  },
  button: {
    paddingVertical: 12,
    paddingHorizontal: 30,
    borderRadius: 25,
    backgroundColor: '#333',
    minWidth: 120,
    alignItems: 'center',
  },
  sendButton: {
    backgroundColor: '#007AFF',
  },
  buttonText: {
    color: '#fff',
    fontSize: 16,
    fontWeight: '600',
  },
  sendButtonText: {
    color: '#fff',
  },
});
