// PhotosImageAgent.swift
// Created by Nate Birkholz

import Combine
import Foundation
import UIKit

struct RemoteImageAgent: DataAgent {
    let networkService: NetworkService

    init(networkService: NetworkService) {
        self.networkService = networkService
    }

    func fetchImage(from urlString: String) -> AnyPublisher<RemoteImageModel, NetworkError> {
        guard let url = URL(string: urlString) else {
            return Fail(error: NetworkError.urlError)
                .eraseToAnyPublisher()
        }
        return networkService.fetchData(from: url)
            .map({ data in
                RemoteImageModel(url: urlString,
                            image: UIImage(data: data))
            })
            .mapError({ _ in
                NetworkError.imageDecodeError
            })
            .eraseToAnyPublisher()
    }
}
