import SwiftUI

// MARK: Set Up Environment

private struct SheetStateKey: EnvironmentKey {
    static let defaultValue = SheetState(presentingSheet: nil)
}

private struct NavigationStateKey: EnvironmentKey {
    static let defaultValue = NavigationState(views: [])
}

private struct AlertManagerKey: EnvironmentKey {
    static let defaultValue = AlertManager(isPresented: false, alertType: nil)
}

private struct ToastManagerKey: EnvironmentKey {
    static let defaultValue = ToastManager()
}

extension EnvironmentValues {
    var sheetState: SheetState {
        get { self[SheetStateKey.self] }
        set { self[SheetStateKey.self] = newValue }
    }

    var navigationState: NavigationState {
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

    var toastManager: ToastManager {
        get { self[ToastManagerKey.self] }
        set { self[ToastManager.self] = newValue }
    }
}
