import SwiftUI

struct HomeView: View {
    let rows: [MediaRow]

    var body: some View {
        CategoryGridView(rows: rows, showsHeroHeader: true)
            .toolbar(.hidden, for: .navigationBar)
    }
}

struct CategoryGridView: View {
    let rows: [MediaRow]
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
        HomeView(rows: MediaRow.sampleRows)
    }
    .preferredColorScheme(.dark)
}

#Preview("Category") {
    NavigationStack {
        CategoryGridView(rows: MediaRow.sampleRows)
    }
    .preferredColorScheme(.dark)
}
