//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 5/3/22.
//

import Foundation

final public class InMemoryTaskRepository: TaskRepository {
    private var tasksList: [Task] = []
    
    public init() {
    }
    
    public func add(_ task: Task) {
        tasksList.append(task)
    }
    
    public func tasks() -> [Task] {
        return tasksList
    }
    
    
}
