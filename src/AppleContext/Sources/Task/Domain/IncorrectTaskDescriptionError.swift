//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/3/22.
//

import Foundation

final class IncorrectTaskDescriptionError: Error {
    private let message: String
    
    init(_ message: String) {
        self.message = message
    }
}
