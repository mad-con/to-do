//
//  NewTaskView.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 1/27/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI
struct NewTaskView: View {
    var taskStore: TaskStore
    
    @Environment(\.presentationMode) var presentationMode
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var text = ""
    @State var priority: Task.Priority = .no
//    @State var notes = ""
    
    var body: some View {
        Form {
            TextField("Task Name", text: $text)
//            TextField("Notes", text: $notes)
            
            VStack {
                Text("Priority")
                
                Picker("Priority", selection: $priority.caseIndex) {
                    ForEach(Task.Priority.allCases.indices) { priorityIndex in
                        Text(
                            Task.Priority.allCases[priorityIndex].rawValue
                                .capitalized
                        )
                            .tag(priorityIndex)
                    }
                }
                .pickerStyle( SegmentedPickerStyle() )
            }
            
            Button("Add") {
                let priorityIndex = self.taskStore.getIndex(for: self.priority)
                self.taskStore.prioritizedTasks[priorityIndex].tasks.append(
                    Task(name: self.text)
                )
                let task = MDTask(context: self.managedObjectContext)
                task.name = self.text
                task.priority = self.priority.rawValue.capitalized
                task.id = UUID()
//                task.notes = self.notes
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                
                self.presentationMode.wrappedValue.dismiss()
            }
            .disabled(text.isEmpty)
        }
    }
}
struct NewTaskView_Previews: PreviewProvider {
    static var previews: some View {
        NewTaskView(taskStore: TaskStore())
    }
}
