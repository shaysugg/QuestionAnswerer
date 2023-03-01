//
//  File.swift
//  
//
//  Created by Negar Tolou on 2/15/23.
//

import Foundation


public struct ExamResult: Identifiable {
    public let id = UUID()
    public var passed: Bool { correctAnswerCount > totalQuestionCount / 2 }
    public let correctAnswerCount: Int
    public let totalQuestionCount: Int
    
    
}

extension ExamResult {
    public static func from(questions: [Question], answers: [String: Int]) throws -> Self {
        guard questions.count == answers.count else {
            throw CreationError.notAllQuestionAnswered
        }
        
        var correctAnswerCount = 0
        questions.forEach { question in
            if question.correctAnswer == answers[question.id] { correctAnswerCount += 1 }
        }
        
        return ExamResult(correctAnswerCount: correctAnswerCount, totalQuestionCount: questions.count)
        
    }
    
    public enum CreationError: Error {
        case notAllQuestionAnswered
    }
}
