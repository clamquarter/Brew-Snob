////
////  WaterInputView.swift
////  Brew Snob
////
////  Created by India Doria on 12/6/22.
////
//
//import SwiftUI
//
//
//struct WaterInputView: View {
//    @Binding var waterRatio: String
//    @Binding var coffee: String
//
//
//    var body: some View {
//        VStack {
//            Text("You need")
//                .fixedSize()
//                .font(.system(size: 24))
//
//            Text(
//                String(
//                    CalculatorViewModel.calculateGramsOfWaterTimes(
//                        waterRatio: Grams(waterRatio) ?? 0.0,
//                        coffee: Grams(coffee) ?? 0.0
//                    )
//                )
//            )
//                .fixedSize()
//                .font(.system(size: 72))
//
//
//            Text("grams of water")
//                .fixedSize()
//                .font(.system(size: 24))
//        }
//    }
//
//}
//
//
////struct WaterInputView_Previews: PreviewProvider {
////    static var previews: some View {
////        WaterInputView()
////    }
////}
