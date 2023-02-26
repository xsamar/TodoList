//
//  TodoDetailView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct TodoDetailView: View {
    //عشان يوم نغير   الداتا  ونرجع للصفحة لازم نحط $ عشان نسيف الداتا
    //@State var todo = Todo(title: "Feed the demo cat")
    @Binding var todo : Todo
    var body: some View {
        //form for asking user to enter data, list for display data
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
