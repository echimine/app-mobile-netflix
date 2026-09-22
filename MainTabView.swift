import SwiftUI

struct MainTabView: View {
    var body: some View {
        TabView {
            NavigationStack {
                HomeView(rows: MediaRow.sampleRows)
            }
            .tabItem {
                Label("Home", systemImage: "house")
            }

            NavigationStack {
                SearchView(results: SearchResult.topSearches)
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
    MainTabView()
}
