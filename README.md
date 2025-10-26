# SwiftUIPresentationKit

A template project for managing the presentation layer in SwiftUI applications.
- Push navigation
- Modal presentation
- Alert presentation
- Toast notification

Leverages NavigationStack, Observation, and Environment to achieve type-safe screen navigation and presentation management.

## Overview

This template minimizes dependencies between screens by hiding implementation details of destination Views from the caller, achieving a loosely coupled architecture. It also centralizes management of Sheets, Navigation, Alerts, and Toasts, making them accessible throughout the app via Environment.

```swift
// Caller only needs to pass minimal information
navigationRouter.navigate(to: .userDetail(userId: "123"))
sheetManager.openSheet(.settings)
alertManager.show(alertType: .confirmation(actions: [...]))
toastManager.show("Saved")
```

## Basic Setup

```swift
@main
struct YourApp: App {
    @State private var sheetManager = SheetPresentationManager(presentingSheet: nil)
    @State private var navigationRouter = NavigationRouter(views: [])
    @State private var alertManagerOnNavigation = AlertManager(isPresented: false, alertType: nil)
    @State private var alertManagerOnSheet = AlertManager(isPresented: false, alertType: nil)
    @State private var toastManager = ToastPresentationManager()

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
            .environment(\.sheetManager, sheetManager)
            .environment(\.navigationRouter, navigationRouter)
            .environment(\.alertManagerOnNavigation, alertManagerOnNavigation)
            .environment(\.alertManagerOnSheet, alertManagerOnSheet)
            .environment(\.toastManager, toastManager)
        }
    }
}
```

## Usage

### Navigation

Implement screen navigation concisely:

```swift
@Environment(\.navigationRouter) var navigationRouter

// Navigate
navigationRouter.navigate(to: .userDetail(userId: "123"))

// Go back
navigationRouter.back()
```

Define destinations with NavigationType:

```swift
enum NavigationType: Hashable {
    case userDetail(userId: String)

    @ViewBuilder
    func makeView() -> some View {
        switch self {
        case let .userDetail(userId):
            UserDetailView(userId: userId)
        }
    }
}
```

### Sheet

Implement sheet presentation concisely:

```swift
@Environment(\.sheetManager) var sheetManager

// Present sheet
sheetManager.openSheet(.settings)
```

Define content with SheetType:

```swift
enum SheetType: Identifiable {
    case settings

    var id: String {
        switch self {
        case .settings: return "settings"
        }
    }

    @ViewBuilder
    func makeView() -> some View {
        switch self {
        case .settings:
            SettingsView()
        }
    }
}
```

### Alert

Implement alert presentation concisely. Separated for Sheet and Navigation contexts:

```swift
// In navigation screen
@Environment(\.alertManagerOnNavigation) var alertManager

// In sheet
@Environment(\.alertManagerOnSheet) var alertManager

// Show alert
alertManager.show(alertType: .confirmation(actions: [
    AlertType.Action(title: "OK") { /* ... */ }
]))
```

### Toast

Implement toast notification concisely:

```swift
@Environment(\.toastManager) var toastManager

// Show toast (auto-dismiss after 5 seconds)
toastManager.show("Saved")
```
