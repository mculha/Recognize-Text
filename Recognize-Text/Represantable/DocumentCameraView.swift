//
//  DocumentCameraView.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 13.01.2024.
//

import Foundation
import SwiftUI
import VisionKit
import Vision

struct DocumentCameraView: UIViewControllerRepresentable {
    
    public typealias UIViewControllerType = VNDocumentCameraViewController
    public typealias CameraResult = Result<VNDocumentCameraScan, Error>
    public typealias ResultAction = (CameraResult) -> Void
    
    private let result: ResultAction
    
    init(result: @escaping ResultAction) {
        self.result = result
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
        
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentCamera = VNDocumentCameraViewController()
        documentCamera.delegate = context.coordinator
        return documentCamera
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) { }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        private let parent: DocumentCameraView
        
        init(_ parent: DocumentCameraView) {
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
            controller.dismiss(animated: true) {
                self.parent.result(.success(scan))
            }
        }
        
        func documentCameraViewControllerDidCancel(_ controller: VNDocumentCameraViewController) {
            controller.dismiss(animated: true)
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFailWithError error: Error) {
            controller.dismiss(animated: true)
        }
    }
}
