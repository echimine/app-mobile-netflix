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

            PlaceholderTabView(title: "Coming Soon")
                .tabItem {
                    Label("Coming Soon", systemImage: "film")
                }

            PlaceholderTabView(title: "Downloads")
                .tabItem {
                    Label("Downloads", systemImage: "arrow.down.circle")
                }

            PlaceholderTabView(title: "More")
                .tabItem {
                    Label("More", systemImage: "line.3.horizontal")
                }
        }
        .tint(.white)
        .preferredColorScheme(.dark)
    }
}

private struct PlaceholderTabView: View {
    let title: String

    var body: some View {
        ZStack {
            Color.black.ignoresSafeArea()
            Text(title)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    MainTabView()
}
