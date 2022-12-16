//  BrewSelectionView.swift
//  Brew Snob
//
//  Created by India Doria on 12/13/22.
//

import SwiftUI


struct BrewSelectionView: View {
    //this is passed in from the Content view. true is coffee, false is tea.
    @Binding var brewSelection: Bool
    let columns = [GridItem(.flexible()), GridItem(.flexible())]
    
    var body: some View {
        NavigationStack{
            ScrollView {
                LazyVGrid(columns: columns) {
                    if brewSelection == true {
                        ForEach(coffees) {
                            coffee in
                            
                            NavigationLink(destination: BrewingView(brewTime: coffee.time) ) {
                                VStack {
                                    Image(coffee.image).resizable().aspectRatio(contentMode: .fit).clipShape(Rectangle()).cornerRadius(20).padding().shadow(color: .black, radius: 7,x: 7, y: 7)
                                    Text(coffee.name).font(Font.custom("Fonts/LemonMilklight", size: 24)).foregroundColor(.black)
                                }
                            }
                            //Text(coffee.name)
                        }
                        
                        
                    } else {
                        ForEach(teas) {
                            tea in
                            
                            NavigationLink( destination: BrewingView(brewTime: tea.time) ) {
                                VStack{ Image(tea.image).resizable().aspectRatio(contentMode: .fit).clipShape(Rectangle()).cornerRadius(20).padding().shadow(color: .black, radius: 7,x: 7, y: 7)
                                    Text(tea.name).foregroundColor(.black).font(Font.custom("//Fonts/LemonMilklight", size: 24))
                                    
                                }
                                
                            }
                        }
                    }
                }
                //Text(brewSelection.keys)
                
            }
        }
    }
    
    
}
