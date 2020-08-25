//
//  ChacheNews.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 24.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//

import Foundation

final class CacheNewsService {
    // MARK: - Properties
    var saveTitle = [String]()
    var saveDiscription = [String]()
    
    // MARK: - Methods
    func cleanData() {
        saveTitle = []
        saveDiscription = []
    }
    
    func saveData() {
        UserDefaults.standard.set(saveTitle, forKey: "title")
        UserDefaults.standard.set(saveDiscription, forKey: "discription")
        UserDefaults.standard.synchronize()
    }
    
    func loadData() {
        if let t = UserDefaults.standard.array(forKey: "title") as? [String] {
            saveTitle = t
        } else {
            saveTitle = []
        }
        if let d = UserDefaults.standard.array(forKey: "discription") as? [String] {
            saveDiscription = d
        } else {
            saveDiscription = []
        }
    }
}
