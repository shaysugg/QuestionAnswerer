//
//  QuestionView.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/8/23.
//

import SwiftUI
import QuestionKit

struct QuestionView: View {
    var question: Question
    @Binding var selectedAnswerIndex: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text(question.question)
                .font(.title)
            Picker("", selection: $selectedAnswerIndex) {
                ForEach(0..<question.answers.count, id: \.self) { index in
                    Text(question.answers[index]).tag(index + 1)
                }
                
            }.pickerStyle(RadioGroupPickerStyle())
                
        }.padding()
    }
    
}

struct QuestionView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionView(question: Mocks.questions[0] ,selectedAnswerIndex: .constant(0))
    }
}
