//
//  ViewController.swift
//  WorldTrotter
//
//  Created by Patrice Drayton on 2/23/22.
//

import UIKit

//make conversion view controller conform to UITextFieldDelegate

class ConversionViewController: UIViewController, UITextFieldDelegate {
    
    @IBOutlet var celsiusLabel: UILabel!
    //outlet to the text field for when the background view is tapped in order to dismiss keyboard
    @IBOutlet var textField: UITextField!
    
    
    //add a delegate method
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        print("Current text: \(String(describing: textField.text))")
        print("Replacement text: \(string)")
        
        return true
    }
    
    //add a property for the Fahrenheit Value
    //adding property observer to fahrenheit value. A property observer is used, which is code that is called whenever a property's value changes.  It is declared using curly braces immediately after property declaration.
    var fahrenheitValue: Measurement<UnitTemperature>? {
        didSet {
            updateCelsiusLabel()
        }
    }
    
    //computed property for the Celsius value:  if there is a fahrenheit value, it will be converted to the equivalent value in Celsius, otherwise nil is returned
    var celsiusValue: Measurement<UnitTemperature>? {
        if let fahrenheitValue = fahrenheitValue {
            return fahrenheitValue.converted(to: .celsius)
        } else {
            return nil
        }
    }
    
    //Updating the celsius label everytime the fahrenheit value changes. To do this, use a property observer on the fahrenheit value property
    func updateCelsiusLabel(){
        if let celsiusValue = celsiusValue {
            //modify to use the formatter
            celsiusLabel.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        } else {
            celsiusLabel.text = "???"
        }
    }
    
   

    //celsiusLabel to be updated when the app first launches
    override func viewDidLoad() {
        super.viewDidLoad()
        print("ConversionViewController loaded its view")
        updateCelsiusLabel()
    }
    
    
    
    //create an outlet to the Celsius text label and create an action for the text field to call when the text changes
    @IBAction func fahrenheitFieldEditingChanged(_ textField: UITextField) {
        print("Field input entered")
        
      // print(celsiusLabel.text!)
        //celsiusLabel.text = textField.text
        if let text = textField.text, let value = Double(text){
            fahrenheitValue = Measurement(value: value, unit: .fahrenheit)
        } else {
            fahrenheitValue = nil
        }
    }
    
    
    
    // Action to dismiss the keyboard
    @IBAction func dismissKeyboard(_ sender: UITapGestureRecognizer){
        textField.resignFirstResponder()
    }
  
    
    //Add a number formatter to truncate the celsius values
    //A closure is being used to instantiate the number formatter
    let numberFormatter: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.minimumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    
    
    
    
        
    
    //In order to have the gradient layer stretch the full length of the screen when phone switches from portrait to landscape, do not call function when app loads. At the time your view is first created, Auto Layout has not established the size of your view for your current device (or orientation). By setting the frame in layoutSubviews you always get the latest value for the size of the view.
    
    override func viewDidLayoutSubviews() {
            super.viewDidLayoutSubviews()
     
        
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

