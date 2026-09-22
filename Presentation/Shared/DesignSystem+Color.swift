import SwiftUI

extension DesignSystem {
    enum Color {

        enum Background {
            case primary, secondary

            var color: SwiftUI.Color {
                switch self {
                case .primary:
                    SwiftUI.Color("background-primary")
                case .secondary:
                    SwiftUI.Color("background-secondary")
                }
            }
        }

        enum Text {
            case primary, secondary

            var color: SwiftUI.Color {
                switch self {
                case .primary:
                    SwiftUI.Color("text-primary")
                case .secondary:
                    SwiftUI.Color("text-secondary")
                }
            }
        }

        enum Shadow {
            case subtle, strong

            var color: SwiftUI.Color {
                switch self {
                case .subtle:
                    SwiftUI.Color.black.opacity(0.1)
                case .strong:
                    SwiftUI.Color.black.opacity(0.25)
                }
            }
        }

        enum Token {
            case background(Background)
            case text(Text)
            case shadow(Shadow)

            var color: SwiftUI.Color {
                switch self {
                case .background(let bg): return bg.color
                case .text(let text): return text.color
                case .shadow(let shadow): return shadow.color
                }
            }
        }
    }
}
