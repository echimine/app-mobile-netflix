import SwiftUI

struct HomeView: View {
    let rows: [MovieRow]
    @Environment(MyListStore.self) private var myList

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HomeHero(showsHeader: true)

                MediaCarousel(title: "Previews", items: MediaCarouselItem.previewsSample)

                if !myList.movies.isEmpty {
                    MediaRowView(row: MovieRow(title: "My List", movies: myList.movies))
                }

                ForEach(rows) { row in
                    MediaRowView(row: row)
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color.black.ignoresSafeArea())
        .toolbar(.hidden, for: .navigationBar)
    }
}

struct CategoryGridView: View {
    let rows: [MovieRow]
    var showsHeroHeader = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HomeHero(showsHeader: showsHeroHeader)

                ForEach(rows) { row in
                    MediaRowView(row: row)
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        HomeView(rows: MovieRow.homeRows)
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}

#Preview("Category") {
    NavigationStack {
        CategoryGridView(rows: MovieRow.homeRows)
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}
