//
//  ContentView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct ContentView: View {
    @State var todos = [Todo(title: "Feed the cat", isCompleted: true),
                        Todo(title: "Play with cat", subTitle: "Use his favourite string!"),
                        Todo(title: "Get allergies"),
                        Todo(title: "Run away from cat"),
                        Todo(title: "Get a new cat")]
    @State var showAddAlert = false
    
    var body: some View {
        NavigationStack{
          
            List($todos, editActions: [.all]) { $todo in
                if todo.isCompleted {
                    EmptyView()
                }
                else{
                    NavigationLink {
                        TodoDetailView(todo: $todo)
                    }label: {
                        HStack{
                            Image(systemName: todo.isCompleted ? "checkmark.circle.fill" : "circle")
                                .onTapGesture {
                                    todo.isCompleted.toggle()
                                }
                            VStack(alignment: .leading){
                                Text(todo.title)
                                    .strikethrough(todo.isCompleted)
                                    .foregroundColor(todo.textColor)
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
