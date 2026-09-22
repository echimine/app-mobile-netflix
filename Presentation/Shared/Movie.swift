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
        Movie(title: "Before 30", imageName: "poster-popular-2"),
        Movie(title: "Lionheart", imageName: "poster-popular-3"),
        Movie(title: "The Millions", imageName: "poster-popular-4"),
        Movie(title: "Citation", imageName: "poster-popular-5"),
        Movie(title: "The Queen's Gambit", imageName: "trending-1"),
        Movie(title: "Kiss Daniel", imageName: "trending-2"),
        Movie(title: "The Wedding Party", imageName: "trending-3"),
        Movie(title: "King of Boys", imageName: "trending-4"),
        Movie(title: "Sugar Rush", imageName: "trending-5"),
        Movie(title: "Shaft", imageName: "top10-1"),
        Movie(title: "Chief Daddy", imageName: "top10-2"),
        Movie(title: "Fifty", imageName: "top10-3"),
        Movie(title: "Isoken", imageName: "top10-4"),
        Movie(title: "Ojukokoro", imageName: "top10-5"),
        Movie(title: "Oloture", imageName: "african-1"),
        Movie(title: "The Set Up", imageName: "african-2"),
        Movie(title: "Living in Bondage", imageName: "african-3"),
        Movie(title: "Namaste Wahala", imageName: "african-4"),
        Movie(title: "Òlòtūré", imageName: "nollywood-1"),
        Movie(title: "Òmó Ghetto", imageName: "nollywood-2"),
        Movie(title: "Rattlesnake", imageName: "nollywood-3"),
        Movie(title: "Ozark", imageName: "watch-again-1"),
        Movie(title: "Breaking Bad", imageName: "watch-again-2"),
        Movie(title: "Your Excellency", imageName: "new-release-1"),
        Movie(title: "The Governor", imageName: "new-release-2"),
        Movie(title: "Castle & Castle", imageName: "original-1"),
        Movie(title: "Peaky Blinders", imageName: "original-2"),
        Movie(title: "El Chapo", imageName: "original-3"),
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
