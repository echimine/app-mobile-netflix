import SwiftUI

extension DesignSystem {
    enum Typography {
        case largeTitle, title, body, caption

        var font: Font {
            switch self {
            case .largeTitle:
                .system(.largeTitle, weight: .bold)
            case .title:
                .system(.title2, weight: .semibold)
            case .body:
                .system(.body, weight: .regular)
            case .caption:
                .system(.caption, weight: .regular)
            }
        }
    }
}
