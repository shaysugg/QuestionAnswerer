//
//  QuestionSidebarItemView.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/14/23.
//

import SwiftUI
import QuestionKit

struct QuestionSidebarItemView: View {
    var question: Question
    var answerNumber: Int?
    
    var body: some View {
        HStack {
            if let number = answerNumber {
                ZStack {
                    Image(systemName: "circle.fill")
                        .resizable()
                        .frame(width: 15, height: 15)
                        .font(.caption2)
                    Text("\(number)")
                        .foregroundColor(.accentColor)
                        .fontWeight(.bold)
                }
                
            } else {
                Image(systemName: "circle")
                    .resizable()
                    .frame(width: 15, height: 15)
            }
            Text(question.question)
                .lineLimit(4)
            
        }
        
    }
}

struct QuestionSidebarItemView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionSidebarItemView(question: Mocks.questions[0], answerNumber: 1)
    }
}
