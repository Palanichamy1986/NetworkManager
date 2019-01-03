//
//  MovieTableViewCell.swift
//  Movie
//
//  Created by Palanichamy Padmanabhan on 19/12/18.
//  Copyright © 2018 Palanichamy Padmanabhan. All rights reserved.
//

import UIKit

class MovieListTableViewCell: UITableViewCell {
    @IBOutlet weak var lblTitle: UILabel!
    @IBOutlet weak var listImgView: UIImageView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        // Configure the view for the selected state
    }

}
