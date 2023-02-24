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
                Text(todo.title)
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
