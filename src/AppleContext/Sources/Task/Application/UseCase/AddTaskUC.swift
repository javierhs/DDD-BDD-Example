//
//  File.swift
//
//
//  Created by Javier Hernandez Sansalvador on 4/3/22.
//

import Foundation

protocol AddTaskUCOutput {
}

final class AddTaskUC {
    private let maximumNumberOfTasks = 5
    private let repository: TaskRepository

    init(repository: TaskRepository) {
        self.repository = repository
    }

    func invoke(description: String) throws {
        let task = try Task.create(description: description)

        if repository.tasks().count == maximumNumberOfTasks {
            throw FullTaskListError(message: "The list of tasks is full. Task cannot be added.")
        }

        repository.add(task)
    }
}
