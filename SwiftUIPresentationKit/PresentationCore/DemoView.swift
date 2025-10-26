import SwiftUI

struct DemoView: View {
    @Environment(\.sheetState)
    private var _sheetState: SheetState
    @Environment(\.navigationState)
    private var _navigationState: NavigationState
    @Environment(\.alertManagerOnSheet)
    private var alertManagerOnSheet: AlertManager
    @Environment(\.alertManagerOnNavigation)
    private var alertManagerOnNavigation: AlertManager
    @Environment(\.toastManager)
    private var toastManager: ToastManager

    var body: some View {
        @Bindable var sheetState = _sheetState
        @Bindable var navigationState = _navigationState

        NavigationStack(path: $navigationState.views) {
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
            .navigationDestination(for: NavigationType.self) { navigationType in
                Group {
                    switch navigationType {
                    case let .view1(message): NavigationView1(message: message)
                    case let .view2(message): NavigationView2(message: message)
                    case let .view3(message): NavigationView3(message: message)
                    }
                }
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
    }
}

struct Sheet1: View {
    @Environment(\.sheetState)
    var sheetState: SheetState
    @Environment(\.navigationState)
    var navigationState: NavigationState
    @Environment(\.dismiss)
    var dismiss: DismissAction
    @Environment(\.alertManagerOnSheet)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastManager

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
    var sheetState: SheetState
    @Environment(\.dismiss)
    var dismiss: DismissAction
    @Environment(\.navigationState)
    var navigationState: NavigationState
    @Environment(\.alertManagerOnSheet)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastManager
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
    var sheetState: SheetState
    @Environment(\.dismiss)
    var dismiss: DismissAction
    @Environment(\.navigationState)
    var navigationState: NavigationState
    @Environment(\.alertManagerOnSheet)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastManager
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
    var sheetState: SheetState
    @Environment(\.navigationState)
    var navigationState: NavigationState
    @Environment(\.alertManagerOnNavigation)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastManager

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
    var sheetState: SheetState
    @Environment(\.navigationState)
    var navigationState: NavigationState
    @Environment(\.alertManagerOnNavigation)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastManager

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
    var sheetState: SheetState
    @Environment(\.navigationState)
    var navigationState: NavigationState
    @Environment(\.alertManagerOnNavigation)
    var alertManager: AlertManager
    @Environment(\.toastManager)
    var toastManager: ToastManager

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
    var toastManager = ToastManager()
    @Previewable @State
    var alertManagerOnNavigation = AlertManager(isPresented: false, alertType: nil)
    @Previewable @State
    var sheetState = SheetState(presentingSheet: nil)
    @Previewable @State
    var navigationState = NavigationState(views: [])
    @Previewable @State
    var alertManagerOnSheet = AlertManager(isPresented: false, alertType: nil)

    DemoView()
        .environment(\.toastManager, toastManager)
        .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
        .environment(\.sheetState, sheetState)
        .environment(\.navigationState, navigationState)
        .environment(\.alertManagerOnSheet, alertManagerOnSheet)
}
