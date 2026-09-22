import SwiftUI

struct DownloadsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 16) {
            Text("Introducing Downloads For You")
                .font(.system(size: 20, weight: .bold))
                .foregroundStyle(.white)

            HStack {
                Text("Smart Downloads")
                    .font(DesignSystem.Typography.body.font)
                    .foregroundStyle(.white)

                Spacer()

                Text("SETUP")
                    .font(.system(size: 14))
                    .foregroundStyle(.white)
                    .padding(.horizontal, 16)
                    .padding(.vertical, 8)
                    .background(Color(red: 0, green: 0.44, blue: 0.92))
                    .clipShape(RoundedRectangle(cornerRadius: 2, style: .continuous))
            }

            Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa, id ut ipsum aliquam enim non posuere pulvinar diam.")
                .font(DesignSystem.Typography.caption.font)
                .foregroundStyle(.white.opacity(0.7))

            Spacer()

            VStack(spacing: 16) {
                Circle()
                    .fill(Color(white: 0.26))
                    .frame(width: 177, height: 177)
                    .overlay {
                        Image(systemName: "arrow.down.circle")
                            .font(.system(size: 60))
                            .foregroundStyle(.white)
                    }

                NavigationLink {
                    SearchView()
                } label: {
                    Text("Find Something to Download")
                        .font(.system(size: 16, weight: .bold))
                }
                .buttonStyle(.primary)
                .padding(.horizontal, 68)
            }
            .frame(maxWidth: .infinity)

            Spacer()
        }
        .padding(16)
        .background(Color.black.ignoresSafeArea())
    }
}

#Preview {
    NavigationStack {
        DownloadsView()
    }
    .environment(MyListStore())
    .preferredColorScheme(.dark)
}
