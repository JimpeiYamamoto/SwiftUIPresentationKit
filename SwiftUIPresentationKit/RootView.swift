import SwiftUI

struct RootView: View {
    @Environment(\.sheetState)
    private var sheetState: SheetPresentationManager
    @Environment(\.navigationState)
    private var navigationState: NavigationRouter

    var body: some View {
        VStack {
            Text("TopView")
            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onTop"))
            }, label: {
                Text("open Sheet1")
            })
            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onTop"))
            }, label: {
                Text("open Sheet2")
            })
            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onTop"))
            }, label: {
                Text("open Sheet3")
            })
            Button(action: {
                navigationState.navigate(to: .view1(message: "from Top"))
            }, label: {
                Text("navigate1")
            })
            Button(action: {
                navigationState.navigate(to: .view2(message: "from Top"))
            }, label: {
                Text("navigate2")
            })
            Button(action: {
                navigationState.navigate(to: .view3(message: "from Top"))
            }, label: {
                Text("navigate3")
            })
        }
    }
}

// MARK: Example Views

struct Sheet1: View {
    @Environment(\.sheetState)
    var sheetState: SheetPresentationManager
    @Environment(\.navigationState)
    var navigationState: NavigationRouter
    @Environment(\.dismiss)
    var dismiss: DismissAction
    @Environment(\.alertManagerOnSheet)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastPresentationManager

    let message: String

    var body: some View {
        VStack {
            Text("Sheet1")
            Text("message: \(message)")

            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onSheet1"))
            }, label: {
                Text("open Sheet1")
            })

            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onSheet1"))
            }, label: {
                Text("open Sheet2")
            })

            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onSheet1"))
            }, label: {
                Text("open Sheet3")
            })
            Button(action: {
                alertManager.show(alertType: .alert1(actions: []))
            }, label: {
                Text("show Alert")
            })
            Button(action: {
                toastManager.show("from Sheet1")
            }, label: {
                Text("show Toast")
            })
            Button(action: {
                dismiss()
            }, label: {
                Text("dismiss")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.green)
    }
}

struct Sheet2: View {
    @Environment(\.sheetState)
    var sheetState: SheetPresentationManager
    @Environment(\.dismiss)
    var dismiss: DismissAction
    @Environment(\.navigationState)
    var navigationState: NavigationRouter
    @Environment(\.alertManagerOnSheet)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastPresentationManager
    let message: String

    var body: some View {
        VStack {
            Text("Sheet1")
            Text("message: \(message)")
            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onSheet2"))
            }, label: {
                Text("open Sheet1")
            })
            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onSheet2"))
            }, label: {
                Text("open Sheet2")
            })
            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onSheet2"))
            }, label: {
                Text("open Sheet3")
            })
            Button(action: {
                alertManager.show(alertType: .alert1(actions: []))
            }, label: {
                Text("show Alert")
            })
            Button(action: {
                toastManager.show("from Sheet2")
            }, label: {
                Text("showToast")
            })
            Button(action: {
                dismiss()
            }, label: {
                Text("dismiss")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.mint)
    }
}

struct Sheet3: View {
    @Environment(\.sheetState)
    var sheetState: SheetPresentationManager
    @Environment(\.dismiss)
    var dismiss: DismissAction
    @Environment(\.navigationState)
    var navigationState: NavigationRouter
    @Environment(\.alertManagerOnSheet)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastPresentationManager
    let message: String

    var body: some View {
        VStack {
            Text("Sheet1")
            Text("message: \(message)")
            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onSheet3"))
            }, label: {
                Text("open Sheet1")
            })
            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onSheet3"))
            }, label: {
                Text("open Sheet2")
            })
            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onSheet3"))
            }, label: {
                Text("open Sheet3")
            })
            Button(action: {
                alertManager.show(alertType: .alert1(actions: []))
            }, label: {
                Text("show Alert")
            })
            Button(action: {
                toastManager.show("from Sheet3")
            }, label: {
                Text("showToast")
            })
            Button(action: {
                dismiss()
            }, label: {
                Text("dismiss")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.yellow)
    }
}

struct NavigationView1: View {
    @Environment(\.sheetState)
    var sheetState: SheetPresentationManager
    @Environment(\.navigationState)
    var navigationState: NavigationRouter
    @Environment(\.alertManagerOnNavigation)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastPresentationManager

