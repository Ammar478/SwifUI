//
//  TaskViewModel.swift
//  Task Manger
//
//  Created by Ammar Ahmed on 14/06/1445 AH.
//

import SwiftUI
import CoreData

class TaskViewModel: ObservableObject {
  
    @Published var currentTab:String = "Today"
    
    @Published var openEditTask:Bool = false
    @Published var taskTitle:String = ""
    @Published var taskColor:String = "Yellow"
    @Published var taskDeadLin:Date = Date()
    @Published var taskType:String = "Basic"
}

enum TaskTypes{}
