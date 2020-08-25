//
//  FavoriteTableViewCell.swift
//  NewsApiTest
//
//  Created by Сергей Шестаков on 24.08.2020.
//  Copyright © 2020 Сергей Шестаков. All rights reserved.
//

import Foundation
import UIKit

class CustomCell: UITableViewCell {
    // MARK: - Subviews
    @IBOutlet weak var imageViewPhotoNews: UIImageView!
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var viewPresent: UIView!
    @IBOutlet weak var labelDescription: UILabel!
}
