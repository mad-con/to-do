//
//  TaskEditingView.swift
//  Madi's To-Do
//
//  Created by Madi Condie on 1/31/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI
import CoreData

struct TaskEditingView: View {
    @ObservedObject var task: MDTask
    @State var notes:String = ""
    @State var name:String = ""
    @State var completed:Bool = false
    @Environment(\.managedObjectContext) var managedObjectContext:NSManagedObjectContext
    @Environment(\.presentationMode) var presentationMode
    let accentBlue = Color(red: 32.0 / 255.0, green: 121.0 / 255.0, blue: 249.0 / 255.0)
    
    var body: some View {
        Form {
            Text ("Task Name:")
                .foregroundColor(accentBlue)
            TextField("Name", text: $name)
                .onAppear {
                    self.name = self.task.name ?? ""
            }
            Text ("Notes:")
                .foregroundColor(accentBlue)
            TextField("Notes", text: $notes)
                .onAppear {
                    self.notes = self.task.notes ?? ""
            }

            Toggle("Completed", isOn: $completed)
                .onAppear {
                    self.completed = self.task.completed
            }
            Button("Save") {
                self.task.name = self.name
                self.task.completed = self.completed
                self.task.notes = self.notes
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
