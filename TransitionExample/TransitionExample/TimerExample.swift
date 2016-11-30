//
//  TimerExample.swift
//  TransitionExample
//
//  Created by Whitney Lauren on 11/29/16.
//  Copyright © 2016 Whitney Lauren. All rights reserved.
//

import Foundation

import UIKit



class GlobalTimer: NSObject {
    
    var globalTimer : Timer! = Timer()
    var seconds: Int = 0
    
    var timerEndedCallback: (() -> Void)!
    var timerInProgressCallback: ((_ elapsedTime: Int) -> Void)!
    
    func updateGlobalTimer(duration: Int, timerEnded: @escaping () -> Void, timerInProgress: ((_ elapsedTime: Int) -> Void)!) {
        
        if !(self.globalTimer?.isValid != nil) {
            
            
            globalTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: (#selector(track)), userInfo: duration, repeats: true)
            timerEndedCallback = timerEnded
            timerInProgressCallback = timerInProgress
            seconds = 0
        }
        
//        if #available(iOS 10.0, *) {
//            globalTimer = Timer.scheduledTimer(withTimeInterval: 1.0, repeats: true, block: {_ in self.track() })
//            print(self.seconds)
//            if (seconds == 20) {
//                globalTimer?.invalidate()
//            }} else {
//            globalTimer = Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: (#selector(track)), userInfo: nil, repeats: true)
//           
//        }
        
    }
    
    func track(timer: Timer ) {
        print(self.seconds)

        let duration = timer.userInfo as! Int
        
        if (self.seconds != duration) {
            self.seconds += 1
            
            
        } else {
            globalTimer?.invalidate()
            timerEndedCallback()
        }
//        if (seconds == 20) {
//            globalTimer?.invalidate()
//            print("Timer has stopped.  Lit no more")
//            print("Should navigate back to log in screen")
//         
//            
//            
//        } else {
//            self.seconds += 1
        
        }
    }

    

