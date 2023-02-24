//
//  ContentView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [Todo(title: "Buy some groceries", subTitle: "Vegetables and corn"),
                        Todo(title: "Pick up sister from school"),
                        Todo(title: "Prepare for class", isCompleted: true),
                        Todo(title: "Prepare for class", priority: .high),
                        Todo(title: "Prepare for class", priority: .low)
                        ]
    @State var showAddAlert = false
    
    var body: some View {
        NavigationStack{
            // binding totdo to remove error Cannot use mutating member on immutable value: 'todo' is a 'let' constant
            //editActions allow to delete by swiping and edit
            List($todos, editActions: [.all]) { $todo in
                if todo.isCompleted {
                    EmptyView()
                }
                else{
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                    }label: {
                        HStack{
                            //                    if todo.isCompleted {
                            //                        Image(systemName: "checkmark.circle.fill")
                            //                    }else{
                            //                        Image(systemName: "circle")
                            //                    }
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            VStack(alignment: .leading){
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                if !todo.subTitle.isEmpty{
                                    Text(todo.subTitle)
                                        .font(.subheadline)
                                        .foregroundColor(.gray)
                                }
                                
                                Text("Date: \(todo.todoDate, formatter: dateFormatter)")
                                    .font(.subheadline)
                                    .foregroundColor(.gray)
                            }
                            
                            Spacer()
                            if todo.priority == .high {
                                Text("🔴")
                            }else if todo.priority == .medium {
                                Text("🟢")
                            }
                            else if todo.priority == .low {
                                Text("🔵")
                            }
                        }
                    }
                }
            }
            .navigationTitle("Todos")
            .toolbar{
                ToolbarItem(placement: .navigationBarLeading){
                    EditButton()
                }
                ToolbarItem(placement: .navigationBarTrailing){
                    Button{
                        showAddAlert = true
                    }label: {
                        Image(systemName: "plus")
                    }
                }
            }.sheet(isPresented: $showAddAlert){
                NewTodoView(todos: $todos)
            }
            .onAppear {
                todos = todos.sorted(by: { $0.priority > $1.priority })
            }
        }
    }
}
var dateFormatter: DateFormatter{
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-yyyy HH:mm"
    return dateFormatter
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
