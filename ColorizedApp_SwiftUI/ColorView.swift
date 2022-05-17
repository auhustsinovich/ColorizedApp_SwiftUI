//
//  ColorView.swift
//  ColorizedApp_SwiftUI
//
//  Created by Daniil Auhustsinovich on 17.05.22.
//

import SwiftUI

struct ColorView: View {
    
    let red: Double
    let green: Double
    let blue: Double
    
    var body: some View {
        Rectangle()
            .frame(height: 150)
            .foregroundColor(Color(red: red / 255, green: green / 255, blue: blue / 255, opacity: 1))
            .cornerRadius(15)
            .overlay(
                RoundedRectangle(cornerRadius: 15, style: .continuous)
                    .stroke(Color.white, lineWidth: 5)
            )
    }
}

struct ColorView_Previews: PreviewProvider {
    static var previews: some View {
        ColorView(red: 150, green: 10, blue: 30)
    }
}
