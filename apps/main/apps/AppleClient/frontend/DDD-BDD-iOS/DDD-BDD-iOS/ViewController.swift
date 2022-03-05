//
//  ViewController.swift
//  DDD-BDD-iOS
//
//  Created by Javier Hernandez Sansalvador on 28/2/22.
//

import UIKit
import Task

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        let presenter = AddTaskListPresenter(addTaskListPresenterOutput: self,
                                             repository: InMemoryTaskRepository())
        presenter.updateTaskDescription("hola")
    }
}

extension ViewController: AddTaskListPresenterOutput {
    func showFullListError() {
        
    }
    
    func showTaskDescriptionError() {
        
    }
    
    func showUnexpectedError() {
        
    }
}

