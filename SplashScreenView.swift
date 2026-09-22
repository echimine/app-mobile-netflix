import SwiftUI

struct SplashScreenView: View {
    var body: some View {
        ZStack {
            Color.black
                .ignoresSafeArea()

            Image("NetflixLogo")
                .resizable()
                .aspectRatio(contentMode: .fit)
                .frame(width: 207)
        }
    }
}

#Preview {
    SplashScreenView()
}
