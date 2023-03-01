//
//  File.swift
//  
//
//  Created by Negar Tolou on 2/15/23.
//

import Foundation

public struct Question: Identifiable, Hashable {
    
    public let id: String
    public let question: String
    public let answer1: String
    public let answer2: String
    public let answer3: String
    public let answer4: String
    public let correctAnswer: Int
    public let number: Int
    
    
    public var answers: [String] {
        [answer1, answer2, answer3, answer4]
    }
    
    public init(id: String, question: String, answer1: String, answer2: String, answer3: String, answer4: String, correctAnswer: Int, number: Int) {
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

extension Question: Decodable {}
