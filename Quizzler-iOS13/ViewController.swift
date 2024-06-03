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
        Question(text: "Страна с самой высокой продолжительностью жизни - Китай", answer: "True"),
        Question(text: "В щи по старым русским рецептам добавляли простоквашу", answer: "True"),
        Question(text: "Большой зайцегуб – это летучая мышь", answer: "True"),
        Question(text: "Местожительства волка – это нора", answer: "False")
    ]
    
    var questionNumber = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        createQuestionLabel()

    }

    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        let userAnswer = sender.currentTitle
        let actualQuestion = quiz[questionNumber]
        let actualAnswer = actualQuestion.answer
        
        if userAnswer == actualAnswer {
            sender.backgroundColor = .green
        } else {
            sender.backgroundColor = .red
        }
        
        if questionNumber < (quiz.count-1) {
            questionNumber += 1
        } else {
            questionNumber = 0
        }
        
        Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    private func createQuestionLabel() {
        questionLabel.text = quiz[questionNumber].text
    }
    
    @objc func updateUI() {
        trueButton.backgroundColor = .clear
        falseButton.backgroundColor = .clear
        createQuestionLabel()
    }

}

