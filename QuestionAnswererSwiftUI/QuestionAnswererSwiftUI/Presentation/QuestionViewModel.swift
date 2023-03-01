//
//  QuestionViewModel.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/8/23.
//

import Foundation
import QuestionKit

class QuestionViewModel: ObservableObject {
    
    @Published private(set) var quetsions: [Question] = []
    @Published private(set) var answers: [String: Int] = [:]
    @Published var examResult: ExamResult?
    @Published var answeredAllQuestion: Bool = false
    
    
    func fetchQuestions() {
        QuestionKit.getQuestions { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let questions):
                    self?.quetsions = questions
                case .failure(let error):
                    //TODO: Error Handling
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    func answer(_ answerIndex: Int, forQuestionWithID questionID: String) {
        answers[questionID] = answerIndex
        answeredAllQuestion = quetsions.count == answers.count
    }
    
    func configureExamResult() {
        examResult = try? ExamResult.from(questions: quetsions, answers: answers)
    }
    
    func reset() {
        answers = [:]
        examResult = nil
        answeredAllQuestion = false
    }
}
