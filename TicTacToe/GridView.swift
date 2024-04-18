import SwiftUI

var combs = [
    [0, 1, 2],
    [3, 4, 5],
    [6, 7, 8],
    [0, 3, 6],
    [1, 4, 7],
    [2, 5, 8],
    [0, 4, 8],
    [2, 4, 6],
];

func getWinner(matrix: Array<Array<String>>) -> Array<Int>? {
    let flattenedArray = matrix.flatMap { $0 }
    for comb in combs {
        
        if (!flattenedArray[comb[0]].isEmpty && !flattenedArray[comb[1]].isEmpty && !flattenedArray[comb[2]].isEmpty &&  flattenedArray[comb[0]] == flattenedArray[comb[1]] && flattenedArray[comb[1]] == flattenedArray[comb[2]]) {
            return comb
        }
        
    }
    return nil
}
struct GridStack<Content: View>: View {
    let rows: Int
    let columns: Int
    @ViewBuilder let content: (Int, Int) -> Content
    
    var body: some View {
        VStack {
            ForEach(0..<rows, id: \.self) { row in
                HStack {
                    ForEach(0..<columns, id: \.self) { column in
                        content(row, column)
                    }
                }
            }
        }.background(.gray)
        
    }
}


struct GridView: View {
    
    @Binding var matrix: Array<Array<String>>
    @Binding var count: Int
    @Binding var winner: Array<Int>?
    @Binding var history: Array<Array<Int>>
    
    var body: some View {
        ZStack {
            GridStack(rows: 3, columns: 3) { row, col in
                Text(matrix[row][col])
                    .opacity(count >= 6 && history[0][0] == row && history[0][1] == col ? 0.5 : 1)
                    .font(.system(size: 48))
                    .frame(minWidth: 100, minHeight: 100)
                    .background(.white)
                    .foregroundStyle(.gray)
                    .onTapGesture {
                        if (matrix[row][col] != "") {return}
                        if (winner != nil) {return}
                        let r = count % 2
                        matrix[row][col] = r == 0 ? "X" : "O"
                        count+=1
                        history.append([row,col])
                        
                        if (count > 6) {
                            let rowColToRemove = history[0]
                            print(rowColToRemove)
                            matrix[rowColToRemove[0]][rowColToRemove[1]] = ""
                            history.remove(at: 0)
                        }
            
                        winner = getWinner(matrix: matrix)
                    }
                
            }
            GameResultView(result: winner ?? [])
            
        }
    }
}


