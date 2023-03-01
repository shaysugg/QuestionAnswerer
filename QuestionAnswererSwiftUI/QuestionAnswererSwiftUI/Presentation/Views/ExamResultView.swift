//
//  ExamResultView.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/14/23.
//

import SwiftUI
import QuestionKit

struct ExamResultView: View {
    var examResult: ExamResult
    var onDismiss: () -> Void
    
    var body: some View {
        VStack {
                Image(systemName: examResult.passed ? "checkmark.seal" : "xmark.seal")
                    .resizable()
                    .foregroundColor(examResult.passed ? .green : .red)
                    .frame(width: 100, height: 100)
            
            Text( examResult.passed ? "Yay! You Passed The Exam." : "Oh No! You failed the exam.")
                .font(.title2)
            
            HStack {
                Text("Correct Answer: ")
                Text("\(examResult.correctAnswerCount)")
                    .fontWeight(.black)
            }
            
            HStack {
                Text("Total Questions: ")
                Text("\(examResult.totalQuestionCount)")
                    .fontWeight(.black)
            }
            
            Button("OK") {
                onDismiss()
            }
        }
        .padding()
    }
}

struct ExamResultView_Previews: PreviewProvider {
    static var previews: some View {
        ExamResultView(examResult: Mocks.failedResult, onDismiss: {})
    }
}
