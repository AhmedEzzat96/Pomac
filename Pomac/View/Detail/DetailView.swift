//
//  DetailView.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import UIKit
import SDWebImage

class DetailView: UIView {
    
    // MARK: IBOutlets
    @IBOutlet weak var posterImageView: UIImageView!
    @IBOutlet weak var captionLabel: UILabel!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var ownerLabel: UILabel!
    @IBOutlet weak var dateLabel: UILabel!
    
    
    // MARK: Public Methods
    func setupView(scienceStory: ScienceStory) {
        getData(scienceStory: scienceStory)
    }
}

// MARK: Private Methods
extension DetailView {
    private func getData(scienceStory: ScienceStory) {
        let imageUrl = scienceStory.multimedia[0].url
        posterImageView.sd_setImage(with: URL(string: imageUrl), completed: nil)
        captionLabel.text = "Caption: \(scienceStory.multimedia[0].caption)"
        self.titleLabel.text = "Title: \(scienceStory.title)"
        self.ownerLabel.text = "Published by: \(scienceStory.byline)"
        self.dateLabel.text = "Published date: \(scienceStory.published_date.getDateFormat())"
    }
}
