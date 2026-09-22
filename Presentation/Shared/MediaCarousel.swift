import SwiftUI

struct MediaCarouselItem: Identifiable, Hashable {
    let id = UUID()
    let imageName: String
}

struct MediaCarousel: View {
    let title: String
    let items: [MediaCarouselItem]

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(title)
                .font(DesignSystem.Typography.largeTitle.font)
                .foregroundStyle(.white)
                .padding(.horizontal, 16)

            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 6) {
                    ForEach(items) { item in
                        Image(item.imageName)
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                            .frame(width: 102, height: 102)
                            .clipShape(Circle())
                    }
                }
                .padding(.horizontal, 16)
            }
        }
    }
}

extension MediaCarouselItem {
    static let previewsSample: [MediaCarouselItem] = [
        MediaCarouselItem(imageName: "preview-1"),
        MediaCarouselItem(imageName: "preview-2"),
        MediaCarouselItem(imageName: "preview-3"),
        MediaCarouselItem(imageName: "preview-4"),
        MediaCarouselItem(imageName: "preview-5"),
    ]
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        MediaCarousel(title: "Previews", items: MediaCarouselItem.previewsSample)
    }
}
