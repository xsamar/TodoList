//
//  Todo.swift
//  TodoList
//
//  Created by samar salem on 24/02/2023.
//

import Foundation
import SwiftUI

struct Todo : Identifiable{
    var id = UUID()
    var title : String
    var subTitle = ""
    var todoDate = Date()
    var isCompleted = false
    var priority: Priority = .medium
    var textColor = Color.black
}

enum Priority : Comparable{
    case low
    case medium
    case high
}
