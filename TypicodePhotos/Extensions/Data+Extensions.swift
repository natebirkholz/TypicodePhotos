// Data+Extensions.swift
// Created by Nate Birkholz

import Foundation


extension Data {
    /// Used during debugging.
    var stringValue: String {
        return String(data: self, encoding: .utf8) ?? "Not String Data"
    }
}
