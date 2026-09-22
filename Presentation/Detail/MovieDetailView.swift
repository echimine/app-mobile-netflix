import SwiftUI

struct MovieDetailView: View {
    let movie: Movie
    @Environment(MyListStore.self) private var myList
    @State private var isPlayerPresented = false

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 16) {
                Image(movie.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 240)
                    .containerRelativeFrame(.horizontal)
                    .clipped()

                VStack(alignment: .leading, spacing: 16) {
                    Text(movie.title)
                        .font(.system(size: 24, weight: .bold))
                        .foregroundStyle(.white)

                    Button {
                        isPlayerPresented = true
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.system(size: 17, weight: .semibold))
                            .foregroundStyle(.black)
                            .frame(maxWidth: .infinity)
                            .padding(.vertical, 10)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 4, style: .continuous))
                    }

                    Button {
                        myList.toggle(movie)
                    } label: {
                        VStack(spacing: 4) {
                            Image(systemName: myList.contains(movie) ? "checkmark" : "plus")
                                .font(.system(size: 20))
                            Text("My List")
                                .font(.caption)
                        }
                        .foregroundStyle(.white)
                    }

                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis.")
                        .font(.system(size: 14))
                        .foregroundStyle(.white.opacity(0.8))
                }
                .padding(.horizontal, 16)
            }
            .padding(.bottom, 24)
        }
        .background(Color.black.ignoresSafeArea())
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
        .fullScreenCover(isPresented: $isPlayerPresented) {
            PlayerView(movie: movie)
        }
    }
}

#Preview {
    NavigationStack {
        MovieDetailView(movie: Movie.catalog[0])
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}

#Preview("Already in My List") {
    let store = MyListStore()
    store.toggle(Movie.catalog[0])
    return NavigationStack {
        MovieDetailView(movie: Movie.catalog[0])
    }
    .environment(store)
    .preferredColorScheme(.dark)
}
