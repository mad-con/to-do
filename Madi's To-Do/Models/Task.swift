//
//  Task.swift
//  Madi's To-Do
//
//  Created by Matthew Condie on 1/27/20.
//  Copyright © 2020 mcondie. All rights reserved.
//

import Foundation

struct Task: Identifiable {
    let id = UUID()
    
    var name: String
    var completed = false
}
