import SwiftUI

struct MainTabView: View {
    let profile: Profile

    var body: some View {
        TabView {
            NavigationStack {
                HomeView(rows: MovieRow.homeRows(for: profile.name))
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationStack {
                SearchView()
            }
            .tabItem {
                Label("Search", systemImage: "magnifyingglass")
            }

            NavigationStack {
                ComingSoonView(items: ComingSoonItem.sampleItems)
            }
            .tabItem {
                Label("Coming Soon", systemImage: "film")
            }

            NavigationStack {
                DownloadsView()
            }
            .tabItem {
                Label("Downloads", systemImage: "arrow.down.circle")
            }

            NavigationStack {
                MoreView(profiles: Profile.sampleProfiles)
            }
            .tabItem {
                Label("More", systemImage: "line.3.horizontal")
            }
        }
        .tint(.white)
        .preferredColorScheme(.dark)
    }
}

#Preview {
    MainTabView(profile: Profile.sampleProfiles[0])
        .environment(MyListStore())
}
