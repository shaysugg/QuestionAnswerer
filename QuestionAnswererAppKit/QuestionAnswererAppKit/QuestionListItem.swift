//
//  QuestionListItem.swift
//  QuestionAnswererAppKit
//
//  Created by Negar Tolou on 2/15/23.
//

import Cocoa

class QuestionListItem: NSTableCellView {
    var questionTitle: String? {
        didSet {
            field.stringValue = questionTitle ?? ""
        }
    }
    
    private lazy var field: NSTextField = {
        let view = NSTextField()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    
    override class func awakeFromNib() {
        super.awakeFromNib()
        
//        addSubview(field)
//        NSLayoutConstraint.activate([
//            field.leftAnchor.constraint(equalTo: self.focusView?.leftAnchor)
//        ])
    }
    
}
