//
//  QuestionAnswersViewController.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 3/11/23.
//
import QuestionKit
import Cocoa

class QuestionAnswersViewController: NSViewController {
    @IBOutlet weak var welcomeView: NSStackView!
    @IBOutlet weak var questionView: NSStackView!
    var question: Question! {
        didSet {
            answer1RadioButton.title = question.answer1
            answer2RadioButton.title = question.answer2
            answer3RadioButton.title = question.answer3
            answer4RadioButton.title = question.answer4
            questionTextField.stringValue = question.question
            answerIndex = nil
            welcomeView.isHidden = true
            questionView.isHidden = false
        }
    }
    
    var answerIndex: Int? { didSet {
        if let answerIndex {
            buttons[answerIndex].state = .on
        } else {
            buttons.forEach{ $0.state = .off }
        }
    }}
    
    var answerSelected: ((_ id: String, _ answerIndex: Int) -> Void)?
    
    var selectedAnswerIndex: Int? {
        buttons.firstIndex {$0.state == .on}
    }
    
    @IBOutlet weak var questionTextField: NSTextField!
    @IBOutlet weak var answer1RadioButton: NSButton!
    @IBOutlet weak var answer2RadioButton: NSButton!
    @IBOutlet weak var answer3RadioButton: NSButton!
    @IBOutlet weak var answer4RadioButton: NSButton!
    
    private lazy var buttons: [NSButton] = [answer1RadioButton, answer2RadioButton, answer3RadioButton, answer4RadioButton]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    
    
    @IBAction func radioButtonSelected(_ sender: Any) {
        guard let selectedAnswerIndex else { return }
        answerSelected?(question.id, selectedAnswerIndex)
    }
    
    
}
