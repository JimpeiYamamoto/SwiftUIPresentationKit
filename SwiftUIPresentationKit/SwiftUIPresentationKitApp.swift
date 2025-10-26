import SwiftUI

@main
struct SwiftUIPresentationKitApp: App {
    @State private var toastManager = ToastPresentationManager()
    @State private var alertManagerOnNavigation = AlertManager(isPresented: false, alertType: nil)
    @State private var sheetState = SheetPresentationManager(presentingSheet: nil)
    @State private var navigationState = NavigationRouter(views: [])
    @State private var alertManagerOnSheet = AlertManager(isPresented: false, alertType: nil)

    var body: some Scene {
        WindowGroup {
            @Bindable var sheetState = sheetState
            @Bindable var navigationState = navigationState

            NavigationStack(path: $navigationState.views) {
                RootView()
                    .navigationDestination(for: NavigationType.self) { navigationType in
                        navigationType.makeView()
                            .alertOnNavigation()
                            .toast(manager: toastManager)
                    }
            }
            .sheet(item: $sheetState.presentingSheet) { sheetType in
                sheetType.makeView()
                    .alertOnSheet()
                    .toast(manager: toastManager)
            }
            .environment(\.toastManager, toastManager)
            .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
            .environment(\.sheetState, sheetState)
            .environment(\.navigationState, navigationState)
            .environment(\.alertManagerOnSheet, alertManagerOnSheet)
        }
    }
}
