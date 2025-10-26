import SwiftUI

struct ContentView: View {
    var body: some View {
        DestinationViewByNavigationDestination2(favoriteColor: .blue)
    }
}

#Preview {
    ContentView()
}

struct DestinationViewByNavigationDestination2: View {
    @State private var showDetails = false
    var favoriteColor: Color

    var body: some View {
        NavigationStack {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color, text: color.description)
            }
        }
    }
}

struct DestinationViewByNavigationDestination: View {
    @State private var showDetails = false
    var favoriteColor: Color

    var body: some View {
        NavigationStack {
            VStack {
                Circle()
                    .fill(favoriteColor)
                Button("Show details") {
                    showDetails = true
                }
            }
            .navigationDestination(isPresented: $showDetails) {
                ColorDetail(color: favoriteColor, text: "hogehoge")
            }
        }
    }
}

struct DestinationViewByNavigationLink: View {
    var body: some View {
        NavigationStack {
            NavigationLink {
                ColorDetail(color: .mint, text: "Mint")
            } label: {
                Text("Mint")
            }

            NavigationLink {
                ColorDetail(color: .red, text: "Red")
            } label: {
                Text("Red")
            }
        }
    }
}


struct ColorDetail: View {
    var color: Color
    var text: String


    var body: some View {
        VStack {
            Text(text)
            color
        }
    }
}
