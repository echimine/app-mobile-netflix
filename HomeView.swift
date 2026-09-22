import SwiftUI

struct HomeView: View {
    let rows: [MediaRow]

    var body: some View {
        CategoryGridView(rows: rows, showsHeroBackButton: true)
            .toolbar {
                ToolbarItem(placement: .principal) {
                    HomeHeader()
                }
            }
    }
}

struct CategoryGridView: View {
    let rows: [MediaRow]
    var showsHeroBackButton = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                HomeHero(showsBackButton: showsHeroBackButton)

                ForEach(rows) { row in
                    MediaRowView(row: row)
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color.black.ignoresSafeArea())
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
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
