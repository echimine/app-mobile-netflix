import SwiftUI

struct ProfileSelectionView: View {
    let profiles: [Profile]
    @State private var isEditing: Bool

    init(profiles: [Profile], isEditing: Bool = false) {
        self.profiles = profiles
        self._isEditing = State(initialValue: isEditing)
    }

    private let columns = [
        GridItem(.flexible(), spacing: 25),
        GridItem(.flexible(), spacing: 25),
    ]

    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            VStack(spacing: 0) {
                Image("NetflixLogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 138)
                    .padding(.top, 24)

                Spacer()

                LazyVGrid(columns: columns, spacing: 40) {
                    ForEach(profiles) { profile in
                        ProfileTile(profile: profile, isEditing: isEditing)
                    }
                }
                .padding(.horizontal, 37)

                Spacer()

                Button {
                    // Ajout de profil à implémenter
                } label: {
                    VStack(spacing: 8) {
                        Image(systemName: "plus.circle.fill")
                            .font(.system(size: 50))
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.black, .white)

                        Text("Add Profile")
                            .font(DesignSystem.Typography.caption.font)
                            .foregroundStyle(.white)
                    }
                }
                .padding(.bottom, 40)
            }
        }
        .toolbar {
            ToolbarItem(placement: .topBarTrailing) {
                Button {
                    isEditing.toggle()
                } label: {
                    Image(systemName: "pencil")
                        .foregroundStyle(.white)
                }
            }
        }
    }
}

private struct ProfileTile: View {
    let profile: Profile
    let isEditing: Bool

    var body: some View {
        if isEditing {
            content
        } else {
            NavigationLink {
                MainTabView()
            } label: {
                content
            }
        }
    }

    private var content: some View {
        VStack(spacing: 8) {
            ZStack(alignment: .topTrailing) {
                Image(profile.imageName)
                    .resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 100, height: 100)
                    .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))

                if isEditing {
                    Image(systemName: "pencil.circle.fill")
                        .font(.system(size: 22))
                        .symbolRenderingMode(.palette)
                        .foregroundStyle(.black, .white)
                        .offset(x: 6, y: -6)
                }
            }

            Text(profile.name)
                .font(DesignSystem.Typography.body.font)
                .foregroundStyle(.white)
        }
    }
}

#Preview {
    NavigationStack {
        ProfileSelectionView(profiles: Profile.sampleProfiles)
    }
    .preferredColorScheme(.dark)
}

#Preview("Editing") {
    NavigationStack {
        ProfileSelectionView(profiles: Profile.sampleProfiles, isEditing: true)
    }
    .preferredColorScheme(.dark)
}
