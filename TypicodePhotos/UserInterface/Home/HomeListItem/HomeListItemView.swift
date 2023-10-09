// HomeListItemView.swift
// Created by Nate Birkholz

import SwiftUI

struct HomeListItemView: View {
    let title: String
    let thumbnailUrlString: String
    
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: thumbnailUrlString)) { image in
                image.resizable()
            } placeholder: {
                Image(uiImage: UIImage(named: "placeholderImage")!)
                    .resizable()
            }.aspectRatio(contentMode: .fit)
                .frame(width: 64, height: 64)
                .padding(.all, 4)
            
            Text(title)
                .lineLimit(1)
                .font(.system(size: 24))
                .minimumScaleFactor(0.5)
        }
    }
}
