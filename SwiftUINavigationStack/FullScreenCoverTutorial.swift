import SwiftUI

struct FullScreenCoverItemOnDismissContent: View {
    @State private var coverData: CoverData?


    var body: some View {
        Button("Present Full-Screen Cover With Data") {
            coverData = CoverData(body: "Custom Data")
        }
        .fullScreenCover(item: $coverData,
                         onDismiss: didDismiss) { details in
            VStack(spacing: 20) {
                Text("\(details.body)")
            }
            .onTapGesture {
                coverData = nil
            }
        }
    }


    func didDismiss() {
        // Handle the dismissing action.
    }


}

struct CoverData: Identifiable {
    var id: String {
        return body
    }
    let body: String
}

#Preview {
    FullScreenCoverItemOnDismissContent()
}
