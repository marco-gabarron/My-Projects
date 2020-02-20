//
//  File.swift
//  QuizApp
//
//  Created by Gabarron on 05/11/2019.
//  Copyright © 2019 Marco Gabarron. All rights reserved.
//

import Foundation

struct Question {
    
    var question: String
    var rightAnswer: Bool
    
    init(q: String, a: Bool) {
        question = q
        rightAnswer = a
    }
    
}
