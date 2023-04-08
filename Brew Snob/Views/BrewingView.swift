//
//  BrewingView.swift
//  Brew Snob
//
//  Created by India Doria on 12/15/22.
//this is the screen the user will see while brewing coffee/tea

import SwiftUI

//the brewing view is the screen the user will use when brewing, and will pull data based on the method selected by the user. a timer, the coffee/tea : water ratio, and some tips will display.

struct BrewingView: View {
    //brew time is the time in seconds, to be passed in based on user selection
    var brewTime: Int
    
    var body: some View {
        VStack{
            TimerView(initialTime: brewTime, timeRemaining: brewTime)
        }
    }
}

//struct BrewingView_Previews: PreviewProvider {
//    static var previews: some View {
//        BrewingView(brewTime: 640)
//    }
//}
