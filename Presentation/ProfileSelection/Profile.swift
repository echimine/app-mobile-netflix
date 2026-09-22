import Foundation

struct Profile: Identifiable, Hashable {
    let id = UUID()
    let name: String
    let imageName: String
}

extension Profile {
    static let sampleProfiles: [Profile] = [
        Profile(name: "Emenalo", imageName: "Profile-emenalo"),
        Profile(name: "Onyeka", imageName: "Profile-onyeka"),
        Profile(name: "Thelma", imageName: "Profile-thelma"),
        Profile(name: "Kids", imageName: "Profile-kids"),
    ]
}
