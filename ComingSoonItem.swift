import Foundation

struct ComingSoonItem: Identifiable, Hashable {
    let id = UUID()
    let title: String
    let releaseDate: String
    let tags: [String]
    let summary: String
    let imageName: String
}

extension ComingSoonItem {
    static let sampleItems: [ComingSoonItem] = [
        ComingSoonItem(
            title: "Castle & Castle",
            releaseDate: "Season 1 Coming December 14",
            tags: ["Steamy", "Soapy", "Suspenseful", "Teen", "Mystery"],
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.",
            imageName: "coming-castle"
        ),
        ComingSoonItem(
            title: "Tiny Pretty Things",
            releaseDate: "Season 1 Coming December 14",
            tags: ["Steamy", "Soapy", "Suspenseful", "Teen", "Mystery"],
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.",
            imageName: "coming-tiny-pretty-things"
        ),
        ComingSoonItem(
            title: "The Governor",
            releaseDate: "Season 1 Coming December 14",
            tags: ["Steamy", "Soapy", "Suspenseful", "Teen", "Mystery"],
            summary: "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.",
            imageName: "search-the-governor"
        ),
    ]
}
