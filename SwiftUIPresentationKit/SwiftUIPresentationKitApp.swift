import SwiftUI

@main
struct SwiftUIPresentationKitApp: App {
    @State private var toastManager = ToastPresentationManager()
    @State private var alertManagerOnNavigation = AlertManager(isPresented: false, alertType: nil)
    @State private var alertManagerOnSheet = AlertManager(isPresented: false, alertType: nil)
    @State private var sheetManager = SheetPresentationManager(presentingSheet: nil)
    @State private var navigationRouter = NavigationRouter(views: [])

    var body: some Scene {
        WindowGroup {
            @Bindable var sheetManager = sheetManager
            @Bindable var navigationRouter = navigationRouter

            NavigationStack(path: $navigationRouter.views) {
                RootView()
                    .navigationDestination(for: NavigationType.self) { navigationType in
                        navigationType.makeView()
                            .alertOnNavigation()
                            .toast(manager: toastManager)
                    }
            }
            .sheet(item: $sheetManager.presentingSheet) { sheetType in
                sheetType.makeView()
                    .alertOnSheet()
                    .toast(manager: toastManager)
            }
            .environment(\.toastManager, toastManager)
            .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
            .environment(\.sheetManager, sheetManager)
            .environment(\.navigationRouter, navigationRouter)
            .environment(\.alertManagerOnSheet, alertManagerOnSheet)
        }
    }
}
