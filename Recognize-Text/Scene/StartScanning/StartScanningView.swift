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
        NavigationStack(path: $viewModel.path) {
            ZStack {
                Rectangle().fill(Color(.scanningBG).gradient)
                    .ignoresSafeArea()
                
                Button(action: self.viewModel.startScanning) {
                    StartButton()
                }
            }
            .navigationDestination(for: String.self) { result in
                ResultView(viewModel: .init(scannedText: result))
            }
        }
        .tint(.white)
        .fullScreenCover(isPresented: $viewModel.presentDocumentCamera) {
            DocumentCameraView(result: viewModel.didFinish(result:))
                .ignoresSafeArea()
        }
        .alert("Something went wrong!", isPresented: $viewModel.isErrorPresented, presenting: viewModel.errorMessage) { message in
            Button("OK") { }
        } message: { message in
            Text(message)
        }
    }
    
}

#Preview {
    StartScanningView()
}
