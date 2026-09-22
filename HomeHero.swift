import SwiftUI

struct HomeHero: View {
    var showsBackButton = false
    @Environment(\.dismiss) private var dismiss

    var body: some View {
        ZStack(alignment: .topLeading) {
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

            if showsBackButton {
                Button {
                    dismiss()
                } label: {
                    Image(systemName: "chevron.left")
                        .font(.system(size: 16, weight: .semibold))
                        .foregroundStyle(.white)
                        .frame(width: 36, height: 36)
                        .background(.black.opacity(0.5), in: Circle())
                }
                .padding(.leading, 16)
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

#Preview("With back button") {
    ZStack {
        Color.black.ignoresSafeArea()
        HomeHero(showsBackButton: true)
    }
}
