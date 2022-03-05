//
//  InterfaceController.swift
//  DDD-BDD-watchOS WatchKit Extension
//
//  Created by Javier Hernandez Sansalvador on 3/3/22.
//

import WatchKit
import Foundation
import AppleContext

class InterfaceController: WKInterfaceController {

    override func awake(withContext context: Any?) {
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        let presenter = AddTaskListPresenter(addTaskListPresenterOutput: self,
                                             repository: InMemoryTaskRepository())
        presenter.updateTaskDescription("hola")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
    }

}

extension InterfaceController: AddTaskListPresenterOutput {
    func showFullListError() {
        
    }
    
    func showTaskDescriptionError() {
        
    }
    
    func showUnexpectedError() {
        
    }
}
