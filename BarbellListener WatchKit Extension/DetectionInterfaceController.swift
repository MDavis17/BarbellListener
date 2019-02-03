//
//  DetectionInterfaceController.swift
//  BarbellListener WatchKit Extension
//
//  Created by Max Davis on 2/2/19.
//  Copyright © 2019 Max Davis. All rights reserved.
//

import WatchKit
import Foundation
import CoreMotion

class DetectionInterfaceController: WKInterfaceController {
    var motionManager = CMMotionManager()
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
    }
    
    override func didAppear() {
        super.didAppear()
        
        // check for updates every .2 seconds
        motionManager.accelerometerUpdateInterval = 0.2
        
        motionManager.startAccelerometerUpdates(to: OperationQueue.current!) { (data,error) in
            if let myData = data {
                print("x: \(myData.acceleration.x), y: \(myData.acceleration.y), z: \(myData.acceleration.z)")
            }
        }
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
        motionManager.stopAccelerometerUpdates()
    }
}
