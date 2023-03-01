//
//  Mocks.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/8/23.
//

import Foundation
import QuestionKit

enum Mocks {
    static var questions: [Question] {
        [
            Question(id: "0", question: "question is about that?", answer1: "Answer 1", answer2: "Answer 2", answer3: "Answer 3", answer4: "Answer 4", correctAnswer: 1, number: 1),
            Question(id: "1", question: "question is about that 2?", answer1: "Answer 1", answer2: "Answer 2", answer3: "Answer 3", answer4: "Answer 4", correctAnswer: 1, number: 1),
            Question(id: "2", question: "question is about that 3?", answer1: "Answer 1", answer2: "Answer 2", answer3: "Answer 3", answer4: "Answer 4", correctAnswer: 1, number: 1)
        ]
    }
    
    static var passedResult: ExamResult {
        try! ExamResult.from(questions: questions, answers: ["0": 1, "1": 1, "2": 1])
    }
    
    static var failedResult: ExamResult {
        try! ExamResult.from(questions: questions, answers: ["0": 100, "1": 1, "2": 100])
    }
}
