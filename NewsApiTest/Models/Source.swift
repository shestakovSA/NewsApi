//
//  Source.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 19.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//

import Foundation

struct NewsSource: Codable {
    let status: String?
    struct Source: Codable {
        let id: String?
        let name: String?
        let description: String?
        let url: URL?
        let category: String?
        let language: String?
        let country: String?
    }
    
    let sources: [Source]
    
    private enum CodingKeys: String, CodingKey {
        case status
        case sources
    }
}
