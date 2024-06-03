//
//  ViewController.swift
//  Quizzler-iOS13
//
//  Created by Angela Yu on 12/07/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var trueButton: UIButton!
    @IBOutlet weak var falseButton: UIButton!
    
    let quiz = [
    ["Страна с самой высокой продолжительностью жизни - Китай", "True"],
    ["В щи по старым русским рецептам добавляли простоквашу", "True"],
    ["Большой зайцегуб – это летучая мышь", "True" ],
    ["Местожительства волка – это нора", "False"]
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createQuestionLabel()
    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualAnswer = quiz[questionNumber][1]
        
        if userAnswer == actualAnswer {
            print("Right!")
        } else {
            print("Wrong!")
        }
        
        if questionNumber < (quiz.count-1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        createQuestionLabel()
    }
    
    private func createQuestionLabel() {
        questionLabel.text = quiz[questionNumber][0]
        
    }
    

}

