import SwiftUI

struct RootView: View {
    @State private var isActive = false

    var body: some View {
        if isActive {
            ContentView()
        } else {
            SplashScreenView()
                .task {
                    try? await Task.sleep(for: .seconds(2))
                    isActive = true
                }
        }
    }
}

#Preview {
    RootView()
}
