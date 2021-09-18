//
//  ScoreSlider.swift
//  SliderGameSwiftUI
//
//  Created by Nikita on 17.09.21.
//

import SwiftUI

struct ScoreSlider: UIViewRepresentable {
    
    @Binding var sliderValue: Float
    @Binding var alpha: CGFloat

    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 1
        slider.maximumValue = 100
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.didValueChanged),
            for: .valueChanged
        )
        
        return slider
    }
    
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.value = sliderValue
        uiView.thumbTintColor = UIColor(red: 1, green: 0, blue: 0, alpha: alpha / 100)
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
        ScoreSlider(sliderValue: .constant(10), alpha: .constant(5))
    }
}
