import SwiftUI

struct SearchView: View {
    @State private var query = ""

    private var results: [Movie] {
        guard !query.isEmpty else { return Movie.catalog }
        return Movie.catalog.filter { $0.title.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        List {
            Section {
                ForEach(results) { movie in
                    NavigationLink {
                        MovieDetailView(movie: movie)
                    } label: {
                        SearchResultRow(movie: movie)
                    }
                    .listRowBackground(Color.black)
                }
            } header: {
                Text(query.isEmpty ? "Top Searches" : "Results")
                    .font(DesignSystem.Typography.title.font)
                    .foregroundStyle(.white)
                    .textCase(nil)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
        .navigationTitle("Search")
        .navigationBarTitleDisplayMode(.inline)
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .searchable(
            text: $query,
            placement: .navigationBarDrawer(displayMode: .always),
            prompt: "Search for a show, movie, genre, e.t.c."
        )
        .overlay {
            if results.isEmpty {
                ContentUnavailableView.search(text: query)
            }
        }
    }
}

private struct SearchResultRow: View {
    let movie: Movie

    var body: some View {
        HStack(spacing: 8) {
            Image(movie.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 146, height: 76)
                .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))

            Text(movie.title)
                .font(DesignSystem.Typography.body.font)
                .foregroundStyle(.white)

            Spacer()

            Image(systemName: "play.circle")
                .font(.system(size: 28))
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    NavigationStack {
        SearchView()
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}
