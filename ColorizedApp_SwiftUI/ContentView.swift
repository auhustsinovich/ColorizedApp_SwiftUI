//
//  ContentView.swift
//  ColorizedApp_SwiftUI
//
//  Created by Daniil Auhustsinovich on 17.05.22.
//

import SwiftUI

extension ContentView {
    enum FieldType: Int {
        case red, green, blue
    }
}

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var focusedField: FieldType?
    
    var body: some View {
        
        ZStack {
            Color(.init(red: 0.1, green: 0.4, blue: 0.2, alpha: 1))
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(sliderValue: $red, color: .red)
                        .focused($focusedField, equals: .red)
                    ColorSliderView(sliderValue: $green, color: .green)
                        .focused($focusedField, equals: .green)
                    ColorSliderView(sliderValue: $blue, color: .blue)
                        .focused($focusedField, equals: .blue)
                }
                .frame(height: 150)
            
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Button(action: moveUp) {
                            Image(systemName: "chevron.up")
                        }.disabled(focusedField == .red ? true : false)
                        Button(action: moveDown) {
                            Image(systemName: "chevron.down")
                        }.disabled(focusedField == .blue ? true : false)
                        Spacer()
                        
                        Button("Done") {
                            focusedField = nil
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    private func moveUp() {
        focusedField = focusedField.map {
            FieldType(rawValue: $0.rawValue - 1) ?? .red
        }
    }
    
    private func moveDown() {
        focusedField = focusedField.map {
            FieldType(rawValue: $0.rawValue + 1) ?? .blue
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

