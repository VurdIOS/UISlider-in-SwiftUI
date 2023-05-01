//
//  ContentView.swift
//  UISlider in SwiftUI
//
//  Created by Камаль Атавалиев on 01.05.2023.
//

import SwiftUI

struct ContentView: View {
    
    @State private var targetValue = Int.random(in: 1...100)
    @State private var currentValue: Double = 0
    @State private var showAlert = false
    
    var body: some View {
        VStack(spacing: 30) {
            Text("Подвиньте слайдер как можно ближе к: \(targetValue)")
            HStack {
                Text("0")
                UIsliderViewRepresentation(
                    currentValue: $currentValue,
                    targetValue: targetValue,
                    tintopacity: tintOpacity()
                )
                Text("100")
            }
            
            Button("Проверь меня", action: { showAlert.toggle() } )
                .alert("Результат", isPresented: $showAlert, actions: {}) {
                    Text("Вы набрали \(computeScore()) очков")
                }
            Button("Начать заново") {
                targetValue = Int.random(in: 1...100)
            }
        }.padding()
    }
    
    private func tintOpacity() -> Double {
        let difference = abs(Double(targetValue) - currentValue)
        return (100 - difference) / 100
    }
    
    private func computeScore() -> Int {
        let difference = abs(targetValue - lround(currentValue))
        return 100 - difference
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
