//
//  SecondViewController.swift
//  GestureRecognizerDemo
//
//  Created by Khalid Naseem on 15/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

//  GESTURE RECOGNIZER FUNCTIONALITY VIA IB (INTERFACE BUILDER):  SecondViewController:

import UIKit

class SecondViewController: UIViewController {
    
    @IBAction func handlePan(recognizer: UIPanGestureRecognizer) {
        let translation = recognizer.translationInView(self.view)
        if let view = recognizer.view {
            view.center = CGPoint(x: view.center.x + translation.x, y: view.center.y + translation.y)
        }
        
        recognizer.setTranslation(CGPointZero, inView: self.view)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

