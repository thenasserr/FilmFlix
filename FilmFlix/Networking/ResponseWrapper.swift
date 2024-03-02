//
//  ResponseWrapper.swift
//  Combine+Learn
//
//  Created by Ibrahim Nasser Ibrahim on 29/02/2024.
//

import Foundation

struct ResponseWrapper<T: Decodable>: Decodable {
    let data: T?

    private enum CodingKeys: String, CodingKey {
        case data
    }
}
