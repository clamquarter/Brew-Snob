//
//  BrewListView.swift
//  Brew Snob
//
//  Created by India Doria on 4/8/23.
//

import SwiftUI

struct BrewListView: View {
    @ObservedObject var viewModel: BrewSelectionViewModel
    let type: BrewSelectionView.BrewType
    let columns = [GridItem(.flexible()), GridItem(.flexible())]

    var body: some View {
        ScrollView {
            LazyVGrid(columns: columns) {
                ForEach(brews) { brew in
                    NavigationLink(destination: BrewingView(viewModel: viewModel, brewTime: brew.time)) {
                        VStack {
                            Image(brew.image)
                                .resizable()
                                .aspectRatio(contentMode: .fit)
                                .clipShape(Rectangle())
                                .cornerRadius(20)
                                .padding()
                                .shadow(color: .black, radius: 7, x: 7, y: 7)
                            Text(brew.name)
                                .font(Font.custom("Fonts/LemonMilklight", size: 24))
                                .foregroundColor(.black)
                        }
                    }
                }
            }
        }
        .navigationTitle("\(type == .tea ? "Teas" : "Coffees")")
    }

    var brews: [BrewMethod] {
        switch type {
        case .tea:
            return teas
        case .coffee:
            return coffees
        }
    }
}

//struct BrewListView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrewListView(viewModel: <#BrewSelectionViewModel#>, type: .coffee)
//    }
//}
