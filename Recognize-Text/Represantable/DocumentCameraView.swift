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
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(self)
    }
    
    typealias UIViewControllerType = VNDocumentCameraViewController
    
    func makeUIViewController(context: Context) -> VNDocumentCameraViewController {
        let documentCamera = VNDocumentCameraViewController()
        documentCamera.delegate = context.coordinator
        return documentCamera
    }
    
    func updateUIViewController(_ uiViewController: VNDocumentCameraViewController, context: Context) {
        
    }
    
    class Coordinator: NSObject, VNDocumentCameraViewControllerDelegate {
        
        private let parent: DocumentCameraView
        
        init(_ parent: DocumentCameraView) {
            self.parent = parent
        }
        
        func documentCameraViewController(_ controller: VNDocumentCameraViewController, didFinishWith scan: VNDocumentCameraScan) {
           //TODO - Build HERE
        }
    }
}
