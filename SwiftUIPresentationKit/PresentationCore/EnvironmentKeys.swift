import SwiftUI

// MARK: Set Up Environment

private struct SheetManagerKey: EnvironmentKey {
    static let defaultValue = SheetPresentationManager(presentingSheet: nil)
}

private struct NavigationRouterKey: EnvironmentKey {
    static let defaultValue = NavigationRouter(views: [])
}

private struct AlertManagerOnNavigationKey: EnvironmentKey {
    static let defaultValue = AlertManager(isPresented: false, alertType: nil)
}

private struct AlertManagerOnSheetKey: EnvironmentKey {
    static let defaultValue = AlertManager(isPresented: false, alertType: nil)
}

private struct ToastManagerKey: EnvironmentKey {
    static let defaultValue = ToastPresentationManager()
}

extension EnvironmentValues {
    var sheetManager: SheetPresentationManager {
        get { self[SheetManagerKey.self] }
        set { self[SheetManagerKey.self] = newValue }
    }

    var navigationRouter: NavigationRouter {
        get { self[NavigationRouterKey.self] }
        set { self[NavigationRouterKey.self] = newValue }
    }

    var alertManagerOnSheet: AlertManager {
        get { self[AlertManagerOnSheetKey.self] }
        set { self[AlertManagerOnSheetKey.self] = newValue }
    }

    var alertManagerOnNavigation: AlertManager {
        get { self[AlertManagerOnNavigationKey.self] }
        set { self[AlertManagerOnNavigationKey.self] = newValue }
    }

    var toastManager: ToastPresentationManager {
        get { self[ToastManagerKey.self] }
        set { self[ToastManagerKey.self] = newValue }
    }
}
