//
//  Model.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 18.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//

import Foundation

struct NewsArticles: Codable {
    let status: String?
    let totalResults: Int?
    struct Article: Codable {
        let source: Source
        let author: String?
        let title: String?
        let description: String?
        let url: URL?
        let urlToImage: URL?
        let publishedAt: Date
        let content: String?
        
        
        struct Source: Codable {
            let id: String?
            let name: String?
        }
    }
    
    let articles: [Article]
    
    private enum CodingKeys: String, CodingKey {
        case status
        case totalResults
        case articles
    }
}

