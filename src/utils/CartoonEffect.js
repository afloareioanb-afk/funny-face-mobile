/**
 * Cartoon Effect Utilities
 * Applies cartoon-style filters to video frames based on face detection
 */

/**
 * Apply cartoon filter to image data
 * Uses edge detection and color quantization for cartoon effect
 */
export function applyCartoonFilter(imageData, faceData = null) {
  const data = new Uint8ClampedArray(imageData.data);
  const width = imageData.width;
  const height = imageData.height;

  // Step 1: Edge detection (Sobel operator)
  const edges = detectEdges(data, width, height);

  // Step 2: Color quantization (reduce color palette)
  const quantized = quantizeColors(data, width, height, 8);

  // Step 3: Combine edges with quantized colors
  const cartoon = combineEdgeAndColor(quantized, edges, width, height);

  // Step 4: Apply face-aware smoothing if face data is available
  if (faceData && faceData.length > 0) {
    return applyFaceAwareSmoothing(cartoon, faceData, width, height);
  }

  return new ImageData(cartoon, width, height);
}

/**
 * Detect edges using Sobel operator
 */
function detectEdges(data, width, height) {
  const edges = new Uint8ClampedArray(width * height);
  const sobelX = [-1, 0, 1, -2, 0, 2, -1, 0, 1];
  const sobelY = [-1, -2, -1, 0, 0, 0, 1, 2, 1];

  for (let y = 1; y < height - 1; y++) {
    for (let x = 1; x < width - 1; x++) {
      let gx = 0, gy = 0;

      for (let ky = -1; ky <= 1; ky++) {
        for (let kx = -1; kx <= 1; kx++) {
          const idx = ((y + ky) * width + (x + kx)) * 4;
          const gray = (data[idx] + data[idx + 1] + data[idx + 2]) / 3;
          const kernelIdx = (ky + 1) * 3 + (kx + 1);
          gx += gray * sobelX[kernelIdx];
          gy += gray * sobelY[kernelIdx];
        }
      }

      const magnitude = Math.sqrt(gx * gx + gy * gy);
      edges[y * width + x] = magnitude > 50 ? 255 : 0;
    }
  }

  return edges;
}

/**
 * Quantize colors to reduce palette
 */
function quantizeColors(data, width, height, levels) {
  const quantized = new Uint8ClampedArray(data.length);
  const step = 255 / levels;

  for (let i = 0; i < data.length; i += 4) {
    quantized[i] = Math.floor(data[i] / step) * step;     // R
    quantized[i + 1] = Math.floor(data[i + 1] / step) * step; // G
    quantized[i + 2] = Math.floor(data[i + 2] / step) * step; // B
    quantized[i + 3] = data[i + 3]; // A
  }

  return quantized;
}

/**
 * Combine edge detection with quantized colors
 */
function combineEdgeAndColor(quantized, edges, width, height) {
  const result = new Uint8ClampedArray(quantized.length);

  for (let y = 0; y < height; y++) {
    for (let x = 0; x < width; x++) {
      const idx = (y * width + x) * 4;
      const edgeValue = edges[y * width + x];

      if (edgeValue > 128) {
        // Draw black edges
        result[idx] = 0;
        result[idx + 1] = 0;
        result[idx + 2] = 0;
        result[idx + 3] = 255;
      } else {
        // Use quantized colors
        result[idx] = quantized[idx];
        result[idx + 1] = quantized[idx + 1];
        result[idx + 2] = quantized[idx + 2];
        result[idx + 3] = quantized[idx + 3];
      }
    }
  }

  return result;
}

/**
 * Apply face-aware smoothing to preserve facial features
 */
function applyFaceAwareSmoothing(data, faceData, width, height) {
  const result = new Uint8ClampedArray(data);
  
  faceData.forEach(face => {
    const { boundingBox } = face;
    const faceX = Math.max(0, boundingBox.x);
    const faceY = Math.max(0, boundingBox.y);
    const faceWidth = Math.min(width - faceX, boundingBox.width);
    const faceHeight = Math.min(height - faceY, boundingBox.height);

    // Apply bilateral filter-like smoothing to face region
    // This preserves edges while smoothing colors
    for (let y = faceY; y < faceY + faceHeight; y++) {
      for (let x = faceX; x < faceX + faceWidth; x++) {
        const idx = (y * width + x) * 4;
        // Simple smoothing - in production, use proper bilateral filter
        if (x > 0 && x < width - 1 && y > 0 && y < height - 1) {
          const neighbors = [
            data[((y - 1) * width + x) * 4],
            data[(y * width + (x - 1)) * 4],
            data[(y * width + (x + 1)) * 4],
            data[((y + 1) * width + x) * 4],
          ];
          
          result[idx] = (data[idx] + neighbors.reduce((a, b) => a + b, 0) / neighbors.length) / 2;
          result[idx + 1] = (data[idx + 1] + neighbors.reduce((a, b) => a + b, 0) / neighbors.length) / 2;
          result[idx + 2] = (data[idx + 2] + neighbors.reduce((a, b) => a + b, 0) / neighbors.length) / 2;
        }
      }
    }
  });

  return result;
}

/**
 * Enhance cartoon effect with additional styling
 */
export function enhanceCartoonEffect(imageData, intensity = 1.0) {
  const data = new Uint8ClampedArray(imageData.data);
  const width = imageData.width;
  const height = imageData.height;

  // Increase saturation
  for (let i = 0; i < data.length; i += 4) {
    const r = data[i];
    const g = data[i + 1];
    const b = data[i + 2];
    
    // Convert to HSL, increase saturation, convert back
    const max = Math.max(r, g, b);
    const min = Math.min(r, g, b);
    const delta = max - min;
    const lightness = (max + min) / 2;
    
    if (delta > 0) {
      const saturation = delta / (1 - Math.abs(2 * lightness / 255 - 1));
      const enhancedSaturation = Math.min(1, saturation * (1 + intensity * 0.3));
      
      // Convert back to RGB (simplified)
      const c = (1 - Math.abs(2 * lightness / 255 - 1)) * enhancedSaturation;
      const x = c * (1 - Math.abs(((max / 255) % 2) - 1));
      const m = lightness / 255 - c / 2;
      
      let newR, newG, newB;
      if (max === r) {
        newR = (c + m) * 255;
        newG = (x + m) * 255;
        newB = m * 255;
      } else if (max === g) {
        newR = (x + m) * 255;
        newG = (c + m) * 255;
        newB = m * 255;
      } else {
        newR = m * 255;
        newG = (x + m) * 255;
        newB = (c + m) * 255;
      }
      
      data[i] = Math.min(255, Math.max(0, newR));
      data[i + 1] = Math.min(255, Math.max(0, newG));
      data[i + 2] = Math.min(255, Math.max(0, newB));
    }
  }

  return new ImageData(data, width, height);
}
