//: [Previous](@previous)

import Foundation

//Abstract Factory Pattern
//https://www.tutorialspoint.com/design_pattern/abstract_factory_pattern.htm

enum ProductType
{
    enum Color { case red, blue, green }
    enum Shape { case circle, square, rectangle }
}

//Product Type 1
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

//Product Type 2
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

// Factory Pattern
enum ShapeFactory {
    static func produce(_ type: ProductType.Shape) -> Shape {
        switch type {
        case .circle: return Circle()
        case .square: return Square()
        case .rectangle: return Rectangle()
        }
    }
}
// Factory Pattern
enum ColorFactory {
    static func produce(_ type: ProductType.Color) -> Color {
        switch type {
        case .red: return Red()
        case .green: return Green()
        case .blue: return Blue()
        }
    }
}
// Abstract Factory Pattern
enum FactoryHelper
{
    static func shapeFactory(_ type: ProductType.Shape) -> Shape {
        return ShapeFactory.produce(type)
    }
    static func colorFactory(_ type: ProductType.Color) -> Color {
        return ColorFactory.produce(type)
    }
}

FactoryHelper.colorFactory(.red).fill()
FactoryHelper.colorFactory(.green).fill()
FactoryHelper.shapeFactory(.circle).draw()
