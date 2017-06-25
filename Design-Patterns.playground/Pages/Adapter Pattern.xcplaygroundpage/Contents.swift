import Foundation

//Adapter Pattern

protocol DeathStarAiming
{
    var angleV: NSNumber { get }
    var angleH: NSNumber { get }
}


//Adaptee
struct NewPrecisionTargetMechanism: DeathStarAiming
{
    var angleV: Double
    var angleH: Double
    
    public func fire()
    {
        print("fire with new (V:\(angleV) & H: \(angleH)) ******* BOOM")
    }
}

//Adapter
struct SuperGun: DeathStarAiming
{
    private let targetMechanism: NewPrecisionTargetMechanism
  
    var angleV: NSNumber {
        return NSNumber(value: targetMechanism.angleV)
    }
    
    var angleH: NSNumber {
        return NSNumber(value: targetMechanism.angleH)
    }
    
    //Old mechanism
    init(angleV:NSNumber,angleH:NSNumber)
    {
        self.angleV = angleV
        self.angleH = angleH
    }
    
    //New mechanism
    init(newMechanism:NewPrecisionTargetMechanism) {
        self.targetMechanism = newMechanism
    }
    
    public func fire()
    {
        print("fire with super gun at (V:\(angleV) & H: \(angleH)) ******* BOOM")
    }
}


//Older way of calling
let superGun = SuperGun(angleV: 10, angleH: 15)
superGun.fire()


//New way of calling. Same super gun adapted new mechanism 
let newMechanism = NewPrecisionTargetMechanism(angleV: 11.0, angleH: 15.5)
let superGun2 = SuperGun(newMechanism: newMechanism)
superGun2.fire()
