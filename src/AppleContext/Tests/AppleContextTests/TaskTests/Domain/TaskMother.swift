//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 5/3/22.
//

import Foundation
import AppleContext

final class TaskMother {
    
    static func create(with taskDescription: TaskDescription = TaskDescriptionMother.random()) -> Task {
        return Task(description: taskDescription)
    }
}
