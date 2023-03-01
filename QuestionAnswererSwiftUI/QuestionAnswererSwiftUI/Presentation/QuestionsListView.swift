//
//  QuestionsListView.swift
//  QuestionAnswererSwiftUI
//
//  Created by Negar Tolou on 2/8/23.
//

import SwiftUI

struct QuestionsListView: View {
    //    @State private var selectedQuestion: Que
    @ObservedObject var vm = QuestionViewModel()
    
    var body: some View {
        NavigationView {
            
            List(vm.quetsions) { question in
                NavigationLink {
                    QuestionView(
                        question: question,
                        selectedAnswerIndex: .init(
                            get: {
                                vm.answers[question.id] ?? 0
                            }, set: { number in
                                vm.answer(number, forQuestionWithID: question.id)
                            }))
                } label: {
                    QuestionSidebarItemView(
                        question: question,
                        answerNumber: vm.answers[question.id]
                    )
                }
            }
            .frame(minWidth: 300)
            
            VStack {
                Image(systemName: "questionmark.app.dashed")
                    .resizable()
                    .frame(width: 40, height: 40)
                Text("Welcome to Question Answerer.")
                    .font(.title)
                
                Text("Please select a question from sidebar.")
                    .font(.caption)
                
            }
            
        }
        .toolbar {
            Button("Submit Answers") {
                print("hello")
                vm.configureExamResult()
            }
            .disabled(!vm.answeredAllQuestion)
        }
        
        .sheet(item: $vm.examResult) { result in
            ExamResultView(examResult: result) {
                vm.reset()
            }
        }
        //TODO: - Error Handling
        .onAppear(perform: vm.fetchQuestions)
            
    }
}

struct QuestionsListView_Previews: PreviewProvider {
    static var previews: some View {
        QuestionsListView()
    }
}
