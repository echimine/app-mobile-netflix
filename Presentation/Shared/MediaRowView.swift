import SwiftUI

struct MediaRowView: View {
    let row: MovieRow

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(row.title)
                .font(DesignSystem.Typography.title.font)
                .foregroundStyle(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(row.movies) { movie in
                        NavigationLink {
                            MovieDetailView(movie: movie)
                        } label: {
                            Image(movie.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 103, height: 58)
                                .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
                        }
                    }
                }
                .padding(.horizontal, 16)
            }
        }
        .containerRelativeFrame(.horizontal, alignment: .leading)
    }
}

#Preview {
    NavigationStack {
        ZStack {
            Color.black.ignoresSafeArea()
            MediaRowView(row: MovieRow.homeRows[0])
        }
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}
