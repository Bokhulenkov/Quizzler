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
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var scoreLabel: UILabel!
    
    var quizBrain = QuizBrain()
    
//    MARK: - Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updeteUI()

    }

//    MARK: - Helpers
    
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        updeteUI()
        
        guard let userAnswer = sender.currentTitle else { return }
        print("userAnswer \(userAnswer)")
        quizBrain.checkAnswer(userAnswer)
        
        
    }
    
    func optionsAnswers() {
        let answer = quizBrain.getOptionsAnswers()
        firstAnswerButton.setTitle(answer[0], for: .normal)
        secondAnswerButton.setTitle(answer[1], for: .normal)
        thirdAnswerButton.setTitle(answer[2], for: .normal)
    }
    
    func updeteUI() {
        quizBrain.nextQuestion()
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        optionsAnswers()
    }

}

