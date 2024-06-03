//
//  QuizBrain.swift
//  Quizzler-iOS13
//
//  Created by Alexander Bokhulenkov on 03.06.2024.
//  Copyright © 2024 The App Brewery. All rights reserved.
//

import Foundation

struct QuizBrain {
    
    let quiz = [
        Question(text: "Страна с самой высокой продолжительностью жизни - Китай", answer: "True"),
        Question(text: "В щи по старым русским рецептам добавляли простоквашу", answer: "True"),
        Question(text: "Большой зайцегуб – это летучая мышь", answer: "True"),
        Question(text: "Местожительства волка – это нора", answer: "False")
    ]
    
    var questionNumber = 0
    var score = 0
    
    mutating func checkAnswer(_ userAnswer: String) -> Bool {
//        userAnswer == quiz[questionNumber].answer ? true : false
        
        if userAnswer == quiz[questionNumber].answer {
            score += 1
            return true
        } else {
            score -= 1
            return false
        }
        
    }
    
    func getQuestionText() -> String {
        quiz[questionNumber].text
    }
    
    func getProgress() -> Float {
        Float(questionNumber) / Float(quiz.count)
    }
    
    mutating func nextQuestion() {
        if questionNumber < quiz.count - 1 {
            questionNumber += 1
        } else {
            questionNumber = 0
            score = 0
        }
    }
    
}
