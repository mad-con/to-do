//
//  TaskStore.PrioritizedTasks.swift
//  Madi's To-Do
//
//  Created by Madi Condie on 1/31/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

extension TaskStore {
    struct PrioritizedTasks {
        let priority: Task.Priority
        var tasks:[Task]
    }
}

extension TaskStore.PrioritizedTasks: Identifiable {
    var id: Task.Priority { priority }
}
