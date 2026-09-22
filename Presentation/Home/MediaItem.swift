import Foundation

struct MediaItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
    let isTall: Bool
}

struct MediaRow: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let items: [MediaItem]
}

extension MediaRow {
    private static let wideThumbnails = ["poster-popular-1", "poster-popular-2", "poster-popular-3", "poster-popular-4", "poster-popular-5"]

    private static func items(tall: Bool) -> [MediaItem] {
        wideThumbnails.map { MediaItem(imageName: $0, isTall: tall) }
    }

    static let sampleRows: [MediaRow] = [
        MediaRow(title: "Popular on Netflix", items: items(tall: false)),
        MediaRow(title: "Trending Now", items: items(tall: false)),
        MediaRow(title: "Top 10 in Nigeria Today", items: items(tall: false)),
        MediaRow(title: "My List", items: items(tall: false)),
        MediaRow(title: "African Movies", items: items(tall: false)),
        MediaRow(title: "Nollywood Movies & TV", items: items(tall: false)),
        MediaRow(title: "Watch It Again", items: items(tall: false)),
        MediaRow(title: "New Releases", items: items(tall: false)),
        MediaRow(title: "TV Thrillers & Mysteries", items: items(tall: false)),
        MediaRow(title: "US TV Shows", items: items(tall: false)),
    ]
}
