//
//  ViewController.swift
//  Quiz
//
//  Created by Robert Wong on 5/15/17.
//  Copyright © 2017 Robert Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var nextQuestionLabel: UILabel!
    @IBOutlet var currentQuestionLabel: UILabel!
    
    @IBOutlet var nextQuestionLabelCenterXConstraint: NSLayoutConstraint!
    @IBOutlet var currentQuestionLabelCenterXConstraint: NSLayoutConstraint!
    
    let questions: [String] = [
        "What is 7+7?",
        "What is the capital of Vermont?",
        "What is cognac made from?"
    ]
    
    let answers: [String] = [
        "14",
        "Montpelier",
        "Grapes"
    ]
    
    var currentQuestionIndex: Int = 0
    
    func animateLabelTransitions() {
        
        //force any outstanding layout changes to occur
        view.layoutIfNeeded()
        
        //Animate the alpha
        //and the center X constraints
        let screenWidth = view.frame.width
        self.nextQuestionLabelCenterXConstraint.constant = 0
        self.currentQuestionLabelCenterXConstraint.constant += screenWidth
        
//        UIView.animate(withDuration: 0.5,
//                     delay: 0,
//                     options: [.curveLinear],
//                     animations :{
//                        self.currentQuestionLabel.alpha = 0
//                        self.nextQuestionLabel.alpha = 1
//                        
//                        self.view.layoutIfNeeded()
//            },
          UIView.animate(withDuration: 0.5,
                           delay: 0,
                           //usingSpringWithDamping double: where higher values make the bouncing finish faster
                           usingSpringWithDamping: 0.5,
                           //initalSpringVelocity double: gives the inital spring momementum
                           initialSpringVelocity: 5,
                           //usingSpringWithDamping dampingRatio: CGFloat,
                           //initialSpringVelocity velocity: CGFloat,
                           options: [.curveLinear],
                           animations: {self.currentQuestionLabel.alpha = 0
                           self.nextQuestionLabel.alpha = 1
                           self.view.layoutIfNeeded()
            },
                     completion: {_ in
                        swap(&self.currentQuestionLabel,
                             &self.nextQuestionLabel)
                        swap(&self.currentQuestionLabelCenterXConstraint,
                             &self.nextQuestionLabelCenterXConstraint)
                        
                        self.updateOffScreenLabel()
        })
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        //Set the label's inital to alpha
        nextQuestionLabel.alpha = 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        currentQuestionLabel.text = questions[currentQuestionIndex]
        
        updateOffScreenLabel()
    }
    
    func updateOffScreenLabel() {
        let screenWidth = view.frame.width
        nextQuestionLabelCenterXConstraint.constant = -screenWidth
    }

    @IBAction func showNextQuestion(_sender: UIButton){
        currentQuestionIndex += 1
        if currentQuestionIndex == questions.count {
            currentQuestionIndex = 0
        }
        
        let question: String = questions[currentQuestionIndex]
        nextQuestionLabel.text = question
        answerLabel.text = "???"
        
        animateLabelTransitions()
    }
    
    @IBAction func showAnswer(_sender: UIButton){
        let answer: String = answers[currentQuestionIndex]
        answerLabel.text = answer
    }

}

