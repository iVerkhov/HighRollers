//
//  File.swift
//  HighRollers
//
//  Created by Игорь Верхов on 23.03.2024.
//

import Foundation

struct Result: Codable, Equatable, Hashable, Identifiable {
    var id: UUID
    let firstNumber: Int
    let secondNumber: Int
    
    var sum: Int {
        firstNumber + secondNumber
    }
    
    static let example = Result(id: UUID(), firstNumber: 3, secondNumber: 5)
}
