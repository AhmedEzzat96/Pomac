//
//  MasterCell.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import UIKit
import SDWebImage

class MasterCell: UITableViewCell {
    
    // MARK: IBOutlets
    @IBOutlet weak var storyImgView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // MARK: LifeCycle Methods
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    // MARK: Public Methods
    func configure(scienceStory: ScienceStory) {
        let imageUrl = scienceStory.multimedia[0].url
        self.storyImgView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        self.titleLabel.text = "Title: \(scienceStory.title)"
        self.ownerLabel.text = "Published by: \(scienceStory.byline)"
        self.dateLabel.text = "Published date: \(scienceStory.published_date.getDateFormat())"
    }
}
