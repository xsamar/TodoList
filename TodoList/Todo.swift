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
    var todoDate = Date()
    var isCompleted = false
    var priority: Priority = .medium
}

enum Priority : Comparable{
    case low
    case medium
    case high
}
