//
//  QuestionsWindowController.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 3/15/23.
//

import Cocoa

class QuestionsWindowController: NSWindowController, NSToolbarItemValidation {
    
    @IBOutlet weak var submitToolBarItem: NSToolbarItem!
    
    lazy var questionsSplitViewController = window?.contentViewController as! QuestionsSplitViewController
    @IBAction func toolbarAction(_ sender: Any) {
        questionsSplitViewController.submitAnswers()
    }
    
    override func windowDidLoad() {
        super.windowDidLoad()
        submitToolBarItem.isEnabled = false
        
        questionsSplitViewController.answersChanged = { [weak self] answers in
            guard let self else { return }
            let allQuestionAnswered = answers.count == self.questionsSplitViewController.questions.count
            self.submitToolBarItem.isEnabled = allQuestionAnswered
        }
    }
    
    func validateToolbarItem(_ item: NSToolbarItem) -> Bool {
        submitToolBarItem.isEnabled
    }
    
}
