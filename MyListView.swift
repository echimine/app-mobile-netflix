import SwiftUI

struct MyListView: View {
    let items: [MyListItem]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                ForEach(items) { item in
                    MyListCard(item: item)
                }
            }
            .padding(16)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("My List")
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

private struct MyListCard: View {
    let item: MyListItem

    var body: some View {
        HStack(spacing: 3) {
            ForEach(item.thumbnailNames, id: \.self) { name in
                Image(name)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 161)
                    .clipped()
            }
        }
        .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
    }
}

#Preview {
    NavigationStack {
        MyListView(items: MyListItem.sampleItems)
    }
    .preferredColorScheme(.dark)
}
