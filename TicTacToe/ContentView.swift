import SwiftUI

struct ContentView: View {
    @State var matrix = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State var count = 0
    
    
    var body: some View {
        Button(action: {
            matrix = Array(repeating: Array(repeating: "", count: 3), count: 3)
        }) {
            Image("reload")
                .resizable()
                .scaledToFit()
                .frame(width: 50, height: 50)
        }
        Spacer()
        GridView(matrix: $matrix, count: $count).padding()
        Spacer()
    }
}

#Preview("Main") {
    ContentView()
}
