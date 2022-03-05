//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 5/3/22.
//

import Foundation
import AppleContext

final class SpyAddTaskListPresenterOutput: AddTaskListPresenterOutput {
    var numberOfTimesShowFullListErrorCalled: Int = 0
    var numberOfTimesShowTaskDescriptionErrorCalled: Int = 0
    var numberOfTimesShowUnexpectedErrorCalled: Int = 0
    
    func showFullListError() {
        numberOfTimesShowFullListErrorCalled += 1
    }
    
    func showTaskDescriptionError() {
        numberOfTimesShowTaskDescriptionErrorCalled += 1
    }
    
    func showUnexpectedError() {
        numberOfTimesShowUnexpectedErrorCalled += 1
    }
}
