//
//  StartScanningViewModel.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 13.01.2024.
//

import Foundation
import SwiftUI


@Observable
final class StartScanningViewModel {
    
    var presentDocumentCamera: Bool = false
    
    func startScanning() {
        self.presentDocumentCamera = true
    }
}
