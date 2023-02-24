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
    
    var body: some View {
        Form{
            Section("Info"){
                TextField("Title", text: $todoSubtile)
                TextField("SubTitle", text: $todoSubtile)
            }
            Section("Action"){
                Button("Save"){
                    //todo
                }
                //destructive make the text red color
                Button("Cancel", role: .destructive){
                    //todo
                }
            }
        }
    }
}

struct NewTodoView_Previews: PreviewProvider {
    static var previews: some View {
        NewTodoView()
    }
}
