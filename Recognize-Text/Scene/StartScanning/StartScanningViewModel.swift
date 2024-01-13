//
//  StartScanningViewModel.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 13.01.2024.
//

import Foundation
import SwiftUI
import Vision
import VisionKit


@Observable
final class StartScanningViewModel {
    
    var presentDocumentCamera: Bool = false
    
    @ObservationIgnored
    private var textRecognitionRequest = VNRecognizeTextRequest()

    init() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let results = request.results, !results.isEmpty else { return }
            guard let requestResults = results as? [VNRecognizedTextObservation] else { return }
            
            var scannedText: String = ""
            for observation in requestResults {
                guard let candidate = observation.topCandidates(1).first else { return }
                scannedText += candidate.string
                scannedText += "\n"
            }
            
            print("Text: \(scannedText)")
        }
        textRecognitionRequest.recognitionLevel = .accurate
        textRecognitionRequest.usesLanguageCorrection = true
    }
    
    func startScanning() {
        self.presentDocumentCamera = true
    }
    
    func didFinish(result: Result<VNDocumentCameraScan, Error>) {
        switch result {
        case .success(let scan):
            for index in 0..<scan.pageCount {
                let image = scan.imageOfPage(at: index)
                self.processImage(image)
            }
        case .failure(let failure):
            break
        }
    }
    
    private func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        let handler = VNImageRequestHandler(cgImage: cgImage)
        try? handler.perform([textRecognitionRequest])
    }
}
