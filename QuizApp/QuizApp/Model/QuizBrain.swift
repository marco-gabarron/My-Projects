//
//  QuizBrain.swift
//  QuizApp
//
//  Created by Gabarron on 05/11/2019.
//  Copyright © 2019 Marco Gabarron. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    private let quiz = [
        Question(q: "Question 1", a: true),
        Question(q: "Question 2", a: true),
        Question(q: "Question 3", a: false)
    ]
 
    private var score = 0
    private var questionNumber = 0
 
    mutating func checkAnswer(_ userAnswer: Bool) -> Bool{
        
        if userAnswer == quiz[questionNumber].rightAnswer{
            self.score += 1
            return true
        }else{
            return false
        }
        
    }
    
    func getQuestionText() -> String{
        
        return quiz[questionNumber].question
        
    }
    
    func getProgressBar() -> Float{
        
        return Float(questionNumber+1) / Float(quiz.count)
        
    }
    
    func getScore() -> Int {
        
        return score
        
    }
    
    mutating func nextQuestion(){
        
        
        if questionNumber < quiz.count-1{
            questionNumber += 1
            
        }else{
            questionNumber = 0
            self.score = 0
        }
        
        
    }
    
}

