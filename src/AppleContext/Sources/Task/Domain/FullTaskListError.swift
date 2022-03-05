//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 4/3/22.
//

import Foundation

final class FullTaskListError: Error {
    private let message: String
    
    init(message: String) {
        self.message = message
    }
}
