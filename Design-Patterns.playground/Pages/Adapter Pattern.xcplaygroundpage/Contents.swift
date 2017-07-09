import Foundation

//Adapter Pattern

/**
 The idea here is OlderGun with DeathStarAiming should adapt the newer NewPrecisionTargetMechanism
 */


protocol DeathStarAiming
{
    var angleV: NSNumber { get }
    var angleH: NSNumber { get }
}


//Adaptee
struct NewPrecisionTargetMechanism
{
    var angleV: Double
    var angleH: Double
    
    public func fire()
    {
        print("New Mechanism: \(angleV) and \(angleH)")
    }
}

//Adapter
struct OlderGun: DeathStarAiming
{
    private let targetMechanism: NewPrecisionTargetMechanism
  
    var angleV: NSNumber {
        return NSNumber(value: targetMechanism.angleV)
    }
    
    var angleH: NSNumber {
        return NSNumber(value: targetMechanism.angleH)
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


//Usage
let newMechanism = NewPrecisionTargetMechanism(angleV: 11.0, angleH: 15.5)
newMechanism.fire()

let superGun2 = OlderGun(newMechanism: newMechanism)
superGun2.fire()
