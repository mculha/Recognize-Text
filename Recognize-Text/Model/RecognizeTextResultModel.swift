//
//  RecognizeTextResultModel.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 15.01.2024.
//

import Foundation
import SwiftUI

struct RecognizeTextResultModel: Identifiable, Hashable {
    let id: UUID = UUID()
    let image: UIImage
    let text: String
}
