//
//  SeachViewController.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 23.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//

import UIKit

class SeachViewController: UIViewController {
    // MARK: - Properties
    var textSearch = ""
    
    // MARK: - Subviews
    @IBOutlet weak var tableViewSearch: UITableView!
    @IBOutlet var tapDismiss: UITapGestureRecognizer!
    @IBOutlet weak var serachBar: UISearchBar!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        favoriteList.removeAll()
        updateFavorite()
    }
    
    // MARK: - IBActions
    @IBAction func tap(_ sender: Any) {
        dismissKeyboard()
    }
    
    // MARK: - Private Methods
    private func getResultSearching() {
        getResults(from: evrythingSearch(textSearch: textSearch)!) {
            DispatchQueue.main.async {
                self.tableViewSearch.reloadData()
            }
        }
    }
    
    private func dismissKeyboard() {
        self.serachBar.resignFirstResponder()
    }
}

// MARK: - TableViewDataSource, TableViewDelegate
extension SeachViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return feedArticleSearch.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "CellSearch")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "CellSearch")
        }
        let searchItem = feedArticleSearch[indexPath.row]
        cell!.textLabel?.numberOfLines = .bitWidth
        cell!.textLabel?.text = searchItem.title
        
        cell!.detailTextLabel?.numberOfLines = .bitWidth
        cell!.detailTextLabel?.text = searchItem.description
        
        return cell!
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        dismissKeyboard()
    }
}
// MARK: - UISearchBarDelegate
extension SeachViewController: UISearchBarDelegate {
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        textSearch = searchBar.text ?? ""
        getResultSearching()
        dismissKeyboard()
    }
}
