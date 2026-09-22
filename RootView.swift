import SwiftUI

struct RootView: View {
    @State private var isSplashDone = false
    @State private var selectedProfile: Profile?

    var body: some View {
        if let selectedProfile {
            MainTabView(profile: selectedProfile)
        } else if isSplashDone {
            NavigationStack {
                ProfileSelectionView(profiles: Profile.sampleProfiles) { profile in
                    selectedProfile = profile
                }
            }
        } else {
            SplashScreenView()
                .task {
                    try? await Task.sleep(for: .seconds(2))
                    isSplashDone = true
                }
        }
    }
}

#Preview {
    RootView()
        .environment(MyListStore())
}
