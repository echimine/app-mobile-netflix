import SwiftUI

struct HomeView: View {
    let rows: [MediaRow]

    var body: some View {
        ScrollView {
            VStack(alignment: .leading, spacing: 24) {
                heroSection

                ForEach(rows) { row in
                    MediaRowView(row: row)
                }
            }
            .padding(.bottom, 24)
        }
        .background(Color.black.ignoresSafeArea())
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbar {
            ToolbarItem(placement: .principal) {
                HStack(spacing: 20) {
                    Image("NetflixLogo")
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 28)

                    Text("TV Shows")
                    Text("Movies")
                    Text("My List")
                }
                .font(.subheadline)
                .foregroundStyle(.white)
            }
        }
    }

    private var heroSection: some View {
        ZStack(alignment: .bottom) {
            Image("hero-banner")
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 415)
                .clipped()
                .overlay(
                    LinearGradient(
                        colors: [.black.opacity(0.45), .clear, .black],
                        startPoint: .top,
                        endPoint: .bottom
                    )
                )

            VStack(spacing: 12) {
                Text("#2 in Nigeria Today")
                    .font(.system(size: 14, weight: .bold))
                    .foregroundStyle(.white)

                HStack(spacing: 24) {
                    Button {
                        // Lecture à implémenter
                    } label: {
                        Label("Play", systemImage: "play.fill")
                            .font(.system(size: 20, weight: .semibold))
                            .foregroundStyle(.black)
                            .padding(.horizontal, 24)
                            .padding(.vertical, 8)
                            .background(Color.white)
                            .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                    }

                    VStack(spacing: 4) {
                        Image(systemName: "plus")
                        Text("My List")
                            .font(.caption2)
                    }
                    .foregroundStyle(.white)

                    VStack(spacing: 4) {
                        Image(systemName: "info.circle")
                        Text("Info")
                            .font(.caption2)
                    }
                    .foregroundStyle(.white)
                }
            }
            .padding(.bottom, 16)
        }
    }
}

#Preview {
    NavigationStack {
        HomeView(rows: MediaRow.sampleRows)
    }
    .preferredColorScheme(.dark)
}
