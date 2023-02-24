//
//  Todo.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import Foundation

//store information
struct Todo : Identifiable{
    var id = UUID()
    var title : String
    var subTitle = ""
    var isCompleted = false
}
