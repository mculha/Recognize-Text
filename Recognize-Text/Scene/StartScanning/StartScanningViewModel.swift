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
    var path: [RecognizeTextResultModel] = []
    var isErrorPresented: Bool = false
    var errorMessage: String?
    
    @ObservationIgnored
    private var textRecognitionRequest = VNRecognizeTextRequest()
    @ObservationIgnored
    private var image: UIImage?
    
    init() {
        self.initiliazeRecognizeTextRequest()
    }

    func startScanning() {
        self.presentDocumentCamera = true
    }
}

//MARK - For Vision and VisionKit
extension StartScanningViewModel {
    
    private func initiliazeRecognizeTextRequest() {
        textRecognitionRequest = VNRecognizeTextRequest { (request, error) in
            guard let results = request.results, !results.isEmpty else { return }
            guard let requestResults = results as? [VNRecognizedTextObservation] else { return }
            guard let image = self.image else { return }
            var scannedText: String = ""
            for observation in requestResults {
                guard let candidate = observation.topCandidates(1).first else { return }
                scannedText += candidate.string
                scannedText += "\n"
            }
            
            self.path.append(.init(image: image, text: scannedText))
        }
        textRecognitionRequest.recognitionLevel = .accurate
        textRecognitionRequest.usesLanguageCorrection = true
    }
    
    private func processImage(_ image: UIImage) {
        guard let cgImage = image.cgImage else { return }
        self.image = image
        let handler = VNImageRequestHandler(cgImage: cgImage)
        try? handler.perform([textRecognitionRequest])
    }
    
    func didFinish(result: Result<VNDocumentCameraScan, Error>) {
        switch result {
        case .success(let scan):
            for index in 0..<scan.pageCount {
                let image = scan.imageOfPage(at: index)
                self.processImage(image)
            }
        case .failure(let failure):
            self.errorMessage = failure.localizedDescription
            self.isErrorPresented = true
        }
    }
}
