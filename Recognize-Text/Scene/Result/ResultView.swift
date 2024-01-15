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
            VStack {
                Image(uiImage: viewModel.model.image)
                    .resizable()
                    .scaledToFit()
                    .clipShape(RoundedRectangle(cornerRadius: 10))
                    .frame(minWidth: 100, minHeight: 100)
                    .padding(20)
                    
                
                ScrollView {
                    Text(viewModel.model.text)
                        .foregroundStyle(.white)
                        .font(.system(size: 12))
                        .frame(maxWidth: .infinity)
                }
            }
        }
    }
}

#Preview {
    ResultView(viewModel: .init(model: .init(image: UIImage(), text: "Test Text")))
}
