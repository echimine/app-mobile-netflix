import Foundation

struct MyListItem: Identifiable, Hashable {
    let id = UUID()
    let thumbnailNames: [String]
}

extension MyListItem {
    static let sampleItems: [MyListItem] = [
        MyListItem(thumbnailNames: ["poster-popular-1", "poster-popular-2", "poster-popular-3"]),
        MyListItem(thumbnailNames: ["mylist-2-a", "mylist-2-b", "mylist-2-c"]),
        MyListItem(thumbnailNames: ["mylist-3-a", "mylist-3-b", "mylist-3-c"]),
        MyListItem(thumbnailNames: ["search-the-setup", "search-breaking-bad", "poster-popular-4"]),
        MyListItem(thumbnailNames: ["poster-popular-5", "search-ozark", "search-citation"]),
    ]
}
