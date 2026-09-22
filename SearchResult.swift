import Foundation

struct SearchResult: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let imageName: String
}

extension SearchResult {
    static let topSearches: [SearchResult] = [
        SearchResult(title: "Citation", imageName: "search-citation"),
        SearchResult(title: "Oloture", imageName: "search-oloture"),
        SearchResult(title: "The Setup", imageName: "search-the-setup"),
        SearchResult(title: "Breaking Bad", imageName: "search-breaking-bad"),
        SearchResult(title: "Ozark", imageName: "search-ozark"),
        SearchResult(title: "Your Excellency", imageName: "search-your-excellency"),
        SearchResult(title: "The Governor", imageName: "search-the-governor"),
    ]
}
