// HomeView.swift
// Created by Nate Birkholz

import SwiftUI

struct HomeView: View {
    @ObservedObject var viewModel: HomeViewModel
    
    var body: some View {
        ZStack {
            Color("backgroundColor")
            
            if viewModel.photoInfoModels.isEmpty {
                VStack {
                    Spacer()
                    ProgressView()
                        .controlSize(.extraLarge)
                        .progressViewStyle(CircularProgressViewStyle(tint: Color.black))
                    Spacer()
                }.onAppear {
                    viewModel.fetchData()
                }
            } else {
                List(viewModel.photoInfoModels) { photoModel in
                    HomeListItemView(title: photoModel.title,
                                     thumbnailUrlString: photoModel.thumbnailUrl)
                }
            }
        }
    }
}
