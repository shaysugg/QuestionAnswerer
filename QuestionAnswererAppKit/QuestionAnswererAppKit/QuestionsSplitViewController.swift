//
//  QuestionsViewController.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 3/11/23.
//

import Cocoa
import QuestionKit

class QuestionsSplitViewController: NSSplitViewController, NSToolbarDelegate {
    
    lazy var questionListViewController: QuestionListViewController = {
        children[0] as! QuestionListViewController
    }()
    lazy var questionAnswerViewController: QuestionAnswersViewController = {
        children[1] as! QuestionAnswersViewController
    }()
    
    
    private(set) var questions = [Question]()
    private(set) var answers = [String: Int]() { didSet {
        answersChanged?(answers)
    } }
    var answersChanged: (([String: Int]) -> Void)?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadQuestionList()
        handleQuestionSelection()
        handleQuestionAnswering()
    }
    
    func loadQuestionList() {
        QuestionKit.getQuestions { [weak self] result in
            DispatchQueue.main.async {
                switch result {
                case .success(let questions):
                    self?.questions = questions
                    self?.questionListViewController.questions = questions
                case .failure(let failure):
                    print(failure) //TODO: Error Handling
                }
            }
            
        }
    }
    
    func handleQuestionSelection() {
        questionListViewController.questionSelected = { [weak self] question in
            self?.questionAnswerViewController.question = question
            self?.questionAnswerViewController.answerIndex = self?.answers[question.id]
        }
    }
    
    func handleQuestionAnswering() {
        questionAnswerViewController.answerSelected = { [weak self] id, answerIndex in
            self?.answers[id] = answerIndex
        }
    }
    
    
    func submitAnswers() {
        let result = try! ExamResult.from(questions: questions, answers: answers)
        let vc = NSStoryboard.main?.instantiateController(withIdentifier: "resultvc") as! ResultViewController
        vc.result = result
        presentAsSheet(vc)
        
        
    }

    
}
