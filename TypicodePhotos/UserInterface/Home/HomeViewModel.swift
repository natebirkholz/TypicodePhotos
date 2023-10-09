// HomeViewModel.swift
// Created by Nate Birkholz

import Combine
import Foundation
import SwiftUI

class HomeViewModel: ObservableObject {
    var photoInfoAgent: PhotoInfoAgent
    var cancellablesSet: Set<AnyCancellable>
    @Published var photoInfoModels: [PhotoInfoModel] = []
    
    init(photoInfoAgent: PhotoInfoAgent,
         cancellablesSet: Set<AnyCancellable>,
         photoInfoModels: [PhotoInfoModel]) {
        
        self.photoInfoAgent = photoInfoAgent
        self.cancellablesSet = cancellablesSet
        self.photoInfoModels = photoInfoModels
    }
    
    func fetchData() {
        photoInfoAgent
            .fetchPhotoArray()
            .receive(on: DispatchQueue.main)
            .sink(receiveCompletion: { completion in
                // Handle Error from completion
            }, receiveValue: { [weak self] photoInfoModels in
                self?.photoInfoModels = photoInfoModels
            }).store(in: &cancellablesSet)
    }
}
