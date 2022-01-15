//
//  ViewController.swift
//  QiuzTime!
//
//  Created by Антон Судаков on 14.01.2022.
//

import UIKit

var quizBrain = QuizBrain()

class ViewController: UIViewController {
    
    @IBOutlet weak var scoreLabel: UILabel! //Аутлет для показа очков игрока
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    @IBOutlet weak var firstAnswerButton: UIButton!
    @IBOutlet weak var thirdAnswerButton: UIButton!
    @IBOutlet weak var secondAnswerButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI() //Сразу же обновим вопрос с дефолтного текста лейбла
        
    }
    
    
    @IBAction func answerButtonPressed(_ sender: UIButton) { //Пользователь нажимает кнопку
            let userAnswer = sender.currentTitle //Варианты 1, 2 или 3
            let userGotItRight = quizBrain.checkAnswer(userAnswer!) // True or False
            
            if userGotItRight {
                sender.backgroundColor = UIColor.green
            } else{
                sender.backgroundColor = UIColor.red
            }
            
            quizBrain.nextQuestion()
            
            Timer.scheduledTimer(timeInterval: 3, target: self, selector: #selector(updateUI), userInfo: nil, repeats: false)
    }
    
    
    
    @objc func updateUI(){
        questionLabel.text = quizBrain.getQuestionText()
        progressBar.progress = quizBrain.getProgress()
        scoreLabel.text = "Score: \(quizBrain.updateScore())"
       
        firstAnswerButton.setTitle(quizBrain.getVariant(0), for: .normal)
        secondAnswerButton.setTitle(quizBrain.getVariant(1), for: .normal)
        thirdAnswerButton.setTitle(quizBrain.getVariant(2), for: .normal)
        
        firstAnswerButton.backgroundColor = UIColor.clear
        secondAnswerButton.backgroundColor = UIColor.clear
        thirdAnswerButton.backgroundColor = UIColor.clear
    }
}


