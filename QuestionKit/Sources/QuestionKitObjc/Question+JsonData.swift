//
//  File.swift
//
//
//  Created by Shayan on 9/3/24.
//

import Foundation

@objc extension Question {
    @objc public static func fromJsonData(_ data: Dictionary<String, Any>) -> Self? {
        guard let id = data["id"] as? String,
              let question = data["question"] as? String,
              let answer1 = data["answer1"] as? String,
              let answer2 = data["answer2"] as? String,
              let answer3 = data["answer3"] as? String,
              let answer4 = data["answer4"] as? String,
              let correctAnswer = data["correctAnswer"] as? Int,
              let number = data["number"] as? Int
        else {
            return nil
        }
        
        return Question(id: id, question: question, answer1: answer1, answer2: answer2, answer3: answer3, answer4: answer4, correctAnswer: correctAnswer, number: number) as? Self
    }
}
