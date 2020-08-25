//
//  ViewController.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 18.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//

import UIKit
import Foundation

class ChannelViewController: UIViewController {
    
    // MARK: - Subviews
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - UIViewController
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self
        self.tableView.delegate = self
        loadChannelList()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        synchronizeFavorite(at: favoriteList.count)
        tableView.reloadData()
    }
    
    // MARK: - Private Methods
    private func loadChannelList() {
        getResults(from: allChannelNews()!) {
            DispatchQueue.main.async {
                for i in 0..<feedSource.count {
                    items.append(feedSource[i])
                }
                for i in 0..<items.count{
                    let channelName = items[i]
                    addChannel(idChannel: channelName.id ?? "" ,nameChannel: channelName.name ?? "")
                }
                self.tableView.reloadData()
            }
        }
    }
}

// MARK: - TableViewDataSource, TableViewDelegate
extension ChannelViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        var cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
        if cell == nil {
            cell = UITableViewCell(style: UITableViewCell.CellStyle.value1, reuseIdentifier: "Cell")
        }
        
        let chanel = items[indexPath.row]
        cell!.textLabel?.text = chanel.name
        cell!.detailTextLabel?.numberOfLines = .bitWidth
        cell!.detailTextLabel?.text = chanel.description
        
        let favoriteChannel = favorite[indexPath.row]
        if favoriteChannel["isFavorite"] as? Bool == true {
            cell?.accessoryType = .checkmark
        } else {
            cell?.accessoryType = .none
        }
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        if changeFavorite(at: indexPath.row) {
            tableView.cellForRow(at: indexPath)?.accessoryType = .checkmark
        } else {
            tableView.cellForRow(at: indexPath)?.accessoryType = .none
        }
    }
}



