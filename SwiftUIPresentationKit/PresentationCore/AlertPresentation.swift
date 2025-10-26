import SwiftUI

struct AlertPresenterOnSheet<Content: View>: View {
    @Environment(\.alertManagerOnSheet) private var alertManager
    let content: Content

    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }

    var body: some View {
        content.alert(
            alertManager.alertType?.title ?? "",
            isPresented: Binding(
                get: { alertManager.isPresented },
                set: { alertManager.isPresented = $0 }
            ),
            presenting: alertManager.alertType,
            actions: { type in
                ForEach(type.actions, id: \.self) { action in
                    Button(action: action.action) { Text(action.title) }
                }
            },
            message: { type in
                if let msg = type.message { Text(msg) }
            }
        )
    }
}

struct AlertOnSheetModifier: ViewModifier {
    @Environment(\.alertManagerOnSheet) private var alertManager

    func body(content: Content) -> some View {
        content.alert(
            alertManager.alertType?.title ?? "",
            isPresented: Binding(
                get: { alertManager.isPresented },
                set: { alertManager.isPresented = $0 }
            ),
            presenting: alertManager.alertType,
            actions: { type in
                ForEach(type.actions, id: \.self) { action in
                    Button(action: action.action) { Text(action.title) }
                }
            },
            message: { type in
                if let msg = type.message {
                    Text(msg)
                }
            }
        )
    }
}

struct AlertOnNavigationModifier: ViewModifier {
    @Environment(\.alertManagerOnNavigation) private var alertManager

    func body(content: Content) -> some View {
        content.alert(
            alertManager.alertType?.title ?? "",
            isPresented: Binding(
                get: { alertManager.isPresented },
                set: { alertManager.isPresented = $0 }
            ),
            presenting: alertManager.alertType,
            actions: { type in
                ForEach(type.actions, id: \.self) { action in
                    Button(action: action.action) { Text(action.title) }
                }
            },
            message: { type in
                if let msg = type.message {
                    Text(msg)
                }
            }
        )
    }
}

// MARK: - View extension
extension View {
    func alertOnNavigation() -> some View {
        modifier(AlertOnNavigationModifier())
    }
    func alertOnSheet() -> some View {
        modifier(AlertOnSheetModifier())
    }
}

@Observable
class AlertManager {
    var isPresented: Bool
    var alertType: AlertType?

    init(isPresented: Bool, alertType: AlertType? = nil) {
        self.isPresented = isPresented
        self.alertType = alertType
    }

    func show(alertType: AlertType) {
        self.alertType = alertType
        self.isPresented = true
    }
}

enum AlertType: Hashable {
    case alert1(actions: [Action])
    case alert2(actions: [Action])

    var title: String {
        switch self {
        case .alert1: "title1"
        case .alert2: "title2"
        }
    }

    var message: String? {
        switch self {
        case .alert1: "title1"
        case .alert2: nil
        }
    }

    var actions: [Action] {
        switch self {
        case let .alert1(actions): actions
        case let .alert2(actions): actions
        }
    }

    struct Action: Hashable {
        let title: String
        let action: () -> Void

        static func == (lhs: AlertType.Action, rhs: AlertType.Action) -> Bool {
            lhs.title == rhs.title
        }

        func hash(into hasher: inout Hasher) {
            hasher.combine(title)
        }
    }
}

