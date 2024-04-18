import SwiftUI

struct ContentView: View {
    @State var matrix = Array(repeating: Array(repeating: "", count: 3), count: 3)
    @State var count = 0
    @State var winner: Array<Int>?
    @State var history: Array<Array<Int>> = []
    
    
    var body: some View {
        ZStack {
            Button(action: {
                matrix = Array(repeating: Array(repeating: "", count: 3), count: 3)
                count = 0
                winner = nil
                history = []
            }) {
                Image("reload")
                    .resizable()
                    .scaledToFit()
                    .frame(width: 50, height: 50)
            }.position(x: 200, y: 30)
            GridView(matrix: $matrix, count: $count, winner: $winner, history: $history).padding()
        }.background(Color.white)
    }
}

#Preview("Main") {
    ContentView()
}
