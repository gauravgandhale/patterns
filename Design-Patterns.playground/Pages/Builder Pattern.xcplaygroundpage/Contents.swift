import Foundation

//Builder Pattern
//https://www.tutorialspoint.com/design_pattern/builder_pattern.htm


protocol Packing {
    var pack:String { get }
}

class Wrapper : Packing {
    var pack:String {
        return "Wrapper"
    }
}

class Bottle : Packing {
    var pack: String {
        return "Bottle"
    }
}

protocol MealItem {
    var name:String { get }
    var price: Float { get }
    var pack: Packing { get }
}

protocol Burger : MealItem {
}

protocol ColdDrink : MealItem {
}

struct VegBurger: Burger {
    var name: String {
        return "Veg Burger"
    }
    
    var price: Float {
        return 10.0
    }
    
    var pack: Packing {
        return Wrapper()
    }
}

struct ChickenBurger: Burger {
    var name: String {
        return "Chicken Burger"
    }
    
    var price: Float {
        return 12.0
    }
    
    var pack: Packing {
        return Wrapper()
    }
}


struct Coke: ColdDrink{
    var name: String {
        return "Coke"
    }
    
    var price: Float {
        return 2.0
    }
    
    var pack: Packing {
        return Bottle()
    }
}

struct Pepsi: ColdDrink
{
    var name: String {
        return "Pepsi"
    }
    
    var price: Float {
        return 3.0
    }
    
    var pack: Packing {
        return Bottle()
    }
}

class Meal {
    var item:[MealItem] = []
    var mealCost: Float
    {
        var total:Float = 0.0
        for item in item {
            total += item.price
        }
        return total
    }
    func addItem(item: MealItem)
    {
        self.item.append(item)
    }
}


class MealBuilder {
    public static func getVegMeal() -> Meal
    {
    let meal = Meal()
    meal.addItem(item: VegBurger())
    meal.addItem(item: Coke())
    return meal
    }
    
    public static func getNonVegMeal() -> Meal
    {
        let meal = Meal()
        meal.addItem(item: ChickenBurger())
        meal.addItem(item: Pepsi())
        return meal
    }
}


let vegMeal = MealBuilder.getVegMeal()
vegMeal.mealCost

let nonVegMean = MealBuilder.getNonVegMeal()
nonVegMean.mealCost

