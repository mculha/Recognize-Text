//
//  StartButton.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 12.01.2024.
//

import SwiftUI

struct StartButton: View {
    
    @State private var wave: Bool = false
    private let duration: TimeInterval = 1.0
    
    var body: some View {
        ZStack {
            
            Circle()
                .stroke(lineWidth: 1)
                .frame(width: 150, height: 150)
                .foregroundStyle(Color(.btnStartBG))
                .scaleEffect(wave ? 1.5 : 1)
                .opacity(wave ? 0 : 1)
                .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false), value: wave)
            
            Circle()
                .stroke(lineWidth: 1)
                .frame(width: 150, height: 150)
                .foregroundStyle(Color(.btnStartBG))
                .scaleEffect(wave ? 1.5 : 1)
                .opacity(wave ? 0 : 1)
                .animation(.easeInOut(duration: duration).repeatForever(autoreverses: false).delay(0.5), value: wave)
            
            Circle()
                .frame(width: 150, height: 150)
                .foregroundStyle(Color(.btnStartBG))
                .shadow(radius: 25)
            
            Text("Start")
                .font(.system(size: 25))
                .fontWeight(.bold)
                .foregroundStyle(.white)
            
        }
        .frame(width: 150, height: 150)
        .onAppear {
            self.wave.toggle()
        }
    }
}

#Preview {
    StartButton()
}
