//
//  TimerView.swift
//  Brew Snob
//
//  Created by India Doria on 12/6/22.
//

import SwiftUI
import Combine



struct TimerView: View {
    //timeRemaining is the brew timer countdown in seconds.
    @State var timeRemaining: Int
    @State var timerRunning = false
    //the timerButtonImage String refers to an SF symbol image
    @State var timerButtonImage = "play"
    //
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

    //this function converts the timer countdown in seconds to a formatted String, resulting in the typical timer display
    func convertSecondsToTime(timeInSeconds: Int) -> String {
        //minutes = the timeInSeconds Int passed in, divided by 60 to give minutes. (60 seconds in every minute)
        let minutes = timeInSeconds / 60
        //seconds = the time
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }
    
        var body: some View {
            VStack{
                Text("\(convertSecondsToTime(timeInSeconds:timeRemaining))")
                    .onReceive(timer) { _ in
                        if timeRemaining > 0 && timerRunning {
                            timeRemaining -= 1
                        } else {
                            timerRunning = false
                        }
                    }.font(.system(size: 40))
                HStack{
                    Button(action: {
                        timerRunning.toggle()
                        if timerRunning {
                            timerButtonImage = "pause"
                        } else {
                            timerButtonImage = "play"
                        }
                    }) {
                        Image(systemName: timerButtonImage)                            .font(.system(size: 30))
                    }
                    
                    Button(action: {
                        timerRunning = false
                        timeRemaining = 600
                        timerButtonImage = "play"
                    }) {
                        Text("Reset")
                        .font(.system(size: 17))
                        .fixedSize()
                    }
                }
            }
        }

}



struct TimerView_Previews: PreviewProvider {
    static var previews: some View {
        TimerView(timeRemaining: 640)
    }
}
