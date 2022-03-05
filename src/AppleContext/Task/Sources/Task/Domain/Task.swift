//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/3/22.
//

import Foundation

final public class Task {
    private let description: TaskDescription
    
    public init(description: TaskDescription) {
        self.description = description
    }
    
    public static func create(description: String) throws -> Task {
        let description = try TaskDescription.create(description)
        return Task(description: description)
    }
}
