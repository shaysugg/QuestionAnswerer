//
//  QuestionListViewController.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 2/15/23.
//

import Cocoa

class QuestionListViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do view setup here.
    }
    
}

extension QuestionListViewController: NSTableViewDelegate, NSTableViewDataSource {
    func numberOfRows(in tableView: NSTableView) -> Int {
        5
    }
    
    cell
}
