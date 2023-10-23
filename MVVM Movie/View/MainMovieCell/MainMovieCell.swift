//
//  MainMovieCell.swift
//  MVVM Movie
//
//  Created by Kerem Demir on 23.10.2023.
//

import UIKit
import SDWebImage

class MainMovieCell: UITableViewCell {

    @IBOutlet weak var backView: UIView!
    
    @IBOutlet weak var movieImageView: UIImageView!
    
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    @IBOutlet weak var rateLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        configure()
    }
    
    func configure(){
        backView.addBorder(color: .label, width: 1)
        backView.round()
        
        movieImageView.round(5)
    }
    
    func setupCell(viewModel: MovieTableCellViewModel){
        self.nameLabel.text = viewModel.title
        self.dateLabel.text = viewModel.date
        self.rateLabel.text = viewModel.rating
    }
    
}
