//
//  ListResultsView.swift
//  HighRollers
//
//  Created by Игорь Верхов on 23.03.2024.
//

import SwiftUI

struct ListResultsView: View {
    @Binding var VM: ContentView.ViewModel
    
    var body: some View {
        List(VM.results) { result in
            Text("\(result.firstNumber) x \(result.secondNumber), sum: \(result.sum)")
        }
        .padding(.top, 20)
        .listStyle(.plain)
        .scrollBounceBehavior(.basedOnSize)
        .transition(.move(edge: .bottom))
    }
}

#Preview {
    ListResultsView(VM: .constant(ContentView.ViewModel()))
}
