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
            DemoView()
                .environment(\.toastManager, toastManager)
                .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
                .environment(\.sheetState, sheetState)
                .environment(\.navigationState, navigationState)
                .environment(\.alertManagerOnSheet, alertManagerOnSheet)
        }
    }
}
