//
//  ViewController.swift
//  QuizApp
//
//  Created by Gabarron on 05/11/2019.
//  Copyright © 2019 Marco Gabarron. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    //IBOutlets
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
       updateUI()
        
    }
    
    //Answer Chosen by User
    @IBAction func answerPressed(_ sender: UIButton) {
        
        let userAnswer: Bool
        if sender.tag == 1{
            userAnswer = true
        }else{
            userAnswer = false
        }
        
        let checkedAnswer = quizBrain.checkAnswer(userAnswer)
        
        if checkedAnswer {
            sender.backgroundColor = UIColor.green
        }else{
            sender.backgroundColor = UIColor.red
        }
        
        quizBrain.nextQuestion()
        
        Timer.scheduledTimer(timeInterval: 0.4, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    @objc func updateUI(){
        
        //Display Score
        scoreLabel.text = "Score: \(quizBrain.getScore())"
        
        //Update Question Displayed
        questionLabel.text = quizBrain.getQuestionText()
        
        //Reset buttons background color
        trueButton.backgroundColor = UIColor.clear
        falseButton.backgroundColor = UIColor.clear
        
        //Update Progress Bar
        progressBar.setProgress(quizBrain.getProgressBar(), animated: true)
    }
    

}

