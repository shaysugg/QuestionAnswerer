//
//  File.swift
//  
//
//  Created by Shayan on 9/2/24.
//

import Foundation


@objc public class ExamResult: NSObject, Identifiable {
    public typealias PassedCondition = (_ correct: Int, _ total: Int) -> Bool
    
    @objc public let id = UUID()
    @objc public let correctAnswerCount: Int
    @objc public let totalQuestionCount: Int
    @objc public var passedCondition: PassedCondition
    @objc public var passed: Bool { passedCondition(correctAnswerCount, totalQuestionCount) }
    
    @objc init(correctAnswerCount: Int, totalQuestionCount: Int, passedCondition: @escaping PassedCondition) {
        self.correctAnswerCount = correctAnswerCount
        self.totalQuestionCount = totalQuestionCount
        self.passedCondition = passedCondition
    }
}

extension ExamResult {
    @objc public static func from(questions: [Question],
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
        
        return ExamResult(correctAnswerCount: correctAnswerCount, totalQuestionCount: questions.count, passedCondition: passedCondition) as! Self
        
    }
    
    @objc static public func greaterThanHalfPassedCondition(_ correct: Int, _ total: Int) -> Bool { correct > total / 2 }
    
    @objc public enum CreationError: Int, Error {
        case notAllQuestionAnswered
    }
}
