import SwiftUI

struct ContentView: View {
    @State private var isConnected = false
    @State private var gestureName = "—"
    @State private var confidenceValue = "0%"

    var body: some View {
        VStack(spacing: 0) {
            // Title
            Text("HAND GESTURE RECOGNIZER")
                .font(.system(size: 18, weight: .bold, design: .rounded))
                .tracking(2)
                .foregroundStyle(.secondary)
                .padding(.top, 16)
                .padding(.bottom, 12)

            // Camera placeholder
            ZStack {
                RoundedRectangle(cornerRadius: 12, style: .continuous)
                    .fill(Color.black)
                    .aspectRatio(4.0/3.0, contentMode: .fit)
                    .overlay(
                        VStack {
                            if isConnected {
                                Image(systemName: "camera.fill")
                                    .font(.system(size: 32))
                                    .foregroundStyle(.green)
                                    .padding(.bottom, 8)
                            }
                            Text("CAMERA FEED")
                                .font(.system(size: 14, weight: .medium, design: .rounded))
                                .tracking(2)
                                .foregroundStyle(.gray)
                        }
                        .frame(maxWidth: .infinity, maxHeight: .infinity)
                    )
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)

            // Status block
            VStack(alignment: .leading, spacing: 10) {
                statusRow(label: "Status", value: isConnected ? "Connected" : "Ready")
                statusRow(label: "Gesture", value: gestureName)
                statusRow(label: "Confidence", value: confidenceValue)
            }
            .padding(.horizontal, 20)
            .padding(.bottom, 20)

            // Controls
            HStack(spacing: 12) {
                Button(action: {}) {
                    Label("Start", systemImage: "play.fill")
                        .frame(maxWidth: .infinity)
                }
                .buttonStyle(.borderedProminent)
                .disabled(isConnected)

                Button(action: {}) {
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
            isConnected = true
            gestureName = "POINT"
            confidenceValue = "92%"
        }
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
                .foregroundStyle(value == "Ready" || value == "—" ? .secondary : .primary)
        }
    }
}

#Preview {
    ContentView()
}