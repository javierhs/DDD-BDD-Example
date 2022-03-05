//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 5/3/22.
//

import Foundation

public protocol AddTaskListPresenterOutput {
    func showFullListError()
    func showTaskDescriptionError()
    func showUnexpectedError()
}
