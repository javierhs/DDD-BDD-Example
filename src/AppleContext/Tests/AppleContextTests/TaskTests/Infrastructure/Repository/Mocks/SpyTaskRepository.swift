//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 4/3/22.
//

import Foundation
import AppleContext

final class SpyTaskRepository: TaskRepository {
    var numberOfTimesAddMethodCalled = 0
    var numberOfTimesTasksMethodCalled = 0
    var tasksList: [Task] = []
    
    init(tasksList: [Task]) {
        self.tasksList = tasksList
    }
    
    func add(_ task: Task) {
        numberOfTimesAddMethodCalled += 1
        tasksList.append(task)
    }
    
    func tasks() -> [Task] {
        numberOfTimesTasksMethodCalled += 1
        return tasksList
    }
}
