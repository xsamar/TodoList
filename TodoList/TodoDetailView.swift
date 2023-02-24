//
//  TodoDetailView.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import SwiftUI

struct TodoDetailView: View {
    //عشان يوم نغير   title  ونرجع للصفحة لازم نحط $
    //@State var todo = Todo(title: "Feed the demo cat")
    @Binding var todo : Todo

    var body: some View {
        //form for asking user for data, list for dispplay data
        Form{
            TextField("Title", text: $todo.title)
            TextField("Subtitle", text: $todo.subTitle)
            Toggle("Is completed?", isOn: $todo.isCompleted)
        }.navigationTitle("Todo Detail")
    }
}

struct TodoDetailView_Previews: PreviewProvider {
    static var previews: some View {
        TodoDetailView(todo: .constant(Todo(title: "Fake demo todo")))
    }
}
