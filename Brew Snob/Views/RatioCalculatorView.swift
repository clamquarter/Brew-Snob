//
//  RatioCalculatorView.swift
//  Brew Snob
//
//  Created by India Doria on 12/16/22.
//

import SwiftUI

//
//  RatioCalculatorView.swift
//  Brew Snob
//
//  Created by India Doria on 04/08/2023.
//

import SwiftUI

struct RatioCalculatorView: View {
    @State private var beverageAmount: Double = 0
    @State private var waterAmount: Double = 0
    @State private var selectedBeverage: BrewMethod?

    let beverages: [BrewMethod]

    var body: some View {
        NavigationView {
            VStack {
                Form {
//                    Section(header: Text("Beverage")) {
//                        Picker("Beverage", selection: $selectedBeverage) {
//                            ForEach(beverages) { beverage in
//                                Text(beverage.name).tag(beverage as BrewMethod?)
//                            }
//                        }
//                    }
                    Section(header: Text("Amount")) {
                        HStack{
                            HStack {
                                TextField("Beverage amount (g)", value: $beverageAmount, formatter: NumberFormatter())
                                    .keyboardType(.decimalPad)
                                Text(selectedBeverage?.name == "Tea" ? "g" : " grounds")
                            }
                            HStack {
                                TextField("Water amount (g)", value: $waterAmount, formatter: NumberFormatter())
                                    .keyboardType(.decimalPad)
                                Text("water")
                            }
                        }
                    }
                    Section(header: Text("Ratio")) {
                        if let selectedBeverage = selectedBeverage {
                            let ratio = selectedBeverage.waterRatio / 1000
                            let waterToBeverageRatio = String(format: "%.2f", waterAmount / beverageAmount * ratio)
                            Text("1:\(selectedBeverage.waterRatio) ratio")
                            Text("Water to beverage ratio: 1:\(waterToBeverageRatio)")
                        }
                    }
                }
                .navigationTitle("Ratio Calculator")
            }
        }
    }
}


//struct RatioCalculatorView_Previews: PreviewProvider {
//    static var previews: some View {
//        RatioCalculatorView()
//    }
//}
