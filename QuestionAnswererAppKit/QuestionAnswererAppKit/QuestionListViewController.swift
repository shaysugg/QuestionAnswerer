//
//  QuestionListViewController.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 2/15/23.
//

import Cocoa
import QuestionKit

class QuestionListViewController: NSViewController, NSTableViewDelegate {

    @IBOutlet weak var tableView: NSTableView!
    
    var questionSelected: ((Question) -> Void)?
    var questions: [Question] = [] { didSet { applyQuestionsToDataSource() }}
    
    lazy var dataSource: NSTableViewDiffableDataSource<Int, Question> = {
        let ds = NSTableViewDiffableDataSource<Int, Question>(tableView: tableView) { tableView, tableColumn, row, question in
            let cell = tableView.makeView(withIdentifier: NSUserInterfaceItemIdentifier("questionCell"), owner: self) as! NSTableCellView
//            cell.textField?.stringValue = question.question
//            cell.textField?.maximumNumberOfLines = 3
//            cell.textField?.lineBreakMode = .byWordWrapping
            cell.imageView?.image = NSImage(systemSymbolName: "checkmark.seal", accessibilityDescription: nil)
//            cell.textField?.usesSingleLineMode = false
            return cell
        }
        return ds
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.dataSource = dataSource
        tableView.delegate = self
    }
    
    private func applyQuestionsToDataSource() {
        var snapShot = NSDiffableDataSourceSnapshot<Int, Question>()
        snapShot.appendSections([0])
        snapShot.appendItems(questions)
        dataSource.apply(snapShot, animatingDifferences: false)
    }
    
    func tableViewSelectionDidChange(_ notification: Notification) {
        let row = questions[tableView.selectedRow]
        questionSelected?(row)
    }
    
    
    
}
