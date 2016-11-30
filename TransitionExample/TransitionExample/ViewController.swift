//
//  ViewController.swift
//  TransitionExample
//
//  Created by Whitney Lauren on 11/29/16.
//  Copyright © 2016 Whitney Lauren. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let gTimer = GlobalTimer()

    
    override func viewDidAppear(_ animated: Bool) {
        gTimer.updateGlobalTimer(duration: 20, timerEnded: { () -> Void in
            self.globalTransition()
         
            // Here you call anything you want when the timer finish.
            print("Finished")
            
        }, timerInProgress: { (elapsedTime) -> Void in
            print("\(Int(elapsedTime))")
        })
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        

    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    func globalTransition() {
        print("Are you working?")
        let secondVC = self.storyboard?.instantiateViewController(withIdentifier: "secondVC") as! SecondViewController
        
        self.present(secondVC, animated: false, completion: nil)
            
        
        // Do any additional setup after loading the view, typically from a nib.
    }

}
