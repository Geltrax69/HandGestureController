# Hand Gesture Controller

A macOS application for real-time hand gesture recognition using webcam.

## V1 Objective

Recognize hand gestures in real-time and display them on screen. Does NOT control any system functions (mouse, keyboard, applications, volume, scrolling).

## Prerequisites

- macOS 15.0+ (SwiftUI 5, iOS 18/macOS 15 APIs)
- Xcode 16.0+
- Computer with webcam

## Running the App

```bash
# Build and run from Xcode
open ~/PROJECTS/HandGestureController/HandGestureController.xcodeproj
```

## Current Status

**Milestone 1**: ✅ SwiftUI macOS app scaffold created, camera UI placeholder ready.

**Next**: Integrate webcam via AVFoundation.

## Project Structure

```
HandGestureController/
├── macOS/
│   ├── App/           (App entry point)
│   ├── UI/            (SwiftUI views)
│   ├── Camera/        (AVFoundation camera manager)
│   ├── HandTracking/  (MediaPipe/CoreML hand detection)
│   ├── GestureRecognition/ (Classification logic)
│   ├── Models/        (Core ML models)
│   └── Utilities/     (Helpers)
├── ML/
│   ├── collection/    (Dataset collector)
│   └── training/      (Training scripts)
└── README.md
```