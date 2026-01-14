import { applyCartoonFilter } from './CartoonEffect';
import FaceDetector from './FaceDetector';

let faceDetector = null;

/**
 * Initialize face detector for frame processing
 */
export async function initializeFrameProcessor() {
  if (!faceDetector) {
    faceDetector = new FaceDetector();
    await faceDetector.initialize();
  }
}

/**
 * Process camera frame with cartoon filter
 * This function will be called for each camera frame
 * 
 * @param {ImageData} frame - Camera frame as ImageData
 * @returns {ImageData} Processed frame with cartoon filter
 */
export async function processFrame(frame) {
  if (!faceDetector || !faceDetector.initialized) {
    return frame; // Return original if detector not ready
  }

  try {
    // Detect faces in the frame
    const faces = await faceDetector.detectFaces(frame);
    
    // Apply cartoon filter with face data
    const filteredFrame = applyCartoonFilter(frame, faces);
    
    return filteredFrame;
  } catch (error) {
    console.error('Error processing frame:', error);
    return frame; // Return original on error
  }
}

/**
 * Cleanup frame processor resources
 */
export function cleanupFrameProcessor() {
  if (faceDetector) {
    faceDetector.cleanup();
    faceDetector = null;
  }
}
