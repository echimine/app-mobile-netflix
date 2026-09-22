import SwiftUI

struct MoreView: View {
    let profiles: [Profile]

    var body: some View {
        List {
            Section {
                VStack(spacing: 12) {
                    Text("Manage Profiles")
                        .font(.system(size: 20, weight: .medium))
                        .foregroundStyle(.white.opacity(0.8))

                    LazyVGrid(columns: [GridItem(.adaptive(minimum: 70), spacing: 16)], spacing: 16) {
                        ForEach(profiles) { profile in
                            VStack(spacing: 6) {
                                Image(profile.imageName)
                                    .resizable()
                                    .aspectRatio(contentMode: .fill)
                                    .frame(width: 65, height: 65)
                                    .clipShape(RoundedRectangle(cornerRadius: 7, style: .continuous))

                                Text(profile.name)
                                    .font(.caption)
                                    .foregroundStyle(.white)
                            }
                        }
                    }
                }
                .padding(.vertical, 12)
                .listRowInsets(EdgeInsets())
                .listRowBackground(Color.black)
            }

            Section {
                VStack(alignment: .leading, spacing: 12) {
                    Label("Tell friends about Netflix.", systemImage: "envelope.fill")
                        .font(.system(size: 16, weight: .bold))
                        .foregroundStyle(.white)

                    Text("Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sit quam dui, vivamus bibendum ut. A morbi mi tortor ut felis non accumsan accumsan quis. Massa,")
                        .font(.caption)
                        .foregroundStyle(.white.opacity(0.8))

                    Text("Terms & Conditions")
                        .font(.caption)
                        .underline()
                        .foregroundStyle(Color(white: 0.77))

                    HStack {
                        Spacer()
                        Button("Copy Link") {
                            // Partage à implémenter
                        }
                        .buttonStyle(.borderedProminent)
                        .tint(.white)
                        .foregroundStyle(.black)
                    }
                }
                .padding(.vertical, 8)
                .listRowBackground(Color(white: 0.1))
            }

            Section {
                NavigationLink("App Settings") { EmptyView() }
                NavigationLink("Account") { EmptyView() }
                NavigationLink("Help") { EmptyView() }
                Button("Sign Out", role: .destructive) {
                    // Déconnexion à implémenter
                }
            }
            .listRowBackground(Color.black)
            .foregroundStyle(.white)
        }
        .listStyle(.insetGrouped)
        .scrollContentBackground(.hidden)
        .background(Color.black.ignoresSafeArea())
        .navigationTitle("Manage Profiles")
        .toolbarBackground(.black, for: .navigationBar)
        .toolbarBackground(.visible, for: .navigationBar)
        .toolbarColorScheme(.dark, for: .navigationBar)
    }
}

#Preview {
    NavigationStack {
        MoreView(profiles: Profile.sampleProfiles)
    }
    .preferredColorScheme(.dark)
}
