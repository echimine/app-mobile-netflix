import SwiftUI

@main struct MyApp: App {
    @State private var myList = MyListStore()

    var body: some Scene {
        WindowGroup {
            RootView()
                .environment(myList)
        }
    }
}
