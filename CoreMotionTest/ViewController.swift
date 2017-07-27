//
//  ViewController.swift
//  CoreMotionTest
//
//  Created by Kostyantyn Runduyev on 7/22/17.
//  Copyright © 2017 CuriousIT. All rights reserved.
//

import UIKit
import CoreMotion

class ViewController: UIViewController {
    
    let coremotionManager = CMMotionActivityManager()
//    let pedometr = CMPedometer()
//    let m = CMMotionManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        coremotionManager.startActivityUpdates(to: OperationQueue.main) { (motion) in
//            if let motion = motion {
//                print("")
                
//                if motion.unknown {
//                    print("\(motion.confidence.rawValue) \(motion.startDate) unknown!")
//                }
//                
//                if motion.stationary {
//                    print("\(motion.confidence.rawValue) \(motion.startDate) stattionary!")
//                }
//                
//                if motion.walking {
//                    print("\(motion.confidence.rawValue) \(motion.startDate) walking!")
//                }
//                
//                if motion.running {
//                    print("\(motion.confidence.rawValue) \(motion.startDate) running!")
//                }
//                
//                if motion.automotive {
//                    print("\(motion.confidence.rawValue) \(motion.startDate) automotive!")
//                }
//                
//                if motion.cycling {
//                    print("\(motion.confidence.rawValue) \(motion.startDate) cycling!")
//                }
//            }

        }
        
//        let interval: Int = 300
//        
//        let timer = Timer.scheduledTimer(withTimeInterval: TimeInterval(30), repeats: true) { (timer) in
//            
//            self.getMotionData(interval: interval)
//            
//        }
        
//        timer.fire()
        
            
            getMotionData(interval: 24*60*60)
        
    }
    
    func getMotionData(interval: Int) {
        
        let now = Date()
        let nowMinus5 = now.addingTimeInterval(TimeInterval(-interval))
        print("")
        print("\(nowMinus5) - \(now)")
        
        // create dateFormatter with UTC time format
        let dateFormatter = DateFormatter()

        // change to a readable time format and change to local time zone
        dateFormatter.dateFormat = "MM/dd/YY HH:mm:ss"
        dateFormatter.timeZone = TimeZone.current
        
        self.coremotionManager.queryActivityStarting(from: nowMinus5, to: now, to: OperationQueue.main) { (motions, error) in

            for motion in motions! {
                
                if motion.unknown {
                    print("\(motion.confidence.rawValue); \(dateFormatter.string(from: motion.startDate)); unknown")
                }
                
                if motion.stationary {
                    print("\(motion.confidence.rawValue); \(dateFormatter.string(from: motion.startDate)); stattionary")
                }
                
                if motion.walking {
                    print("\(motion.confidence.rawValue); \(dateFormatter.string(from: motion.startDate)); walking")
                }
                
                if motion.running {
                    print("\(motion.confidence.rawValue); \(dateFormatter.string(from: motion.startDate)); running")
                }
                
                if motion.automotive {
                    print("\(motion.confidence.rawValue); \(dateFormatter.string(from: motion.startDate)); automotive")
                }
                
                if motion.cycling {
                    print("\(motion.confidence.rawValue); \(dateFormatter.string(from: motion.startDate)); cycling")
                }
            }
        }
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

