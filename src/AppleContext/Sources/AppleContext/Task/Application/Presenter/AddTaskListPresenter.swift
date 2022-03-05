//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 4/3/22.
//

import Foundation

final public class AddTaskListPresenter: AddTaskUCOutput {
    private var taskDescription: String = ""
    private let addTaskListPresenterOutput: AddTaskListPresenterOutput
    private let addTaskUC: AddTaskUC
    
    public init(addTaskListPresenterOutput: AddTaskListPresenterOutput,
                repository: TaskRepository) {
        self.addTaskListPresenterOutput = addTaskListPresenterOutput
        self.addTaskUC = AddTaskUC(repository: repository)
    }
    
    public func updateTaskDescription(_ description: String) {
        taskDescription = description
    }
    
    public func addTask() {
        do {
            try addTaskUC.invoke(description: taskDescription)
        } catch _ as IncorrectTaskDescriptionError {
            addTaskListPresenterOutput.showTaskDescriptionError()
        } catch _ as FullTaskListError {
            addTaskListPresenterOutput.showFullListError()
        } catch {
            addTaskListPresenterOutput.showUnexpectedError()
        }
    }
}
