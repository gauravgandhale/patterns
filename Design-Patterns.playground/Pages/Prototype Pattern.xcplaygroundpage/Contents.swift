//: [Previous](@previous)

import Foundation

class UserPrototype
{
    var name: String
    var age: Int
    var sex: String
    
    init(name:String, age:Int, sex:String)
    {
        self.name = name
        self.age = age
        self.sex = sex
    }
    
    func clone() -> UserPrototype
    {
        return UserPrototype(name: name, age: age, sex: sex)
    }
}

let prototype = UserPrototype(name: "Gaurav", age: 30, sex: "male")
let user1 = prototype.clone()
let user2 = prototype.clone()
