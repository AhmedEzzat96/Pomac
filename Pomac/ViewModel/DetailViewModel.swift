//
//  DetailViewModel.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import Foundation

protocol DetailViewModelProtocol: AnyObject {
    func getScienceStory() -> ScienceStory
}

class DetailViewModel {
    
    // MARK: Properties
    private var scienceStory: ScienceStory!
    private weak var view: DetailVCProtocol?
    
    //MARK: init
    init(view: DetailVCProtocol, scienceStory: ScienceStory) {
        self.view = view
        self.scienceStory = scienceStory
    }
}

// MARK: DetailViewModel Protocol
extension DetailViewModel: DetailViewModelProtocol {
    func getScienceStory() -> ScienceStory {
        return scienceStory
    }
}
