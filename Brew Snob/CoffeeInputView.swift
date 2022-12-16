//
//  CoffeInputView.swift
//  Brew Snob
//
//  Created by India Doria on 12/6/22.
//

import SwiftUI
import Combine

struct CoffeeInputView: View {
    @Binding var amount: String

    var body: some View {
        VStack {
            Text("How much coffee?")
                .bold()
                .fixedSize()
                .foregroundColor(Color("Text"))
                .font(.system(size: 24))

            TextField("", text: $amount)
                .frame(width: CGFloat(150), height: CGFloat(39))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(Color("Primary"), lineWidth: 3)
                )
                .multilineTextAlignment(.center)
                .keyboardType(.decimalPad)
                .onReceive(Just(amount)) { newValue in
                    
                    
                    
                    let filtered = newValue.filter { "0123456789.0".contains($0) }
                    if filtered != newValue {
                        self.amount = filtered
                    }
                }
            

            Text("grams")
                .fixedSize()
                .foregroundColor(Color("Text"))
                .font(.system(size: 14))

        }
    }
}

//struct CoffeInputView_Previews: PreviewProvider {
//    static var previews: some View {
//        CoffeInputView(amount: $amount)
//    }
//}
