import Foundation

struct Movie: Identifiable, Hashable {
    let id: String
    let title: String
    let imageName: String

    init(id: String? = nil, title: String, imageName: String) {
        self.id = id ?? imageName
        self.title = title
        self.imageName = imageName
    }
}

struct MovieRow: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let movies: [Movie]
}

extension Movie {
    static let catalog: [Movie] = [
        Movie(title: "Barbarians", imageName: "poster-popular-1"),
        Movie(title: "Lucifer", imageName: "poster-popular-2"),
        Movie(title: "Before 30", imageName: "poster-popular-3"),
        Movie(title: "Òlòtūré", imageName: "poster-popular-4"),
        Movie(title: "The Million$", imageName: "poster-popular-5"),
        Movie(title: "The Princess Switch", imageName: "trending-1"),
        Movie(title: "Vikings", imageName: "trending-2"),
        Movie(title: "The Last Kingdom", imageName: "trending-3"),
        Movie(title: "Coming from Insanity", imageName: "trending-4"),
        Movie(title: "Shooter", imageName: "trending-5"),
        Movie(title: "Before 30", imageName: "top10-1"),
        Movie(title: "Mosul", imageName: "top10-2"),
        Movie(title: "King of Boys", imageName: "top10-3"),
        Movie(title: "The Beast", imageName: "top10-4"),
        Movie(title: "Unauthorized Living", imageName: "top10-5"),
        Movie(title: "Lucifer", imageName: "african-1"),
        Movie(title: "Blood & Water", imageName: "african-2"),
        Movie(title: "Merry Men 2", imageName: "african-3"),
        Movie(title: "A Fall from Grace", imageName: "african-4"),
        Movie(title: "Prison Break", imageName: "nollywood-1"),
        Movie(title: "Greenleaf", imageName: "nollywood-2"),
        Movie(title: "Suits", imageName: "nollywood-3"),
        Movie(title: "The Big Bang Theory", imageName: "watch-again-1"),
        Movie(title: "Sugar Rush", imageName: "watch-again-2"),
        Movie(title: "Living in Bondage", imageName: "new-release-1"),
        Movie(title: "Queen of the South", imageName: "new-release-2"),
        Movie(title: "The Fresh Prince of Bel-Air", imageName: "original-1"),
        Movie(title: "Kasanova", imageName: "original-2"),
        Movie(title: "Extraction", imageName: "original-3"),
    ]

    static func named(_ title: String) -> Movie {
        catalog.first { $0.title == title } ?? catalog[0]
    }
}

extension MovieRow {
    private static func movies(_ names: [String]) -> [Movie] {
        names.compactMap { name in
            Movie.catalog.first { $0.imageName == name }
        }
    }

    static func homeRows(for profileName: String) -> [MovieRow] {
        [MovieRow(title: "Continue Watching for \(profileName)", movies: movies([
            "watch-again-1", "watch-again-2", "trending-2", "nollywood-3",
        ]))] + homeRows
    }

    static let homeRows: [MovieRow] = [
        MovieRow(title: "Popular on Netflix", movies: movies([
            "poster-popular-1", "poster-popular-2", "poster-popular-3", "poster-popular-4", "poster-popular-5",
        ])),
        MovieRow(title: "Trending Now", movies: movies([
            "trending-1", "trending-2", "trending-3", "trending-4", "trending-5",
        ])),
        MovieRow(title: "Top 10 in Nigeria Today", movies: movies([
            "top10-1", "top10-2", "top10-3", "top10-4", "top10-5",
        ])),
        MovieRow(title: "African Movies", movies: movies([
            "african-1", "african-2", "african-3", "african-4",
        ])),
        MovieRow(title: "Nollywood Movies & TV", movies: movies([
            "nollywood-1", "nollywood-2", "nollywood-3",
        ])),
        MovieRow(title: "Watch It Again", movies: movies([
            "watch-again-1", "watch-again-2",
        ])),
        MovieRow(title: "New Releases", movies: movies([
            "new-release-1", "new-release-2",
        ])),
        MovieRow(title: "Netflix Originals", movies: movies([
            "original-1", "original-2", "original-3",
        ])),
    ]
}
