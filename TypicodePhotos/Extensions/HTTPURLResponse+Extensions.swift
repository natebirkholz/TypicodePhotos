// HTTPURLSession+Extensions.swift
// Created by Nate Birkholz

import Foundation

extension HTTPURLResponse {
    var succeeded: Bool {
        return 200..<300 ~= statusCode
    }
}
