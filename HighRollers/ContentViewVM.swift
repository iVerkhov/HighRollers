//
//  ContentViewVM.swift
//  HighRollers
//
//  Created by Игорь Верхов on 23.03.2024.
//

import Foundation
import SwiftUI

extension ContentView {
    
    @Observable
    class ViewModel {
        var firstNumber = 0
        var secondNumber = 0
        var results = [Result]()
        var timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        var counter = 16
        var maxCount = 15
        
        func startRoll()  {
            if counter > maxCount {
                timer.upstream.connect().cancel()
            }
            else {
                if counter < maxCount {
                    firstNumber = Int.random(in: 1..<7)
                    secondNumber = Int.random(in: 1..<7)
                    
                } else if counter == maxCount {
                    withAnimation {
                        insertResult()
                        save()
                        timer.upstream.connect().cancel()
                        return
                    }
                }
                
                counter += 1
            }
        }
        
        func insertResult() {
            let newResult = Result(id: UUID(), firstNumber: firstNumber, secondNumber: secondNumber)
            results.insert(newResult, at: 0)
        }
        
        func load() {
            if let data = UserDefaults.standard.data(forKey: "results") {
                if let decodedResults = try? JSONDecoder().decode([Result].self, from: data) {
                    results = decodedResults
                }
            } else {
                results = []
            }
        }
        
        func save() {
            if let data = try? JSONEncoder().encode(results) {
                UserDefaults.standard.setValue(data, forKey: "results")
            }
        }
        
        func reset() {
    //        firstNumber = 0
    //        secondNumber = 0
            results = []
            UserDefaults.standard.setValue(nil, forKey: "results")
        }
    }
}
