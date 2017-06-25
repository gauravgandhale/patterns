//: [Previous](@previous)

import Foundation

class DeathStarSuperlaser
{
    static let sharedInstance = DeathStarSuperlaser()
    
    private init()
    {
        print("prepare")
    }
    
    public func fire()
    {
        print("zzzzzzzzzzzzzzzzz *BOOM*")
    }
}


DeathStarSuperlaser.sharedInstance.fire()
DeathStarSuperlaser.sharedInstance.fire()
DeathStarSuperlaser.sharedInstance.fire()
DeathStarSuperlaser.sharedInstance.fire()
DeathStarSuperlaser.sharedInstance.fire()