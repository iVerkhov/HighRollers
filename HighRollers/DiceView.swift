//
//  DiceView.swift
//  HighRollers
//
//  Created by Игорь Верхов on 23.03.2024.
//

import SwiftUI

struct DiceView: View {
    @Binding var firstNumber: Int
    @Binding var results: [Result]
    
    var body: some View {
        Text("\(firstNumber)")
            .frame(maxWidth: .infinity, maxHeight: .infinity)
            .aspectRatio(1, contentMode: .fit)
            .foregroundStyle(.black)
            .background(.white)
            .clipShape(.rect(cornerRadius: 20))
            .shadow(radius: 3)
            .font(.largeTitle.bold())
            .padding(5)
            .animation(.bouncy(duration: Double.random(in: 0.5..<0.8)), value: results.isEmpty)
            .transition(.move(edge: .top))
    }
}
#Preview {
    DiceView(firstNumber: .constant(5), results: .constant([Result.example]))
}
