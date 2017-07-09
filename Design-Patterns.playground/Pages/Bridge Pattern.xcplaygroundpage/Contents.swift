import Foundation

//Bridge Pattern


protocol Switch
{
    var appliance: Appliance { get set }
    func turnOn()
}

protocol Appliance
{
    func run()
}

class Remote: Switch
{
    var appliance: Appliance

    func turnOn()
    {
        appliance.run()
    }
    
    init(appliance: Appliance)
    {
        self.appliance = appliance
    }
}


class TV: Appliance
{
    func run() {
        print("TV turned ON")
    }
}


class Radio: Appliance
{
    func run() {
        print("Radio turned ON")
    }
}


//Usage

var tvRemote = Remote(appliance: TV())
tvRemote.turnOn()

var radioRemote = Remote(appliance: Radio())
radioRemote.turnOn()