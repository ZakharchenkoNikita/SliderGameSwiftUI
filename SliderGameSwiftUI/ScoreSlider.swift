//
//  ScoreSlider.swift
//  SliderGameSwiftUI
//
//  Created by Nikita on 17.09.21.
//

import SwiftUI

struct ScoreSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    
    var minimumValue: Float
    var maximumValue: Float
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = minimumValue
        slider.maximumValue = maximumValue
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $sliderValue)
    }
}

extension ScoreSlider {
    class Coordinator: NSObject {
        @Binding var sliderValue: Float
        
        init(sliderValue: Binding<Float>) {
            self._sliderValue = sliderValue
        }
        
        @objc func didValueChanged(_ sender: UISlider) {
            sliderValue = sender.value
        }
    }
}

struct ScoreSlider_Previews: PreviewProvider {
    static var previews: some View {
        ScoreSlider(sliderValue: .constant(10), minimumValue: 0, maximumValue: 100)
    }
}
