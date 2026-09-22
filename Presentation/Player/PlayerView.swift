import SwiftUI
import UIKit

struct PlayerView: View {
    let movie: Movie
    @Environment(\.dismiss) private var dismiss

    @State private var isPlaying = true
    @State private var progress: Double = 0.35
    @State private var controlsVisible = true

    private let totalDuration: Double = 54 * 60 + 67

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()

            Image(movie.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
                .ignoresSafeArea()

            if controlsVisible {
                controlsOverlay
            }
        }
        .statusBarHidden()
        .onTapGesture {
            withAnimation(.easeInOut(duration: 0.2)) {
                controlsVisible.toggle()
            }
        }
        .onAppear { requestLandscape() }
        .onDisappear { requestPortrait() }
    }

    private func requestLandscape() {
        setOrientation(.landscapeRight)
    }

    private func requestPortrait() {
        setOrientation(.portrait)
    }

    private func setOrientation(_ mask: UIInterfaceOrientationMask) {
        guard let scene = UIApplication.shared.connectedScenes.first as? UIWindowScene else { return }
        scene.requestGeometryUpdate(.iOS(interfaceOrientations: mask))
    }

    private var controlsOverlay: some View {
        ZStack {
            Color.black.opacity(0.35).ignoresSafeArea()

            VStack {
                HStack {
                    Button {
                        dismiss()
                    } label: {
                        Image(systemName: "xmark")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.white)
                    }

                    Spacer(minLength: 16)

                    Text(movie.title)
                        .font(.system(size: 15, weight: .semibold))
                        .foregroundStyle(.white)
                        .lineLimit(1)

                    Spacer(minLength: 16)

                    Color.clear.frame(width: 20, height: 1)
                }
                .padding(.horizontal, 24)
                .padding(.top, 16)

                Spacer()

                playbackControls

                Spacer()

                progressBar
                bottomToolbar
            }
            .padding(.bottom, 16)
        }
    }

    private var playbackControls: some View {
        HStack(spacing: 56) {
            Button {
                progress = max(0, progress - 10 / totalDuration)
            } label: {
                skipIcon(systemName: "gobackward.10")
            }

            Button {
                isPlaying.toggle()
            } label: {
                Image(systemName: isPlaying ? "pause.fill" : "play.fill")
                    .font(.system(size: 44))
                    .foregroundStyle(.white)
            }

            Button {
                progress = min(1, progress + 10 / totalDuration)
            } label: {
                skipIcon(systemName: "goforward.10")
            }
        }
    }

    private func skipIcon(systemName: String) -> some View {
        Image(systemName: systemName)
            .font(.system(size: 34))
            .foregroundStyle(.white)
    }

    private var progressBar: some View {
        HStack(spacing: 12) {
            Slider(value: $progress)
                .tint(.red)

            Text(remainingTime)
                .font(.system(size: 12))
                .foregroundStyle(.white)
                .monospacedDigit()
        }
        .padding(.horizontal, 24)
    }

    private var remainingTime: String {
        let remaining = Int(totalDuration * (1 - progress))
        return String(format: "%d:%02d", remaining / 60, remaining % 60)
    }

    private var bottomToolbar: some View {
        HStack {
            toolbarButton(title: "Speed (1x)", systemName: "speedometer")
            Spacer()
            toolbarButton(title: "Lock", systemName: "lock.open")
            Spacer()
            toolbarButton(title: "Episodes", systemName: "rectangle.stack")
            Spacer()
            toolbarButton(title: "Audio & Subtitles", systemName: "bubble.left.fill")
            Spacer()
            toolbarButton(title: "Next Ep.", systemName: "forward.end.fill")
        }
        .padding(.horizontal, 24)
        .padding(.top, 8)
    }

    private func toolbarButton(title: String, systemName: String) -> some View {
        Button {
            // Options de lecture à implémenter
        } label: {
            HStack(spacing: 6) {
                Image(systemName: systemName)
                    .font(.system(size: 15))
                Text(title)
                    .font(.system(size: 12))
            }
            .foregroundStyle(.white)
        }
    }
}

#Preview {
    PlayerView(movie: Movie.catalog[0])
}

#Preview("Paused") {
    PlayerView(movie: Movie.named("Peaky Blinders"))
}
