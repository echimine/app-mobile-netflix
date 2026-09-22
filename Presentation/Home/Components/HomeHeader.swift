import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("NetflixLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28)

            NavigationLink("TV Shows") {
                CategoryGridView(rows: MediaRow.sampleRows)
            }
            NavigationLink("Movies") {
                CategoryGridView(rows: MediaRow.sampleRows)
            }
            NavigationLink("My List") {
                MyListView(items: MyListItem.sampleItems)
            }
        }
        .font(.subheadline)
        .foregroundStyle(.white)
        .tint(.white)
    }
}

#Preview {
    NavigationStack {
        ZStack {
            Color.black.ignoresSafeArea()
        }
        .toolbar {
            ToolbarItem(placement: .principal) {
                HomeHeader()
            }
        }
    }
    .preferredColorScheme(.dark)
}
