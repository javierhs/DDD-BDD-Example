//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/3/22.
//

import Foundation

public protocol TaskRepository {
    func add(_ task: Task)
    func tasks() -> [Task]
}
