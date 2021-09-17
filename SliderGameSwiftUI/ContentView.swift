//
//  ContentView.swift
//  SliderGameSwiftUI
//
//  Created by Nikita on 17.09.21.
//

import SwiftUI

struct ContentView: View {
    @State private var sliderValue: Float = 0.0
    @State private var alertPresented = false
    
    var body: some View {
        VStack {
            Text("Подвинь слайдер, как можно ближе к: \(lround(Double(sliderValue)))")
                .padding()
            ScoreSlider(sliderValue: $sliderValue, minimumValue: 0, maximumValue: 100)
                .padding()
            Button("Проверь меня!") {
                alertPresented.toggle()
            }
            .alert(isPresented: $alertPresented) {
                Alert(
                    title: Text("Результат"),
                    message: Text("1"),
                    dismissButton: .cancel()
                )
            }
            .padding()
            Button("Начать заново") {
                
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
