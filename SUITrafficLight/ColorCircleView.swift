//
//  ColorCircleView.swift
//  SUITrafficLight
//
//  Created by Руслан Шигапов on 10.12.2022.
//

import SwiftUI

struct ColorCircleView: View {
    let color: Color
    var opacity: Double
    
    var body: some View {
        Circle()
            .frame(width: 120, height: 120)
            .foregroundColor(color)
            .opacity(opacity)
    }
}
