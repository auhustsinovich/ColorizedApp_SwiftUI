//
//  ContentView.swift
//  ColorizedApp_SwiftUI
//
//  Created by Daniil Auhustsinovich on 17.05.22.
//

import SwiftUI

struct ContentView: View {
    
    @State private var red = Double.random(in: 0...255)
    @State private var green = Double.random(in: 0...255)
    @State private var blue = Double.random(in: 0...255)
    
    @FocusState private var isInputActive: Bool
    
    var body: some View {
        
        ZStack {
            Color(.init(red: 0.1, green: 0.4, blue: 0.2, alpha: 1))
                .ignoresSafeArea()
                .onTapGesture {
                    isInputActive = false
                }
            
            VStack(spacing: 20) {
                
                ColorView(red: red, green: green, blue: blue)
                
                VStack {
                    ColorSliderView(sliderValue: $red, color: .red)
                    ColorSliderView(sliderValue: $green, color: .green)
                    ColorSliderView(sliderValue: $blue, color: .blue)
                }
                .frame(height: 150)
                .focused($isInputActive)
                .toolbar {
                    ToolbarItemGroup(placement: .keyboard) {
                        
                        Button(action: moveUp) {
                            Image(systemName: "chevron.up")
                        }
                        Button(action: moveDown) {
                            Image(systemName: "chevron.down")
                        }
                        Spacer()
                        
                        Button("Done") {
                            isInputActive = false
                        }
                    }
                }
                Spacer()
            }
            .padding()
        }
    }
    
    private func moveUp() {
        
    }
    
    private func moveDown() {
        
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

