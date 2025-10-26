import SwiftUI

@Observable
class SheetPresentationManager {
    var presentingSheet: SheetType?

    init(presentingSheet: SheetType?) {
        self.presentingSheet = presentingSheet
    }

    func openSheet(_ sheet: SheetType) {
        self.presentingSheet = sheet
    }
}

enum SheetType: Identifiable {
    case sheet1(id: String, message: String)
    case sheet2(id: String, message: String)
    case sheet3(id: String, message: String)

    var id: String {
        switch self {
        case let .sheet1(id, _): return "sheet1_\(id)"
        case let .sheet2(id, _): return "sheet2_\(id)"
        case let .sheet3(id, _): return "sheet3_\(id)"
        }
    }

    @ViewBuilder
    func makeView() -> some View {
        switch self {
        case let .sheet1(_, message): Sheet1(message: message)
        case let .sheet2(_, message): Sheet2(message: message)
        case let .sheet3(_, message): Sheet3(message: message)
        }
    }
}
