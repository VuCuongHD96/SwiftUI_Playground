import SwiftUI

struct ContentView: View {

    var body: some View {
        NavigationView {
            List {
                NavigationLink {
                    PushOrNavigate()
                } label: {
                    Text("1. PushOrNavigate")
                }
                NavigationLink {
                    CosmosView()//(star: 3.5)
                } label: {
                    Text("2. CosmosView")
                }
                NavigationLink {
                    AsyncAwaitCombine()
                } label: {
                    Text("3. AsyncAwaitCombine")
                }
                NavigationLink {
                    MultiNavigationLink()
                } label: {
                    Text("4. MultiNavigationLink")
                }
                NavigationLink {
                    ExpandView()
                } label: {
                    Text("5. MultiNavigationLink")
                }
                NavigationLink {
                    NavigationViewFullColor()
                } label: {
                    Text("6. NavigationViewFullColor")
                }
            }
            .font(.title)
        }
    }
}
