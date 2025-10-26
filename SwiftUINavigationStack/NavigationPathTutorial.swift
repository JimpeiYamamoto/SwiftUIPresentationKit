import SwiftUI

@Observable
class NavigationManager1 {
    var path: [Color] = [] {
        willSet {
            print("will set to \(newValue)")
        }

        didSet {
            print("didSet to \(path)")
        }
    }

    @discardableResult
    func navigationBack() -> Color? {
        path.popLast()
    }

    func navigateTo() {
        path.append(.blue)
    }
}

struct NavigationPathTutorial: View {
    @State private var navigationManager = NavigationManager1()


    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
            }
            .navigationDestination(for: Color.self) { color in
                // ColorDetail(color: color, text: "hoge")
                ColorDetail2(navigationManager: navigationManager)
            }
        }
    }
}

struct ColorDetail2: View {
    private let navigationManager: NavigationManager1

    init(navigationManager: NavigationManager1) {
        self.navigationManager = navigationManager
    }
    var body: some View {
        VStack {
            NavigationLink("Blue", value: Color.yellow)
            NavigationLink("hoge", value: "hoge")

            Button(action: {
                navigationManager.navigationBack()
            }, label: {
                Text("navigationBack")
            })

            Button(action: {
                navigationManager.navigateTo()
            }, label: {
                Text("navigationTo")
            })
        }
    }
}


#Preview {
    NavigationPathTutorial()
}
