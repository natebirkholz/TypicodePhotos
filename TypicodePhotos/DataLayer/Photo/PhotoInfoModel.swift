// PhotoInfoModel.swift
// Created by Nate Birkholz

import Foundation

struct PhotoInfoModel: Decodable, Hashable, Identifiable {
    let id: Int
    let title: String
    let url: String
    let thumbnailUrl: String
}
