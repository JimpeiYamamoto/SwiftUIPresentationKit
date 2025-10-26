import SwiftUI

struct ContentView4: View {
    @State private var presentInfo = true


    var body: some View {
        VStack {
            Text("origin")
            Button(action: {
                presentInfo.toggle()
            }, label: {
                Text("tap")
            })
        }
            .sheet(isPresented: $presentInfo) {
                VStack {
                    Text("hogehoge1")
                    Text("hogehoge2")
                    Text("hogehoge3")
                    Button(action: {
                        presentInfo.toggle()
                    }, label: {
                        Text("tap")
                    })
                }
                .presentationSizing(.form)
            }
            .frame(idealWidth: 200, idealHeight: 100)
    }
}

#Preview {
    ContentView4()
}
