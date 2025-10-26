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
                Group {
                    switch sheetType {
                    case let .sheet1(_, message): Sheet1(message: message)
                    case let .sheet2(_, message): Sheet2(message: message)
                    case let .sheet3(_, message): Sheet3(message: message)
                    }
                }
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
