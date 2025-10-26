import SwiftUI

@Observable
class NavigationManager {
    var path = NavigationPath() {
        didSet {
            save()
        }
    }

    /// The URL for the JSON file that stores the navigation path.
    private static var dataURL: URL {
        .documentsDirectory.appending(path: "NavigationPath.json")
    }

    init() {
        do {
            // Load the data model from the 'NavigationPath' data file found in the Documents directory.
            let path = try load(url: NavigationManager.dataURL)
            self.path = path
        } catch {
            // Handle error
        }
    }

    func save() {
        guard let codableRepresentation = path.codable else { return }
        let encoder = JSONEncoder()
        do {
            let data = try encoder.encode(codableRepresentation)
            try data.write(to: NavigationManager.dataURL)
        } catch {
            //Handle error.
        }
    }

    /// Load the navigation path from a previously saved data.
    func load(url: URL) throws -> NavigationPath {
        let data = try Data(contentsOf: url, options: .mappedIfSafe)
        let decoder = JSONDecoder()
        let path = try decoder.decode(NavigationPath.CodableRepresentation.self, from: data)
        return NavigationPath(path)
    }
}

enum Recipe: Identifiable, Hashable, Codable {
    case applePie
    case chocolateCake

    var id: Self { self }

    var description: String {
        switch self {
        case .applePie:
            return "Apple Pie"
        case .chocolateCake:
            return "Chocolate Cake"
        }
    }
}

struct RecipeDetailView: View {
    var recipe: Recipe

    var body: some View {
        Text(recipe.description)
    }
}

struct ContentView3: View {
    @State private var navigationManager = NavigationManager()


    var body: some View {
        NavigationStack(path: $navigationManager.path) {
            List {
                NavigationLink("Mint", value: Color.mint)
                NavigationLink("Red", value: Color.red)
                NavigationLink("Apple Pie", value: Recipe.applePie)
                NavigationLink("Chocolate Cake", value: Recipe.chocolateCake)
            }
            .navigationDestination(for: Color.self) { color in
                ColorDetail(color: color, text: color.description)
            }
            .navigationDestination(for: Recipe.self) { recipe in
                RecipeDetailView(recipe: recipe)
            }
        }
    }
}

#Preview {
    ContentView3()
}
