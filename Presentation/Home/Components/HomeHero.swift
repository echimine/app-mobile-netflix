import SwiftUI

struct HomeHero: View {
    var showsHeader = false

    var body: some View {
        ZStack(alignment: .top) {
            ZStack(alignment: .bottom) {
                Image("hero-banner")
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 415)
                    .clipped()
                    .frame(maxWidth: .infinity)
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
                        VStack(spacing: 4) {
                            Image(systemName: "plus")
                            Text("My List")
                                .font(.caption2)
                        }
                        .foregroundStyle(.white)

                        Button {
                            // Lecture à implémenter
                        } label: {
                            Label("Play", systemImage: "play.fill")
                                .font(.system(size: 20, weight: .semibold))
                                .foregroundStyle(.black)
                                .padding(.horizontal, 24)
                                .padding(.vertical, 8)
                                .background(Color(white: 0.85))
                                .clipShape(RoundedRectangle(cornerRadius: 6, style: .continuous))
                        }

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

            if showsHeader {
                HomeHeader()
                    .padding(.top, 8)
            }
        }
    }
}

#Preview {
    ZStack {
        Color.black.ignoresSafeArea()
        HomeHero()
    }
}

#Preview("Home (with header)") {
    NavigationStack {
        ZStack {
            Color.black.ignoresSafeArea()
            HomeHero(showsHeader: true)
        }
    }
    .preferredColorScheme(.dark)
}
