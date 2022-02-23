//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Patrice Drayton on 2/23/22.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        
       //To create a gradiant use CAGradient Layer to create an object
        let gradientLayer = CAGradientLayer()
        //set layer frame to be the same as the bounds of the view controller's view
        gradientLayer.frame = view.bounds
        //Supply an array of colors in the order they will be displayed on the screen
        gradientLayer.colors = [
            UIColor.systemPink.cgColor,
            UIColor.systemOrange.cgColor,
            UIColor.systemPink.cgColor,
            UIColor.systemOrange.cgColor
            
        ]
        
        //Add as a sublayer to the view to allow the labels to be visible on top of the gradient background
        view.layer.insertSublayer(gradientLayer, at: 0)
    }


}

