//
//  File.swift
//  
//
//  Created by Javier Hernandez Sansalvador on 5/3/22.
//

import Foundation
import Task

final class TaskDescriptionMother {
    
    static func random() -> TaskDescription {
        let value = randomString(length: Int.random(in: 1...TaskDescription.maximumLength))
        return TaskDescription(value: value)
    }
    
    private static func randomString(length: Int) -> String {
      let letters = "abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789"
      return String((0..<length).map{ _ in letters.randomElement()! })
    }
}
