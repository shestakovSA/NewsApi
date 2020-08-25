//
//  Network.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 18.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//
// MARK: - News API https://newsapi.org

import Foundation

//MARK: - Sorting Order
/*
enum SortOptions: String {
    case relevancy
    case popularity
    case publishedAt
}
*/
//MARK: - URL
//var topHeadLinesUrl = URLComponents(string: "https://newsapi.org/v2/top-headlines?")
var everythingUrl = URLComponents(string: "https://newsapi.org/v2/everything?")
var sourcesUrl = URLComponents(string: "https://newsapi.org/v2/sources?")

//MARK: - API Parametrs
//let search = URLQueryItem(name: "q", value: "Yours text for seaching")
//let fromDate = URLQueryItem(name: "from", value: "Yours Data")
//let toDate = URLQueryItem(name: "to", value: "Yours Data")
//let sortBy = URLQueryItem(name: "sortBy", value: SortOptions.publishedAt.rawValue)
let language = URLQueryItem(name: "language", value: "en")
//let country = URLQueryItem(name: "country", value: "us")

let secretAPIKey = URLQueryItem(name: "apiKey", value: "b1c03fce25994d9a9d76a1628e118bb2")

//check URL
var switchId: Int = 0
//check Internet connection
var internet: Bool = false

//MARK: - Funcion of get URL
func allChannelNews() -> URL? {
    switchId = 1
    sourcesUrl?.queryItems?.append(language)
    sourcesUrl?.queryItems?.append(secretAPIKey)
    return sourcesUrl?.url
}


func topHeadlinesFavorite(nameChannel: String) -> URL? {
    switchId = 2
    var endURL = everythingUrl
    let sourcesName = URLQueryItem(name: "sources", value: nameChannel)
    endURL?.queryItems?.append(sourcesName)
    endURL?.queryItems?.append(secretAPIKey)
    return endURL?.url
}


func evrythingSearch (textSearch: String) -> URL? {
    switchId = 3
    var endURL = everythingUrl
    let search = URLQueryItem(name: "q", value: textSearch)
    endURL?.queryItems?.append(search)
    endURL?.queryItems?.append(secretAPIKey)
    return endURL?.url
}

//MARK: - Object
//Object that keeps the news feed and help object
var feedSource: [NewsSource.Source] = []
var items: [NewsSource.Source] = []
var itemsFavorite = [NewsArticles.Article]()
var feedArticleSearch: [NewsArticles.Article] = []
var feedArticle: [NewsArticles.Article] = []

var errorMessage = ""
let decoder = JSONDecoder()

//MARK: - Network

func getResults(from url: URL, completion: @escaping () -> ()) {
    URLSession.shared.dataTask(with: url) { (data, response, error ) in
        guard let data = data else { return }
        if error == nil {
            internet = true
        }
        switch switchId {
        case 1:
            updateResults(data)
        case 2:
            updateResultsFavorite(data)
        case 3:
            updateResultsSearch(data)
        default:
            break
        }
        completion()
        }.resume()
}

fileprivate func updateResults(_ data: Data) {
    decoder.dateDecodingStrategy = .iso8601
    feedSource.removeAll()
    do {
        let rawFeed = try decoder.decode(NewsSource.self, from: data)
        feedSource = rawFeed.sources
    } catch let decodeError as NSError {
        errorMessage += "Decoder error: \(decodeError.localizedDescription)"
        return
    }
}

fileprivate func updateResultsFavorite(_ data: Data) {
    decoder.dateDecodingStrategy = .iso8601
    feedArticle.removeAll()
    do {
        let rawFeed = try decoder.decode(NewsArticles.self, from: data)
        feedArticle = rawFeed.articles
    } catch let decodeError as NSError {
        errorMessage += "Decoder error: \(decodeError.localizedDescription)"
        return
    }
}

fileprivate func updateResultsSearch(_ data: Data) {
    decoder.dateDecodingStrategy = .iso8601
    feedArticleSearch.removeAll()
    do {
        let rawFeed = try decoder.decode(NewsArticles.self, from: data)
        feedArticleSearch = rawFeed.articles
    } catch let decodeError as NSError {
        errorMessage += "Decoder error: \(decodeError.localizedDescription)"
        return
    }
}

