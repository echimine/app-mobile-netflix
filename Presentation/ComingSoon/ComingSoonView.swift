import SwiftUI

struct ComingSoonView: View {
    let items: [ComingSoonItem]

    var body: some View {
        ScrollView {
            VStack(spacing: 16) {
                notificationsHeader

                ForEach(items) { item in
                    ComingSoonCard(item: item)
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Coming Soon")
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }

    private var notificationsHeader: some View {
        VStack(alignment: .leading, spacing: 12) {
            Label("Notifications", systemImage: "bell.fill")
                .font(.system(size: 17, weight: .bold))
                .foregroundStyle(.white)
                .frame(maxWidth: .infinity)

            HStack(spacing: 8) {
                notificationTile(imageName: "coming-notif-1", title: "El Chapo", date: "Nov 6")
                notificationTile(imageName: "coming-notif-2", title: "Peaky Blinders", date: "Nov 6")
            }
        }
        .padding(.horizontal, 16)
        .padding(.top, 16)
    }

    private func notificationTile(imageName: String, title: String, date: String) -> some View {
        VStack(alignment: .leading, spacing: 2) {
            Image(imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 55)
                .frame(maxWidth: .infinity)
                .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))

            Text("New Arrival")
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.white)
            Text(title)
                .font(.system(size: 11, weight: .medium))
                .foregroundStyle(.white)
            Text(date)
                .font(.system(size: 10))
                .foregroundStyle(.white.opacity(0.5))
        }
    }
}

private struct ComingSoonCard: View {
    let item: ComingSoonItem

    var body: some View {
        ZStack(alignment: .bottomLeading) {
            Image(item.imageName)
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 385)
                .clipped()
                .frame(maxWidth: .infinity)
                .clipped()
                .overlay(
                    LinearGradient(
                        colors: [.clear, .black.opacity(0.9)],
                        startPoint: .center,
                        endPoint: .bottom
                    )
                )

            VStack(alignment: .leading, spacing: 8) {
                HStack {
                    Text(item.title)
                        .font(.system(size: 19, weight: .bold))
                        .foregroundStyle(.white)

                    Spacer()

                    HStack(spacing: 16) {
                        Button {
                            // Partage à implémenter
                        } label: {
                            VStack(spacing: 2) {
                                Image(systemName: "square.and.arrow.up")
                                Text("Share").font(.system(size: 9))
                            }
                        }

                        Button {
                            // Rappel à implémenter
                        } label: {
                            VStack(spacing: 2) {
                                Image(systemName: "bell")
                                Text("Remind Me").font(.system(size: 9))
                            }
                        }
                    }
                    .foregroundStyle(.white.opacity(0.85))
                }

                Text(item.releaseDate)
                    .font(.system(size: 11))
                    .foregroundStyle(.white.opacity(0.83))

                Text(item.tags.joined(separator: " • "))
                    .font(.system(size: 11, weight: .semibold))
                    .foregroundStyle(.white)
                    .lineLimit(1)

                Text(item.summary)
                    .font(.system(size: 11))
                    .foregroundStyle(.white.opacity(0.83))
                    .lineLimit(3)
            }
            .padding(16)
        }
    }
}

#Preview {
    NavigationStack {
        ComingSoonView(items: ComingSoonItem.sampleItems)
    }
    .preferredColorScheme(.dark)
}
