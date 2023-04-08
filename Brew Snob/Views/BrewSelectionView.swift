//  BrewSelectionView.swift
//  Brew Snob
//
//  Created by India Doria on 12/13/22.
//

import SwiftUI


struct BrewSelectionView: View {
    @ObservedObject var viewModel: BrewSelectionViewModel

    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    @State private var selection: BrewType?

    enum BrewType {
        case tea, coffee
    }

    var body: some View {
        NavigationView {
            VStack {
                Spacer()
                NavigationLink(destination: BrewListView(viewModel: viewModel, type: .tea), tag: .tea, selection: $selection) {
                    Text("Teas")
                        .foregroundColor(.black)
                        .font(Font.custom("Fonts/LemonMilklight", size: 24))
                }
                Spacer()
                NavigationLink(destination: BrewListView(viewModel: viewModel, type: .coffee), tag: .coffee, selection: $selection) {
                    Text("Coffees")
                        .foregroundColor(.black)
                        .font(Font.custom("Fonts/LemonMilklight", size: 24))
                }
                Spacer()
            }
            .navigationTitle("Select a Brew")
        }
    }
}
