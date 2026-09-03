// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "HandGestureController",
    platforms: [
        .macOS(.v15)
    ],
    products: [
        .executable(
            name: "HandGestureController",
            targets: ["HandGestureApp"]
        )
    ],
    targets: [
        .target(
            name: "HandGestureApp",
            dependencies: [],
            path: "macOS",
            sources: [
                "App/HandGestureApp.swift",
                "UI/ContentView.swift",
                "Camera/CameraManager.swift",
                "Camera/CameraPreviewView.swift"
            ]
        )
    ]
)