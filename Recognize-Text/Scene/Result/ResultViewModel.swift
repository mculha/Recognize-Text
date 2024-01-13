//
//  ResultViewModel.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 13.01.2024.
//

import Foundation

@Observable
final class ResultViewModel {
    
    @ObservationIgnored
    let scannedText: String
    
    init(scannedText: String) {
        self.scannedText = scannedText
    }
}