    let message: String
    var body: some View {
        VStack {
            Text("NavigationView1")
            Text("message: \(message)")

            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onNavigation1"))
            }, label: {
                Text("open Sheet1")
            })

            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onNavigation1"))
            }, label: {
                Text("open Sheet2")
            })

            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onNavigation1"))
            }, label: {
                Text("open Sheet3")
            })

            Button(action: {
                navigationState.navigate(to: .view1(message: "from navigation1"))
            }, label: {
                Text("navigate1")
            })

            Button(action: {
                navigationState.navigate(to: .view2(message: "from navigation1"))
            }, label: {
                Text("navigate2")
            })

            Button(action: {
                navigationState.navigate(to: .view3(message: "from navigation1"))
            }, label: {
                Text("navigate3")
            })

            Button(action: {
                alertManager.show(alertType: .alert2(actions: []))
            }, label: {
                Text("show alert")
            })

            Button(action: {
                toastManager.show("from Navigation1")
            }, label: {
                Text("show toast")
            })
            Button(action: {
                navigationState.back()
            }, label: {
                Text("back")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.orange)
    }
}

struct NavigationView2: View {
    @Environment(\.sheetState)
    var sheetState: SheetPresentationManager
    @Environment(\.navigationState)
    var navigationState: NavigationRouter
    @Environment(\.alertManagerOnNavigation)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastPresentationManager

    let message: String
    var body: some View {
        VStack {
            Text("NavigationView2")
            Text("message: \(message)")

            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onNavigation2"))
            }, label: {
                Text("open Sheet1")
            })

            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onNavigation2"))
            }, label: {
                Text("open Sheet2")
            })

            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onNavigation2"))
            }, label: {
                Text("open Sheet3")
            })

            Button(action: {
                navigationState.navigate(to: .view1(message: "from navigation2"))
            }, label: {
                Text("navigate1")
            })

            Button(action: {
                navigationState.navigate(to: .view2(message: "from navigation2"))
            }, label: {
                Text("navigate2")
            })

            Button(action: {
                navigationState.navigate(to: .view3(message: "from navigation2"))
            }, label: {
                Text("navigate3")
            })
            Button(action: {
                alertManager.show(alertType: .alert1(actions: []))
            }, label: {
                Text("show Alert")
            })
            Button(action: {
                toastManager.show("from sheet2")
            }, label: {
                Text("showToast")
            })
            Button(action: {
                navigationState.back()
            }, label: {
                Text("back")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.pink)
    }
}

struct NavigationView3: View {
    @Environment(\.sheetState)
    var sheetState: SheetPresentationManager
    @Environment(\.navigationState)
    var navigationState: NavigationRouter
    @Environment(\.alertManagerOnNavigation)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastPresentationManager

    let message: String
    var body: some View {
        VStack {
            Text("NavigationView3")
            Text("message: \(message)")

            Button(action: {
                sheetState.openSheet(.sheet1(id: UUID().uuidString, message: "onNavigation3"))
            }, label: {
                Text("open Sheet1")
            })
            Button(action: {
                sheetState.openSheet(.sheet2(id: UUID().uuidString, message: "onNavigation3"))
            }, label: {
                Text("open Sheet2")
            })
            Button(action: {
                sheetState.openSheet(.sheet3(id: UUID().uuidString, message: "onNavigation3"))
            }, label: {
                Text("open Sheet3")
            })
            Button(action: {
                navigationState.navigate(to: .view1(message: "from navigation3"))
            }, label: {
                Text("navigate1")
            })
            Button(action: {
                navigationState.navigate(to: .view2(message: "from navigation3"))
            }, label: {
                Text("navigate2")
            })
            Button(action: {
                navigationState.navigate(to: .view3(message: "from navigation3"))
            }, label: {
                Text("navigate3")
            })
            Button(action: {
                alertManager.show(alertType: .alert1(actions: []))
            }, label: {
                Text("show Alert")
            })
            Button(action: {
                toastManager.show("from sheet2")
            }, label: {
                Text("showToast")
            })
            Button(action: {
                navigationState.back()
            }, label: {
                Text("back")
            })
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple)
    }
}

#Preview {
    @Previewable @State
    var toastManager = ToastPresentationManager()
    @Previewable @State
    var alertManagerOnNavigation = AlertManager(isPresented: false, alertType: nil)
    @Previewable @State
    var sheetState = SheetPresentationManager(presentingSheet: nil)
    @Previewable @State
    var navigationState = NavigationRouter(views: [])
    @Previewable @State
    var alertManagerOnSheet = AlertManager(isPresented: false, alertType: nil)

    RootView()
        .environment(\.toastManager, toastManager)
        .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
        .environment(\.sheetState, sheetState)
        .environment(\.navigationState, navigationState)
        .environment(\.alertManagerOnSheet, alertManagerOnSheet)
}
