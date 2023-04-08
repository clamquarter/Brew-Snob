//
//  TimerView.swift
//  Brew Snob
//
//  Created by India Doria on 12/6/22.
//

import SwiftUI
import Combine


struct TimerView: View {
    @State var timeRemaining: Int
    @State var initialTime: Int
    @State var timerRunning = false
    @State var timerButtonImage = "play"
    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    @State var isEditing = false
    @State var inputTime: String = ""

    func convertSecondsToTime(timeInSeconds: Int) -> String {
        let minutes = timeInSeconds / 60
        let seconds = timeInSeconds % 60
        return String(format: "%02i:%02i", minutes, seconds)
    }

    func convertTimeToSeconds(_ time: String) -> Int {
        let components = time.split(separator: ":").map { Int($0) ?? 0 }
        switch components.count {
        case 1: // seconds only
            return components[0]
        case 2: // minutes and seconds
            return components[0] * 60 + components[1]
        case 3: // hours, minutes, and seconds
            return components[0] * 3600 + components[1] * 60 + components[2]
        default:
            return 0
        }
    }

    var body: some View {
        VStack {
            if isEditing {
                TextField("", text: $inputTime, onCommit: {
                    timeRemaining = convertTimeToSeconds(inputTime)
                    initialTime = timeRemaining
                    isEditing = false
                })
                .keyboardType(.numbersAndPunctuation)
                .multilineTextAlignment(.center)
                .font(.system(size: 40))
            } else {
                Text("\(convertSecondsToTime(timeInSeconds:timeRemaining))")
                    .font(.system(size: 40))
                    .onReceive(timer) { _ in
                           if timeRemaining > 0 && timerRunning {
                               timeRemaining -= 1
                           } else {
                               timerRunning = false
                           }
                       }
                    .onTapGesture {
                        inputTime = convertSecondsToTime(timeInSeconds:timeRemaining)
                        isEditing = true
                    }
            }
            HStack {
                Button(action: {
                    timerRunning.toggle()
                    if timerRunning {
                        timerButtonImage = "pause"
                    } else {
                        timerButtonImage = "play"
                    }
                }) {
                    Image(systemName: timerButtonImage)
                        .font(.system(size: 30))
                }

                Button(action: {
                    timerRunning = false
                    timeRemaining = initialTime
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
        TimerView( timeRemaining: 640, initialTime: 640)
    }
}
