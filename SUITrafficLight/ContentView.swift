//
//  ContentView.swift
//  SUITrafficLight
//
//  Created by Руслан Шигапов on 10.12.2022.
//

import SwiftUI

enum CurrentLight {
    case red, yellow, green
}

struct ContentView: View {
    @State private var startButtonText = "START"
    @State private var currentLight = CurrentLight.red

    @State private var redCircleOpacity = 0.3
    @State private var yellowCircleOpacity = 0.3
    @State private var greenCircleOpacity = 0.3

    var body: some View {
        ZStack {
            Color(.black)
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                ColorCircleView(color: .red, opacity: redCircleOpacity)
                ColorCircleView(color: .yellow, opacity: yellowCircleOpacity)
                ColorCircleView(color: .green, opacity: greenCircleOpacity)
                
                Spacer()
                
                Button(action: startButtonPressed) {
                    Text(startButtonText)
                        .foregroundColor(.white)
                        .font(.title)
                }
                .frame(width: 150, height: 50)
                .background(.blue)
                .cornerRadius(10)
                .overlay(RoundedRectangle(cornerRadius: 10)
                    .stroke(Color.white, lineWidth: 3))
            }
            .padding()
        }
    }
    
    private func startButtonPressed() {
        let lightIsOn = 1.0
        let lightIsOff = 0.3
        
        switch currentLight {
        case .red:
            greenCircleOpacity = lightIsOff
            redCircleOpacity = lightIsOn
            currentLight = .yellow
        case .yellow:
            redCircleOpacity = lightIsOff
            yellowCircleOpacity = lightIsOn
            currentLight = .green
        case .green:
            yellowCircleOpacity = lightIsOff
            greenCircleOpacity = lightIsOn
            currentLight = .red
        }
        
        if startButtonText == "START" {
            startButtonText = "NEXT"
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
