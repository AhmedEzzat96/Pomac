//
//  DetailsVC.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import UIKit

protocol DetailVCProtocol: AnyObject {
    
}

class DetailsVC: UIViewController {
    
    // MARK: IBOutlets
    @IBOutlet weak var detailView: DetailView!
    
    // MARK: Properties
    var viewModel: DetailViewModelProtocol!
    
    // MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        detailView.setupView(scienceStory: viewModel.getScienceStory())
    }
    
    //MARK: Public Methods
    class func create(scieneStory: ScienceStory) -> DetailsVC {
        let detailVC: DetailsVC = UIViewController.create(storyboardName: Storyboards.detail, identifier: ViewControllers.detailsVC)
        detailVC.viewModel = DetailViewModel(view: detailVC, scienceStory: scieneStory)
        return detailVC
    }
    
}

// MARK: DetailVC Protocol
extension DetailsVC: DetailVCProtocol {
    
}
