import SwiftUI

struct PopoverExample: View {
    @State private var popover: PopoverModel?


    var body: some View {
        Button("Show Popover") {
            popover = PopoverModel(message: "Custom Message")
        }
//        .popover(item: $popover, attachmentAnchor: .point(.leading), arrowEdge: .top) { detail in
//            Text("\(detail.message)")
//                .padding()
//                .frame(height: 300)
//                .background(Color.yellow)
//        }
        .popover(item: $popover) { detail in
            Text("\(detail.message)")
                .padding()
                .frame(height: 300)
                .background(Color.yellow)
                .presentationCompactAdaptation(horizontal: .popover, vertical: .sheet)
        }
    }
}


struct PopoverModel: Identifiable {
    var id: String { message }
    let message: String
}

#Preview {
    PopoverExample()
}
