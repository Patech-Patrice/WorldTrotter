//
//  QuizViewController.swift
//  WorldTrotter
//
//  Created by Patrice Drayton on 2/24/22.
//

//
import UIKit

class QuizViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        print("QuizViewController loaded its view")
    }
    
    
    let questions: [String] = [
          "What is 7+7?",
          "What is the capital of Vermont?",
          "What is cognac made from?",
          "Which country invented ice cream?",
          "What is the loudest animal on Earth?",
          "What is Shakespeare's longest play?"
      ]
      let answers: [String] = [
          "14",
          "Montplier",
          "Grapes",
          "China",
          "Sperm Whale",
          "Hamlet"
          
      ]
  
      var currentQuestionIndex: Int = 0
    
    
    
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var answerLabel: UILabel!
    
    @IBAction func showNextQuestion(_sender: UIButton){
        print("Next Question button pressed")
        currentQuestionIndex += 1
               if currentQuestionIndex == questions.count {
                   currentQuestionIndex = 0
               }
               let question: String = questions[currentQuestionIndex]
               questionLabel.text = question
               answerLabel.text = "???"
        
    }
    
    @IBAction func showAnswer(_sender: UIButton){
        print("Show Answer button pressed")
        
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
        
    }
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



