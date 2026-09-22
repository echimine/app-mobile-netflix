import SwiftUI

struct SearchView: View {
    let results: [SearchResult]
    @State private var query = ""

    private var filteredResults: [SearchResult] {
        guard !query.isEmpty else { return results }
        return results.filter { $0.title.localizedCaseInsensitiveContains(query) }
    }

    var body: some View {
        List {
            Section {
                ForEach(filteredResults) { result in
                    SearchResultRow(result: result)
                        .listRowBackground(Color.black)
                }
            } header: {
                Text("Top Searches")
                    .font(DesignSystem.Typography.title.font)
                    .foregroundStyle(.white)
                    .textCase(nil)
            }
        }
        .listStyle(.plain)
        .scrollContentBackground(.hidden)
        .background(Color.black)
        .searchable(text: $query, prompt: "Search for a show, movie, genre, e.t.c.")
    }
}

private struct SearchResultRow: View {
    let result: SearchResult

    var body: some View {
        HStack(spacing: 8) {
            Image(result.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 146, height: 76)
                .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))

            Text(result.title)
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
        SearchView(results: SearchResult.topSearches)
    }
    .preferredColorScheme(.dark)
}
