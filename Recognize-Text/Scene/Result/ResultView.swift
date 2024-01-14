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
        ZStack {
            Rectangle().fill(Color(.scanningBG).gradient)
                .ignoresSafeArea()
            
            Text(viewModel.scannedText)
                .foregroundStyle(.white)
                .font(.title3)
        }
    }
}

#Preview {
    ResultView(viewModel: .init(scannedText: "Test Text"))
}
