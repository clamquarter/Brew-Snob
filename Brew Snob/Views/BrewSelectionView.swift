//  BrewSelectionView.swift
//  Brew Snob
//
//  Created by India Doria on 12/13/22.
//

import SwiftUI


struct BrewSelectionView: View {
    @ObservedObject var viewModel = BrewSelectionViewModel()
    //this is passed in from the Content view. true is coffee, false is tea.
    @Binding var brewSelection: Bool
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        NavigationStack {
            ScrollView {
                LazyVGrid(columns: columns) {
                    ForEach(viewModel.beverages) { beverage in
                        NavigationLink(destination: BrewingView(brewTime: beverage.time)) {
                            VStack {
                                Image(beverage.image)
                                    .resizable()
                                    .aspectRatio(contentMode: .fit)
                                    .clipShape(Rectangle())
                                    .cornerRadius(20)
                                    .padding()
                                    .shadow(color: .black, radius: 7, x: 7, y: 7)
                                Text(beverage.name)
                                    .font(Font.custom("Fonts/LemonMilklight", size: 24))
                                    .foregroundColor(.black)
                            }
                        }
                    }
                }
            }
        }
    }

}
