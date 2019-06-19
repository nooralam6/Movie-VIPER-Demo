//
//  MovieListTableViewCell.swift
//  MovieVIPERDemo
//
//  Created by new on 19/06/19.
//  Copyright © 2019 Sunday Mobility. All rights reserved.
//

import UIKit
import Kingfisher

class MovieListTableViewCell: UITableViewCell {

    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var yearLaebel: UILabel!
    @IBOutlet weak var typeLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.selectionStyle = .none
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func setData(movieDetails: MovieData) {
        if let link = movieDetails.poster, let url = URL(string: link) {
            posterImageView.kf.setImage(with: url)
        }
        titleLabel.text = movieDetails.title
        yearLaebel.text = movieDetails.year
        typeLabel.text = movieDetails.type
    }
    
}
