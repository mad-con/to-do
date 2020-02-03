//
//  TaskEditingView.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 1/31/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI
import CoreData

struct TaskEditingView: View {
    @ObservedObject var task: MDTask
//    @State var notes:String = ""
    @State var name:String = ""
    @State var completed:Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext:NSManagedObjectContext
    @Environment(\.presentationMode) var presentationMode
    
    var body: some View {
        Form {
//            TextField("Notes", text: $notes)
//                .onAppear { self.notes = self.task.notes ?? ""
//            }
            TextField("Name", text: $name)
                .onAppear {
                    self.name = self.task.name ?? ""
            }
            Toggle("Completed", isOn: $completed)
                .onAppear {
                    self.completed = self.task.completed
            }
            Button("Save") {
                self.task.name = self.name
                self.task.completed = self.completed
                do {
                    try self.managedObjectContext.save()
                } catch {
                    print(error)
                }
                self.presentationMode.wrappedValue.dismiss()
            }
        }
    }
}

//struct TaskEditingView_Previews: PreviewProvider {
//    static var previews: some View {
//        TaskEditingView(
//            task: .constant( MDTask(name: "To Do") )
//        )
//    }
//}
