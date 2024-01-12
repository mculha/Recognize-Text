//
//  ContentView.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 11.01.2024.
//

import SwiftUI

struct StartScanningView: View {
    var body: some View {
        ZStack {
         
            Rectangle().fill(.black.gradient)
                .ignoresSafeArea()
            
            Button(action: self.startScanning) {
                StartButton()
            }
        }
    }
    
    private func startScanning() {
        
    }
}

#Preview {
    StartScanningView()
}
