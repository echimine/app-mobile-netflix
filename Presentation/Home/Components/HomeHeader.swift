import SwiftUI

struct HomeHeader: View {
    var body: some View {
        HStack(spacing: 20) {
            Image("NetflixLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 28)

            NavigationLink("TV Shows") {
                CategoryGridView(rows: MovieRow.homeRows)
            }
            NavigationLink("Movies") {
                CategoryGridView(rows: MovieRow.homeRows)
            }
            NavigationLink("My List") {
                MyListView()
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
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}
