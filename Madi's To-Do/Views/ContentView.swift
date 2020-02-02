//
//  ContentView.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 1/27/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var refreshing = false
    var didSave =  NotificationCenter.default.publisher(for: .NSManagedObjectContextDidSave)
    @ObservedObject var taskStore: TaskStore
    @Environment(\.managedObjectContext) var managedObjectContext
    @State var modalIsPresented = false
    @FetchRequest(
        entity: MDTask.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \MDTask.name, ascending: true),
        ],
        predicate: NSPredicate(format: "priority == %@", "No")
    ) var noPriorityTasks: FetchedResults<MDTask>
    @FetchRequest(
        entity: MDTask.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \MDTask.name, ascending: true),
        ],
        predicate: NSPredicate(format: "priority == %@", "Low")
    ) var lowPriorityTasks: FetchedResults<MDTask>
    @FetchRequest(
        entity: MDTask.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \MDTask.name, ascending: true),
        ],
        predicate: NSPredicate(format: "priority == %@", "Medium")
    ) var mediumPriorityTasks: FetchedResults<MDTask>
    @FetchRequest(
        entity: MDTask.entity(),
        sortDescriptors: [
            NSSortDescriptor(keyPath: \MDTask.name, ascending: true),
        ],
        predicate: NSPredicate(format: "priority == %@", "High")
    ) var highPriorityTasks: FetchedResults<MDTask>
    var body: some View {
        NavigationView {
            
            List{
//                ForEach(taskStore.prioritizedTasks) { index in
//                    SectionView(prioritizedTasks: self.$taskStore.prioritizedTasks[index])
//                }
                SectionView(priorityName: "High", tasks: highPriorityTasks).environment(\.managedObjectContext, self.managedObjectContext)
                SectionView(priorityName: "Medium", tasks: mediumPriorityTasks).environment(\.managedObjectContext, self.managedObjectContext)
                SectionView(priorityName: "Low", tasks: lowPriorityTasks).environment(\.managedObjectContext, self.managedObjectContext)
                SectionView(priorityName: "No", tasks: noPriorityTasks).environment(\.managedObjectContext, self.managedObjectContext)
                
            }
            .listStyle( GroupedListStyle() )
            .navigationBarTitle("Tasks")
            .navigationBarItems(
                leading:
                EditButton(),
                trailing:
                Button(action: { self.modalIsPresented = true }
                ) {
                    Image(systemName: "plus")
                }
            )
        }
        .sheet(isPresented: $modalIsPresented) {
            NewTaskView(taskStore: self.taskStore).environment(\.managedObjectContext, self.managedObjectContext)
        }
        .onReceive(self.didSave) { _ in
            
        }
//        List{
//            ForEach(mdTasks, id: \.self) { task in
//                Text("Task priority: \(task.priority ?? "hmm")")
//            }
//        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(taskStore: TaskStore() )
    }
}

//HStack {
//    Image("InfoIcon")
//    Text("Info").modifier(ButtonSmallTextStyle())
//}
