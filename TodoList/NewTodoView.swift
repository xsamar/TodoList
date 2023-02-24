//
//  NewTodoView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct NewTodoView: View {
    @State var todoTile = ""
    @State var todoSubtile = ""
    @State var isalertPresent = false
    @State var tododate = Date()
    @State var selectedPriority: Priority = .medium
    @Binding var todos: [Todo]
    @Environment(\.dismiss) var dismiss
    

    var body: some View {
        Form{
            Section("Info"){
                TextField("Title", text: $todoTile)
                TextField("SubTitle", text: $todoSubtile)
                DatePicker("Date", selection: $tododate)
                    .datePickerStyle(.automatic)
                Picker("Priority", selection: $selectedPriority) {
                    Text("🔵").tag(Priority.low)
                    Text("🟢").tag(Priority.medium)
                    Text("🔴").tag(Priority.high)
                }
            }
            Section("Action"){
                Button("Save"){
                    if todoTile.isEmpty{
                        isalertPresent = true
                    }
                    else{
                      
                        let newTodo = Todo(title: todoTile, subTitle: todoSubtile, todoDate: tododate, priority: selectedPriority)
                        todos.append(newTodo)
                        todos = todos.sorted(by: { $0.priority > $1.priority })

                        dismiss()
                    }
                }
                //destructive make the text red color
                Button("Cancel", role: .destructive){
                    dismiss()
                }
            }
        }.alert("Alert", isPresented: $isalertPresent){
            Button("ok"){
                print("")
            }
        }message: {
            Text("Title cannot be empty")
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
