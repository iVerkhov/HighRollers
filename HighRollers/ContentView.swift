//
//  ContentView.swift
//  HighRollers
//
//  Created by Игорь Верхов on 21.03.2024.
//

import Combine
import SwiftUI

struct ContentView: View {
    @State private var VM = ViewModel()
    
    var body: some View {
        NavigationStack {
            VStack {
                VStack {
                    HStack {
                        Spacer()
                        DiceView(firstNumber: $VM.firstNumber, results: $VM.results)
                        Spacer()
                        DiceView(firstNumber: $VM.secondNumber, results: $VM.results)
                        Spacer()
                    }
                    
                    Text("Sum: \(VM.firstNumber + VM.secondNumber)")
                        .padding(.top, 30)
                }
                .containerRelativeFrame(.vertical) { size, axis in size * 0.5 }
                
                RollButton(VM: $VM)
                
                if VM.results.isEmpty == false {
                    ListResultsView(VM: $VM)
//                        .containerRelativeFrame(.vertical) { size, axis in size * 0.4 }

                }
            }
            .navigationTitle("High Rollers")
            .onAppear(perform: VM.load)
            .onReceive(VM.timer) { _ in VM.startRoll() }
            .toolbar {
                Button("Reset") {
                    withAnimation {
                        VM.reset()
                    }
                }
            }
        }
            .padding([.horizontal, .bottom])
            .preferredColorScheme(.light)
    }
}

#Preview {
    ContentView()
}
