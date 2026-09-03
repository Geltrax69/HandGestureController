import SwiftUI
import AVFoundation

struct ContentView: View {
    @StateObject private var cameraManager = CameraManager()
    @State private var isConnected = false
    @State private var gestureName = "—"
    @State private var confidenceValue = "—"

    var body: some View {
        VStack(spacing: 0) {
            // Title
            Text("HAND GESTURE RECOGNIZER")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundStyle(.secondary)
                .padding(.top, 16)
                .padding(.bottom, 12)

            // Camera view
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.black)
                    .aspectRatio(4.0/3.0, contentMode: .fit)

                if isConnected {
                    CameraPreviewView(previewLayer: cameraManager.previewLayer)
                        .aspectRatio(4.0/3.0, contentMode: .fit)
                        .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
                } else {
                    VStack {
                        Image(systemName: "camera.fill")
                            .font(.system(size: 32))
                            .foregroundStyle(.gray)
                        Text("CAMERA FEED")
                            .font(.system(size: 14, weight: .medium, design: .rounded))
                            .tracking(2)
                            .foregroundStyle(.gray)
                    }
                }
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)

            // Status block
            VStack(alignment: .leading, spacing: 10) {
                statusRow(label: "Camera", value: isConnected ? "Connected" : "Disconnected")
                statusRow(label: "Hand detected", value: "—")
                statusRow(label: "Gesture", value: gestureName)
                statusRow(label: "Confidence", value: confidenceValue)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)

            // Controls
            HStack(spacing: 12) {
                Button(action: startCamera) {
                    Label("Start", systemImage: "play.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(isConnected)

                Button(action: stopCamera) {
                    Label("Stop", systemImage: "stop.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.bordered)
                .disabled(!isConnected)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)
        }
        .frame(width: 720, height: 640)
        .background(Color(NSColor.windowBackgroundColor))
        .onAppear {
            // Camera ready
        }
    }

    private func startCamera() {
        cameraManager.start()
        isConnected = true
    }

    private func stopCamera() {
        cameraManager.stop()
        isConnected = false
        gestureName = "—"
        confidenceValue = "—"
    }

    @ViewBuilder
    private func statusRow(label: String, value: String) -> some View {
        HStack {
            Text(label)
                .font(.system(size: 12, weight: .medium, design: .rounded))
                .tracking(1)
                .foregroundStyle(.secondary)
            Spacer()
            Text(value)
                .font(.system(size: 14, weight: .semibold, design: .monospaced))
                .foregroundStyle(value == "—" || value == "Disconnected" ? .secondary : .primary)
        }
    }
}

#Preview {
    ContentView()
}