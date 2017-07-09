import Foundation
//https://www.tutorialspoint.com/design_pattern/filter_pattern.htm

enum MartialStatus
{
    case single, married, divorced
}

enum Gender
{
    case male, female, other
}
struct Person
{
    var name:String
    var gender:Gender
    var status:MartialStatus
}

protocol Criteria
{
    func meetsCriteria(list: [Person]) -> [Person]
}

class SingleCriteria: Criteria
{
    func meetsCriteria(list: [Person]) -> [Person] {
        return list.filter{ $0.status == .single }
    }
}
class MarriedCriteria: Criteria
{
    func meetsCriteria(list: [Person]) -> [Person] {
        return list.filter{ $0.status == .married }
    }
}

class MaleCriteria: Criteria
{
    func meetsCriteria(list: [Person]) -> [Person] {
        return list.filter{ $0.gender == .male }
    }
}

class FemaleCriteria: Criteria
{
    func meetsCriteria(list: [Person]) -> [Person] {
        return list.filter{ $0.gender == .female }
    }
}

class ANDCriteria: Criteria
{
    var criteria1: Criteria
    var criteria2: Criteria
    
    init (criteria1: Criteria, criteria2:Criteria) {
        self.criteria1 = criteria1
        self.criteria2 = criteria2
    }
    
    func meetsCriteria(list: [Person]) -> [Person] {
        let criteriaOneList = criteria1.meetsCriteria(list: list)
        return criteria2.meetsCriteria(list:criteriaOneList)
    }
}

let list = [Person(name: "Rob", gender: .male, status: .single),
            Person(name: "Deepak", gender: .male, status: .married),
            Person(name: "Ricardo", gender: .male, status: .married),
            Person(name: "Martin", gender: .male, status: .single),
            Person(name: "Veronica", gender: .female, status: .single),
            Person(name: "Sherlie", gender: .female, status: .single),
            Person(name: "Deepali", gender: .female, status: .married),
            Person(name: "Aarti", gender: .female, status: .married),
            Person(name: "Gaurav", gender: .male, status: .married),
            Person(name: "Tuhina", gender: .female, status: .married),
            Person(name: "Harveen", gender: .female, status: .married),
            Person(name: "Hasmik", gender: .female, status: .single),
            Person(name: "Wei", gender: .female, status: .married)]


SingleCriteria().meetsCriteria(list: list)
MarriedCriteria().meetsCriteria(list: list)
MaleCriteria().meetsCriteria(list: list)
FemaleCriteria().meetsCriteria(list: list)
ANDCriteria(criteria1: SingleCriteria(), criteria2: FemaleCriteria()).meetsCriteria(list: list)



