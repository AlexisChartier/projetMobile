//
//  InputCustom.swift
//  Projet mobile
//
//  Created by Samy Louchahi on 23/03/2024.
//

import SwiftUI

struct InputCustom: View {
    let imageName: String
    let placeholderText: String
    var textCase: Text.Case?
    var keyboardType: UIKeyboardType?
    var textContentType: UITextContentType?
    var textInputAutoCapital: TextInputAutocapitalization?
    var isSecureField: Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack {
            HStack {
                Image(systemName: imageName)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color.gray)
                
                if isSecureField ?? false {
                    SecureField(placeholderText, text: Binding(get: {
                        return self.text
                    }, set: {
                        self.text = $0
                        text = setTextCase(text: $0)
                    }))
                    .textContentType(textContentType != nil ? textContentType : .none)
                } else {
                    TextField(placeholderText, text: Binding(get: {
                        return self.text
                    }, set: {
                        self.text = $0
                        text = setTextCase(text: $0)
                    }))
                    .keyboardType(keyboardType != nil ? keyboardType! : .default)
                    .textContentType(textContentType != nil ? textContentType : .none)
                    .disableAutocorrection(true)
                    .textInputAutocapitalization(textInputAutoCapital != nil ? textInputAutoCapital : .none)
                    .onChange(of: text) { newValue in
                        text = setTextCase(text: text)
                    }
                }
            }
        }
    }
}

#Preview {
    InputCustom(imageName: "enveloppe", placeholderText: "Email", text: .constant(""))
}
extension InputCustom {
    
    func setTextCase(text: String) -> String {
        if let textCase = textCase {
            if textCase == .uppercase {
                return text.uppercased()
            } else if textCase == .lowercase {
                return text.lowercased()
            }
        }
        return text
    }
}
