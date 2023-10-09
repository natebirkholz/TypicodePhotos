// NetworkUrl.swift
// Created by Nate Birkholz

import Foundation

enum APIEndpoint: String {
    case photosAlbum = "/albums/3/photos"
    
    // I chose a method instead of a variable largely as a signal to whomever is
    // using this that the logic may fail.
    func url() -> URL {
        var urlComponents = URLComponents(string: baseUrlString)
        urlComponents?.path = rawValue

        guard let url = urlComponents?.url else {
            // Different porojects have different philosophies. I feel an
            // assertionFailure is better than a force unwrap, typically. This
            // should have a unit test for each case.
            assertionFailure("URL construction failed, baseUrl: \(baseUrlString), path: \(rawValue)")
            return .temporaryDirectory
        }
        
        return url
    }
}

extension APIEndpoint {
    private var baseUrlString: String {
        // Provided as an example, in a real production app with a stage or QA
        // environment, there would usualy be different URLs
        #if DEBUG
        return "https://jsonplaceholder.typicode.com"
        #else
        return "https://jsonplaceholder.typicode.com"
        #endif
    }
}
