//
//  Question.swift
//  QiuzTime!
//
//  Created by Антон Судаков on 14.01.2022.
//

import UIKit

struct Question {
    let text: String
    let answer: [String]
    let correctAnswer: String
    init(q: String, a: [String], correctAnswer: String){
        text = q
        answer = a
        self.correctAnswer = correctAnswer
}
}

