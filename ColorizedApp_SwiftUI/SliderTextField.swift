//
//  SliderTextField.swift
//  ColorizedApp_SwiftUI
//
//  Created by Daniil Auhustsinovich on 17.05.22.
//

import SwiftUI

struct SliderTextField: View {
    
    @Binding var textValue: String
    @Binding var value: Double
    
    @State private var showAlert = false
    
    var body: some View {
        TextField("", text: $textValue) { _ in
            checkingValue()
        }
        .frame(width: 55, alignment: .trailing)
        .multilineTextAlignment(.trailing)
        .textFieldStyle(.roundedBorder)
        .keyboardType(.decimalPad)
        .alert("Wrong Format", isPresented: $showAlert, actions: {}) {
            Text("Please, enter CORRECT value from 0 to 255")
        }
    }
}

extension SliderTextField {
    private func checkingValue() {
        if let value = Int(textValue), (0...255).contains(value) {
            self.value = Double(value)
            return
        }
        showAlert.toggle()
        value = 123
        textValue = "123"
    }
}

struct SliderTextField_Previews: PreviewProvider {
    static var previews: some View {
        SliderTextField(textValue: .constant("123"), value: .constant(123.0))
    }
}

