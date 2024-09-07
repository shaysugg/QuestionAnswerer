//
//  File.swift
//  
//
//  Created by Shayan on 9/2/24.
//

import Foundation
import QuestionKit

@objc public class Question: NSObject {
    @objc public let id: String
    @objc public let question: String
    @objc public let answer1: String
    @objc public let answer2: String
    @objc public let answer3: String
    @objc public let answer4: String
    @objc public let correctAnswer: Int
    @objc public let number: Int
    
    @objc public var answers: [String] {
        [answer1, answer2, answer3, answer4]
    }
    
    @objc init(id: String, question: String, answer1: String, answer2: String, answer3: String, answer4: String, correctAnswer: Int, number: Int) {
        self.id = id
        self.question = question
        self.answer1 = answer1
        self.answer2 = answer2
        self.answer3 = answer3
        self.answer4 = answer4
        self.correctAnswer = correctAnswer
        self.number = number
    }
}
