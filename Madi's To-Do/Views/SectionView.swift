//
//  SectionView.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 1/31/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI

struct SectionView: View {
//    @Binding var prioritizedTasks: TaskStore.PrioritizedTasks
    var priorityName: String
    var tasks: FetchedResults<MDTask>
    @Environment(\.managedObjectContext) var moc
    
    var body: some View {
        Section(
        header: Text(
            "\(priorityName.capitalized) Priority")
        ) {
            ForEach(tasks, id: \.self) { (task: MDTask) in
                RowView(task: task).environment(\.managedObjectContext, self.moc)
            }
            
            
//            .onMove { sourceIndices, destinationIndex in
////                self.prioritizedTasks.tasks.move(
////                    fromOffsets: sourceIndices,
////                    toOffset: destinationIndex)
//            }
            .onDelete { indexSet in
                          for index in indexSet {
                              let task = self.tasks[index]
                              self.moc.delete(task)
                          }
                          do {
                              try self.moc.save()
                          } catch {
                              print(error)
                          }
                      }
        }
    }
}
