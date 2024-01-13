//
//  ContentView.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 11.01.2024.
//

import SwiftUI
import Vision
import VisionKit

struct StartScanningView: View {
    
    @State private var viewModel: StartScanningViewModel = .init()
    
    var body: some View {
        ZStack {
         
            Rectangle().fill(Color(.scanningBG).gradient)
                .ignoresSafeArea()
            
            Button(action: self.viewModel.startScanning) {
                StartButton()
            }
        }
        .fullScreenCover(isPresented: $viewModel.presentDocumentCamera) {
            DocumentCameraView(result: viewModel.didFinish(result:))
                .ignoresSafeArea()
        }
    }
    
}

#Preview {
    StartScanningView()
}
