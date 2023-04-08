//
//  ContentView.swift
//  Brew Snob
//
//  Created by India Doria on 12/6/22.
//

import SwiftUI


struct ContentView: View {
 @State var tea = false
    @State var coffee = true
    
    var body: some View {
    
                VStack{
//                    Text("BrewSnob").font(.title)
                    Image("lightModeLogo").resizable().aspectRatio( contentMode: .fit).padding()
                    TabView {
                        BrewSelectionView(brewSelection: $tea).tabItem {
                          Label("Tea", systemImage: "cup.and.saucer")
                        }
                        BrewSelectionView(brewSelection: $coffee).tabItem {
                            Label("Coffee", systemImage: "mug")
                        }
                    
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
