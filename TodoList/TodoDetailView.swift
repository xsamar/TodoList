//
//  TodoDetailView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct TodoDetailView: View {
    @Binding var todo : Todo
    var body: some View {
        Form{
            TextField("Title", text: $todo.title)
                .foregroundColor(todo.textColor)
            TextField("Subtitle", text: $todo.subTitle)
            Toggle("Is completed?", isOn: $todo.isCompleted)
            DatePicker("Date", selection: $todo.todoDate)
            Picker("Priority", selection: $todo.priority) {
                Text("🔵 Low").tag(Priority.low)
                Text("🟢 Medium").tag(Priority.medium)
                Text("🔴 High").tag(Priority.high)
            }
            ColorPicker("Title color", selection: $todo.textColor)
        }.navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Fake demo todo")))
    }
}
