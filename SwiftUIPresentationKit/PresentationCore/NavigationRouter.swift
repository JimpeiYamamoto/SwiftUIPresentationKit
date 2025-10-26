import SwiftUI

@Observable
class NavigationRouter {
    var views: [NavigationType]

    init(views: [NavigationType]) {
        self.views = views
    }

    func navigate(to view: NavigationType) {
        self.views.append(view)
    }

    func back() {
        self.views.removeLast()
    }
}

enum NavigationType: Hashable {
    case view1(message: String)
    case view2(message: String)
    case view3(message: String)

    @ViewBuilder
    func makeView() -> some View {
        switch self {
        case let .view1(message): NavigationView1(message: message)
        case let .view2(message): NavigationView2(message: message)
        case let .view3(message): NavigationView3(message: message)
        }
    }
}
