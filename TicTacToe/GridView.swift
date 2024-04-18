import SwiftUI

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
    
    var body: some View {
        
        GridStack(rows: 3, columns: 3) { row, col in
            
            Text(matrix[row][col]).font(.system(size: 48)).frame(minWidth: 100, minHeight: 100).background(.white)
                .foregroundStyle(.gray).onTapGesture {
                    if (matrix[row][col] != "") {return}
                    let r = count % 2
                    matrix[row][col] = r == 0 ? "X" : "O"
                    count+=1
                }
            
            
        }
    }
}


