//
//  ContentView.swift
//  Brew Snob
//
//  Created by India Doria on 12/6/22.
//

import SwiftUI


struct ContentView: View {
    @ObservedObject var viewModel: BrewSelectionViewModel

    @State private var showBrewSelection = false
    @State private var brewSelection: Bool = true // true is coffee, false is tea
    
    var body: some View {
        NavigationView {
            VStack {
                if showBrewSelection {
                    BrewSelectionView(viewModel: viewModel)
                } else {
                    VStack{
                        Text("Welcome to Brew Snob!")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .padding(.bottom, 20)
                        
                        Button(action: {
                            showBrewSelection = true
                        }) {
                            Text("Select your brew")
                                .font(.headline)
                                .fontWeight(.semibold)
                                .foregroundColor(.white)
                                .padding()
                                .background(Color.blue)
                                .cornerRadius(10)
                        }
                    }
                }
            }
            .navigationTitle("Brew Snob")
        }
    }
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(viewModel: BrewSelectionViewModel())
    }
}
