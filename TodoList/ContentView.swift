//
//  ContentView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    var todos = [Todo(title: "Buy some groceries"),
                 Todo(title: "Pick up sister from school"),
                 Todo(title: "Prepare for class", isCompleted: true)]
    
    var body: some View {
        NavigationStack{
            List(todos) { todo in
                HStack{
//                    if todo.isCompleted {
//                        Image(systemName: "checkmark.circle.fill")
//                    }else{
//                        Image(systemName: "circle")
//                    }
                    Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                    Text(todo.title)
                        .strikethrough(todo.isCompleted)
                }
            }
            .navigationTitle("Todos")
        }
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
