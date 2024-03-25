//
//  RollButton.swift
//  HighRollers
//
//  Created by Игорь Верхов on 23.03.2024.
//

import SwiftUI

struct RollButton: View {
    @Binding var VM: ContentView.ViewModel
    
    var body: some View {
        Button("Roll it!") {
            VM.counter = 0
            VM.timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()
        }
        .padding()
        .frame(width: 150, height: 50)
        .font(.title2)
        .foregroundStyle(.white)
        .background(VM.counter < VM.maxCount ? Color.gray.gradient : Color.blue.gradient)
        .clipShape(.capsule)
        .sensoryFeedback(.impact, trigger: VM.counter)
        .disabled(VM.counter < VM.maxCount)
        .animation(.linear(duration: 0.3), value: VM.counter < VM.maxCount)
    }
}

#Preview {
    RollButton(VM: .constant(ContentView.ViewModel()))
}
