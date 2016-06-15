//
//  FirstViewController.swift
//  GestureRecognizerDemo
//
//  Created by Khalid Naseem on 15/06/2016.
//  Copyright © 2016 Khalid Naseem. All rights reserved.
//

//  GESTURE RECOGNIZER PROPERTIES AND FUNCTIONS WITH CODING:  FirstViewController:
import UIKit

class FirstViewController: UIViewController {
    
    var squareView: UIView!
    
    override func viewDidLoad() {
        
        squareView = UIView(frame: CGRect(x: 150, y: 250, width: 100, height: 100))
        squareView.backgroundColor = UIColor.blueColor()
        
        
        view.addSubview(squareView)
        
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        let panGesture = UIPanGestureRecognizer(target: self, action: #selector(FirstViewController.handlePan(_:)))
        
        // This adds multiple gesture recognizers to the square view. and above also.
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(FirstViewController.handleTap(_:)))
        
        let rotateGesture = UIRotationGestureRecognizer(target: self, action: #selector(FirstViewController.handleRotation(_:)))
        
        let pinchGesture = UIPinchGestureRecognizer(target: self, action: #selector(FirstViewController.handlePinch(_:)))
        
        
        squareView.gestureRecognizers = [panGesture, tapGesture, rotateGesture, pinchGesture]
    }
    
    //This will result in the square view moving along with your finger as you drag on the screen.
    
    func handlePan(recognizer: UIPanGestureRecognizer) {
        let translationInView = recognizer.translationInView(self.view)
        recognizer.view!.center = CGPoint(x:view.center.x + translationInView.x, y:view.center.y + translationInView.y)
    }
    
    func handleTap(gesture: UITapGestureRecognizer) {
        let red = CGFloat(drand48())
        let green = CGFloat(drand48())
        let blue = CGFloat(drand48())
        gesture.view?.backgroundColor = UIColor(red: red, green: green, blue: blue, alpha: 1.0)
    }
    
    func handleRotation(recognizer: UIRotationGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformRotate(view.transform, recognizer.rotation)
            recognizer.rotation = 5
        }
    }
    
    func handlePinch(recognizer : UIPinchGestureRecognizer) {
        if let view = recognizer.view {
            view.transform = CGAffineTransformScale(view.transform, recognizer.scale, recognizer.scale)
            recognizer.scale = 1
        }
    }

    
    //  instantiates the pan gesture recognizer:
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

