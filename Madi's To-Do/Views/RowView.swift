//
//  RowView.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 1/30/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import SwiftUI

struct RowView: View {
    @Environment(\.managedObjectContext) var managedObjectContext
    @ObservedObject var task: MDTask
    
    let checkmark = Image(systemName: "checkmark")
    
    var body: some View {
        NavigationLink(
            destination: TaskEditingView(task: task).environment(\.managedObjectContext, self.managedObjectContext)
      ) {
        if task.completed {
            checkmark
        } else {
            checkmark.hidden()
        }
        Text(task.name ?? "(undefined)")
            .strikethrough(task.completed)
    }
  }
}
