//
//  ContentView.swift
//  SUITrafficLight
//
//  Created by Руслан Шигапов on 10.12.2022.
//

import SwiftUI

struct ContentView: View {
    @State private var startButtonText = "START"
    @State private var currentLight = CurrentLight.red
    
    static let lightIsOn = 1.0
    static let lightIsOff = 0.3
    
    @State private var redCircleOpacity = lightIsOff
    @State private var yellowCircleOpacity = lightIsOff
    @State private var greenCircleOpacity = lightIsOff

    var body: some View {
        ZStack {
            Color(.black)
            VStack {
                ColorCircleView(
                    color: .red,
                    opacity: redCircleOpacity
                )
                ColorCircleView(
                    color: .yellow,
                    opacity: yellowCircleOpacity
                )
                    .padding()
                ColorCircleView(
                    color: .green,
                    opacity: greenCircleOpacity
                )
                Spacer()
                Button(action: startButtonPressed) {
                    ZStack {
                        Color(.systemBlue)
                            .frame(width: 150, height: 50)
                            .cornerRadius(10)
                        Text(startButtonText)
                            .foregroundColor(.white)
                            .font(.title)
                    }
                }
            }
            .padding(EdgeInsets(top: 56, leading: 0, bottom: 56, trailing: 0))
        }
        .ignoresSafeArea()
    }
    
    private func startButtonPressed() {
        if startButtonText == "START" {
            startButtonText = "NEXT"
        }
        
        switch currentLight {
        case .red:
            greenCircleOpacity = ContentView.lightIsOff
            redCircleOpacity = ContentView.lightIsOn
            currentLight = .yellow
        case .yellow:
            redCircleOpacity = ContentView.lightIsOff
            yellowCircleOpacity = ContentView.lightIsOn
            currentLight = .green
        case .green:
            yellowCircleOpacity = ContentView.lightIsOff
            greenCircleOpacity = ContentView.lightIsOn
            currentLight = .red
        }
    }
}

extension ContentView {
    private enum CurrentLight {
        case red, yellow, green
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
