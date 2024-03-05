//
//  DefaultResponse.swift
//  Networking-MotionLab
//
//  Created by Rakha Fatih Athallah on 14/02/24.
//

import Foundation

// Struct ini codable dan juga data yang akan dibawa codable
struct ListDataResponse<T: Codable>: Codable {
    var data: [T]?
}

struct DataResponse<T: Codable>: Codable {
    var data: T?
}
