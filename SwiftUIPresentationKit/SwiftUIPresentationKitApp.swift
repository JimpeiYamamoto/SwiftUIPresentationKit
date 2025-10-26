import SwiftUI

@main
struct SwiftUIPresentationKitApp: App {
    @State private var toastManager = ToastManager()
    @State private var alertManagerOnNavigation = AlertManager(isPresented: false, alertType: nil)
    @State private var sheetState = SheetState(presentingSheet: nil)
    @State private var navigationState = NavigationState(views: [])
    @State private var alertManagerOnSheet = AlertManager(isPresented: false, alertType: nil)

    var body: some Scene {
        WindowGroup {
            TopView()
                .environment(\.toastManager, toastManager)
                .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
                .environment(\.sheetState, sheetState)
                .environment(\.navigationState, navigationState)
                .environment(\.alertManagerOnSheet, alertManagerOnSheet)
        }
    }
}
