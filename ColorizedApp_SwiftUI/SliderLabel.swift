//
//  SliderLabel.swift
//  ColorizedApp_SwiftUI
//
//  Created by Daniil Auhustsinovich on 17.05.22.
//

import SwiftUI

struct SliderLabel: View {
    
    let value: Double
    
    var body: some View {
        Text("\(lround(value))")
            .foregroundColor(.white)
            .frame(width: 40, height: 25, alignment: .leading)
    }
}

struct SliderLabel_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color(.lightGray)
                .ignoresSafeArea()
            SliderLabel(value: 111)
        }
    }
}
