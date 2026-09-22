import Foundation
import Observation

@Observable
final class MyListStore {
    private static let storageKey = "myList.movieIDs"

    private(set) var movies: [Movie]

    init() {
        let savedIDs = UserDefaults.standard.stringArray(forKey: Self.storageKey) ?? []
        movies = savedIDs.compactMap { id in
            Movie.catalog.first { $0.id == id }
        }
    }

    func contains(_ movie: Movie) -> Bool {
        movies.contains(movie)
    }

    func toggle(_ movie: Movie) {
        if let index = movies.firstIndex(of: movie) {
            movies.remove(at: index)
        } else {
            movies.append(movie)
        }
        UserDefaults.standard.set(movies.map(\.id), forKey: Self.storageKey)
    }
}
