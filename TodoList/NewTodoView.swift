//
//  NewTodoView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct NewTodoView: View {
    @State var totoTile = ""
    @State var todoSubtile = ""
    @Binding var todos: [Todo]
    @Environment(\.dismiss) var dismiss
    var body: some View {
        Form{
            Section("Info"){
                TextField("Title", text: $totoTile)
                TextField("SubTitle", text: $todoSubtile)
            }
            Section("Action"){
                Button("Save"){
                    let newTodo = Todo(title: totoTile, subTitle: todoSubtile)
                    todos.append(newTodo)
                    dismiss()
                }
                //destructive make the text red color
                Button("Cancel", role: .destructive){
                    dismiss()
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView(todos: .constant([]))
    }
}
