import SwiftUI

// MARK: Set Up Environment

private struct SheetStateKey: EnvironmentKey {
    static let defaultValue = SheetPresentationManager(presentingSheet: nil)
}

private struct NavigationStateKey: EnvironmentKey {
    static let defaultValue = NavigationRouter(views: [])
}

private struct AlertManagerKey: EnvironmentKey {
    static let defaultValue = AlertManager(isPresented: false, alertType: nil)
}

private struct ToastManagerKey: EnvironmentKey {
    static let defaultValue = ToastPresentationManager()
}

extension EnvironmentValues {
    var sheetState: SheetPresentationManager {
        get { self[SheetStateKey.self] }
        set { self[SheetStateKey.self] = newValue }
    }

    var navigationState: NavigationRouter {
        get { self[NavigationStateKey.self] }
        set { self[NavigationStateKey.self] = newValue }
    }

    var alertManagerOnSheet: AlertManager {
        get { self[AlertManagerKey.self] }
        set { self[AlertManagerKey.self] = newValue }
    }

    var alertManagerOnNavigation: AlertManager {
        get { self[AlertManagerKey.self] }
        set { self[AlertManagerKey.self] = newValue }
    }

    var toastManager: ToastPresentationManager {
        get { self[ToastManagerKey.self] }
        set { self[ToastManagerKey.self] = newValue }
    }
}
