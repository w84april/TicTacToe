import SwiftUI


var coordinates = [
    [0, 1, 2]: [40, 255, 320, 255],
    [3, 4, 5]: [40, 362.5, 320, 362.5],
    [6, 7, 8]: [40, 471, 320, 471],
    [0, 3, 6]: [72, 220, 72, 510],
    [1, 4, 7]: [180, 220, 180, 510],
    [2, 5, 8]: [288, 220, 288, 510],
    [0, 4, 8]: [40, 220, 320, 505],
    [2, 4, 6]: [320, 220, 40, 505],
];

struct GameResultView: View {
    
    let result: Array<Int>?
    
    var points: Array<Double>?
    
    
    init(result: Array<Int>) {
        self.result = result
        points = coordinates[result] ?? nil
    }
    
    
    var body: some View {
        Group {
             if (points != nil){
                Path() { path in
                    path.move(to: CGPoint(x: points?[0] ?? 0, y: points?[1] ?? 0))
                    path.addLine(to: CGPoint(x: points?[2] ?? 0, y: points?[3] ?? 0))
                    
                }
                .stroke(Color.green, lineWidth: 5)
            } else {
                EmptyView()
            }
        }
        
    }
}
