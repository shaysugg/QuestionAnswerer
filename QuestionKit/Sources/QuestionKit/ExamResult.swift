//
//  File.swift
//  
//
//  Created by Negar Tolou on 2/15/23.
//

import Foundation



public struct ExamResult: Identifiable {
    public typealias PassedCondition = (_ correct: Int, _ total: Int) -> Bool
    
    public let id = UUID()
    public let correctAnswerCount: Int
    public let totalQuestionCount: Int
    public var passedCondition: PassedCondition
    public var passed: Bool { passedCondition(correctAnswerCount, totalQuestionCount) }
}


extension ExamResult {
    public static func from(questions: [Question],
                            answers: [String: Int],
                            passedCondition: @escaping PassedCondition = greaterThanHalfPassedCondition)
    throws -> Self {
        guard questions.count == answers.count else {
            throw CreationError.notAllQuestionAnswered
        }
        
        var correctAnswerCount = 0
        questions.forEach { question in
            if question.correctAnswer == answers[question.id] { correctAnswerCount += 1 }
        }
        
        return ExamResult(correctAnswerCount: correctAnswerCount, totalQuestionCount: questions.count, passedCondition: passedCondition)
        
    }
    
    static public func greaterThanHalfPassedCondition(_ correct: Int, _ total: Int) -> Bool { correct > total / 2 }
    
    public enum CreationError: Error {
        case notAllQuestionAnswered
    }
}
