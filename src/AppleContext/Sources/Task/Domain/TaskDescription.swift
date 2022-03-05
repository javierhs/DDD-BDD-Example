//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 3/3/22.
//

import Foundation

final public class TaskDescription {
    public static let maximumLength: Int = 30
    private let value: String
    
    public init(value: String) {
        self.value = value
    }
    
    public static func create(_ value: String) throws -> TaskDescription {
        if value.count > maximumLength {
            throw IncorrectTaskDescriptionError("Task description length is greater than \(self.maximumLength). Current length: \(value.count)")
        }

        return TaskDescription(value: value)
    }
    
    public func getValue() -> String {
        return value
    }
}
