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
}
