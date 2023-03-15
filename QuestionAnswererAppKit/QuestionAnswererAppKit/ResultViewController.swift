//
//  ResultViewController.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 3/15/23.
//

import Cocoa
import QuestionKit

class ResultViewController: NSViewController {

    @IBOutlet weak var titleField: NSTextField!
    @IBOutlet weak var correctAnswersCountField: NSTextField!
    @IBOutlet weak var totalAnswersCountField: NSTextField!
    @IBOutlet weak var imageView: NSImageView!
    
    var result: ExamResult!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleField.stringValue = result.passed ? "Yay! You Passed The Exam." : "Oh No! You failed the exam."
        imageView.image = NSImage(systemSymbolName: result.passed ? "checkmark.seal" : "xmark.seal", accessibilityDescription: nil)
        imageView.contentTintColor = result.passed ? .systemGreen : .systemRed
        correctAnswersCountField.stringValue = String(result.correctAnswerCount)
        totalAnswersCountField.stringValue = String(result.totalQuestionCount)
    }
    
    @IBAction func okButtonPushed(_ sender: Any) {
        presentingViewController?.dismiss(self)
    }
}
