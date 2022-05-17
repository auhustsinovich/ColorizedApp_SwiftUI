//
//  ColorSliderView.swift
//  ColorizedApp_SwiftUI
//
//  Created by Daniil Auhustsinovich on 17.05.22.
//

import SwiftUI

struct ColorSliderView: View {
    
    @Binding var sliderValue: Double
    @State private var text = ""
    
    var color: Color
    
    var body: some View {
        HStack() {
            SliderLabel(value: sliderValue)
            
            Slider(value: $sliderValue, in: 0...255,step: 1)
                .tint(color)
                .onChange(of: sliderValue) { newValue in
                    text = "\(lround(newValue))"
                }
            SliderTextField(textValue: $text, value: $sliderValue)
        }
        .onAppear {
            text = "\(lround(sliderValue))"
        }
    }
}

struct ColorSliderView_Previews: PreviewProvider {
    static var previews: some View {
        ColorSliderView(sliderValue: .constant(111), color: .red)
    }
}
