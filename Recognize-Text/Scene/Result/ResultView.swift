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
            
            ScrollView {
                Text(viewModel.model.text)
                    .foregroundStyle(.white)
                    .font(.system(size: 10))
            }
        }
    }
}

#Preview {
    ResultView(viewModel: .init(model: .init(image: UIImage(), text: "Test Text")))
}
