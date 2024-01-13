//
//  ResultView.swift
//  Recognize-Text
//
//  Created by Melih Çulha on 13.01.2024.
//

import SwiftUI

struct ResultView: View {
    
    @State var viewModel: ResultViewModel
    
    var body: some View {
        Text(viewModel.scannedText)
    }
}

#Preview {
    ResultView(viewModel: .init(scannedText: "Test Text"))
}
