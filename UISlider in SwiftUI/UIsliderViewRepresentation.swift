//
//  UIsliderView.swift
//  UISlider in SwiftUI
//
//  Created by Камаль Атавалиев on 01.05.2023.
//

import SwiftUI

struct UIsliderViewRepresentation: UIViewRepresentable {
    
    @Binding var currentValue: Double
    let tintOpacity: Double
    
    func makeUIView(context: Context) -> UISlider {
        let slider = UISlider()
        slider.minimumValue = 0
        slider.maximumValue = 100
        slider.value = Float(currentValue)
        slider.addTarget(
            context.coordinator,
            action: #selector(Coordinator.changeSliderValue),
            for: .valueChanged
        )
        return slider
    }
    func updateUIView(_ uiView: UISlider, context: Context) {
        uiView.thumbTintColor = convertInColor(tintOpacity)
    }

    private func convertInColor(_ opacity: Double) -> UIColor {
        UIColor(
            cgColor: CGColor(
                red: 1,
                green: 0,
                blue: 0,
                alpha: CGFloat(opacity)
            )
        )
    }
    
    func makeCoordinator() -> Coordinator {
        Coordinator(sliderValue: $currentValue)
    }
    
    
}
struct UIsliderView_Previews: PreviewProvider {
    static var previews: some View {
        UIsliderViewRepresentation(currentValue: .constant(20), tintOpacity: 1)
    }
    
}

extension UIsliderViewRepresentation {
    final class Coordinator: NSObject {
        @Binding var sliderValue: Double
        
        init(sliderValue: Binding<Double>) {
            self._sliderValue = sliderValue
        }
        @objc func changeSliderValue(sender: UISlider) {
            sliderValue = Double(sender.value)
        }
    }
}
