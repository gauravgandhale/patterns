import UIKit

//Factory Pattern
//https://www.tutorialspoint.com/design_pattern/factory_pattern.htm

//Example 1

enum ShapeType { case circle, square, rectangle }

protocol Shape { func draw() }

struct Circle: Shape {
    func draw() { print("Circle: Draw Method") }
}

struct Square: Shape {
    func draw() { print("Square: Draw Method") }
}

struct Rectangle: Shape {
    func draw() { print("Rectangle: Draw Method") }
}

enum ShapeFactory {
    static func produce(_ type: ShapeType) -> Shape {
        switch type {
        case .circle: return Circle()
        case .square: return Square()
        case .rectangle: return Rectangle()
        }
    }
}

ShapeFactory.produce(.circle).draw()
ShapeFactory.produce(.square).draw()
ShapeFactory.produce(.rectangle).draw()


//Example 2

enum ColorType { case red, blue, green }

protocol Color { func fill() }

struct Red: Color {
    func fill() { print("Red: fill Method") }
}

struct Blue: Color {
    func fill() { print("Blue: fill Method") }
}

struct Green: Color {
    func fill() { print("Green: fill Method") }
}

enum ColorFactory {
    static func produce(_ type: ColorType) -> Color {
        switch type {
        case .red: return Red()
        case .blue: return Blue()
        case .green: return Green()
        }
    }
}

ColorFactory.produce(.red).fill()
ColorFactory.produce(.green).fill()
ColorFactory.produce(.blue).fill()
