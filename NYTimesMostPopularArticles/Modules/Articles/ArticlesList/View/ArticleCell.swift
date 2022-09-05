//
//  ArticleCell.swift
//  NYTimesMostPopularArticles
//
//  Created by Syed Faraz Haider Zaidi on 05/09/2022.
//

import Foundation
import UIKit
import Kingfisher

class ArticleTableViewCell: UITableViewCell {

    @IBOutlet weak var titleLabel:UILabel!
    @IBOutlet weak var descriptionLabel:UILabel!
    @IBOutlet weak var dateLabel:UILabel!
    @IBOutlet weak var dateIcon:UIImageView!
    @IBOutlet weak var articleIcon:UIImageView!
    @IBOutlet weak var bylineLabel:UILabel!

    var viewModel : ArticlesDetailViewModel? {
        didSet {
            guard let viewModel = viewModel else {
                return
            }
            titleLabel?.text = viewModel.heading
            descriptionLabel?.text = viewModel.details
            dateLabel?.text = viewModel.date
            bylineLabel?.text = viewModel.name
            
            if let urlStr = viewModel.image {
                let url = URL(string: urlStr)
                
                let processor = RoundCornerImageProcessor(cornerRadius: 20)
                articleIcon.kf.indicatorType = .activity
                articleIcon.kf.setImage(
                    with: url,
                    placeholder: UIImage(named: "placeHolder"),
                    options: [
                        .processor(processor),
                        .scaleFactor(UIScreen.main.scale),
                        .transition(.fade(1)),
                        .cacheOriginalImage
                    ])
                {
                    result in
                    switch result {
                    case .success(let value):
                        print("Task done for: \(value.source.url?.absoluteString ?? "")")
                    case .failure(let error):
                        print("Job failed: \(error.localizedDescription)")
                    }
                }
            
            }
            
        }
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configCellUI()
    {
        self.dateIcon?.image = #imageLiteral(resourceName: "date_icon")
    }
}
