import Foundation

protocol Shape
{
    func draw(fillColor: String)
}

class Circle: Shape
{
    func draw(fillColor: String) {
        print("Draw Circle with \(fillColor)")
    }
}
class Square: Shape
{
    func draw(fillColor: String) {
        print("Draw Square with \(fillColor)")
    }
}

final class Whiteboard : Shape {
    lazy var shapes = [Shape]()
    
    init(_ shapes:Shape...) {
        self.shapes = shapes
    }
    
    func draw(fillColor: String) {
        for shape in self.shapes {
            shape.draw(fillColor: fillColor)
        }
    }
}

var whiteboard = Whiteboard(Circle(), Square())
whiteboard.draw(fillColor:"Red")