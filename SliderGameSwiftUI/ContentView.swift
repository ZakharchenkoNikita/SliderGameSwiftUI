//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Nikita on 17.09.21.
//

import SwiftUI

struct ContentView: View {
    
    @State private var sliderValue: Float = 0.0
    @State private var alpha: CGFloat = 0
    @State private var alertPresented = false
    
    @EnvironmentObject var scoreGenerator: ScoreGenerator
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(scoreGenerator.targetValue)")
                .padding()
            
            HStack {
                Text("1")
                ScoreSlider(
                    sliderValue: $sliderValue,
                    alpha: $alpha
                )
                Text("100")
            }
            .onChange(of: sliderValue) { value in
                scoreGenerator.currentValue = Int(value)
                getAlphaValue()
            }
            .onAppear { getAlphaValue() }
            .padding()
            
            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert(isPresented: $alertPresented) {
                Alert(
                    title: Text("Результат"),
                    message: Text("\(scoreGenerator.computeScore())%"),
                    dismissButton: .cancel()
                )
            }
            .padding()
            Button("Начать заново") {
                scoreGenerator.targetValue = Int.random(in: 1...100)
                getAlphaValue()
            }
        }
    }
    
    private func getAlphaValue() {
        alpha = CGFloat(scoreGenerator.computeScore())
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(ScoreGenerator())
    }
}
