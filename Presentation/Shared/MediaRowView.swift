import SwiftUI

struct MediaRowView: View {
    let row: MediaRow

    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            Text(row.title)
                .font(DesignSystem.Typography.title.font)
                .foregroundStyle(.white)
                .padding(.horizontal, 16)

            ScrollViewReader { proxy in
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack(spacing: 6) {
                        ForEach(row.items) { item in
                            Image(item.imageName)
                                .resizable()
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 103, height: item.isTall ? 177 : 58)
                                .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
                                .id(item.id)
                        }
                    }
                    .padding(.horizontal, 16)
                }
                .onAppear {
                    if let firstID = row.items.first?.id {
                        proxy.scrollTo(firstID, anchor: .leading)
                    }
                }
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        MediaRowView(row: MediaRow.sampleRows[0])
    }
}
