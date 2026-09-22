import SwiftUI

struct MyListView: View {
    @Environment(MyListStore.self) private var myList

    private let columns = [
        GridItem(.adaptive(minimum: 103), spacing: 8)
    ]

    var body: some View {
        Group {
            if myList.movies.isEmpty {
                ContentUnavailableView(
                    "Your list is empty",
                    systemImage: "plus.rectangle.on.rectangle",
                    description: Text("Add movies and shows to watch them later.")
                )
            } else {
                ScrollView {
                    LazyVGrid(columns: columns, spacing: 16) {
                        ForEach(myList.movies) { movie in
                            NavigationLink {
                                MovieDetailView(movie: movie)
                            } label: {
                                VStack(alignment: .leading, spacing: 4) {
                                    Image(movie.imageName)
                                        .resizable()
                                        .aspectRatio(contentMode: .fill)
                                        .frame(height: 58)
                                        .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))

                                    Text(movie.title)
                                        .font(.caption)
                                        .foregroundStyle(.white)
                                        .lineLimit(1)
                                }
                            }
                        }
                    }
                    .padding(16)
                }
            }
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("My List")
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview("Empty") {
    NavigationStack {
        MyListView()
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}

#Preview("With movies") {
    let store = MyListStore()
    for movie in Movie.catalog.prefix(5) {
        store.toggle(movie)
    }
    return NavigationStack {
        MyListView()
    }
    .environment(store)
    .preferredColorScheme(.dark)
}
