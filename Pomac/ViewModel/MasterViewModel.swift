//
//  MasterViewModel.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import Foundation

protocol MasterViewModelProtocol: AnyObject {
    func scienceStoriesCount() -> Int
    func getScienceStories()
    func getScienceStory(for index: Int) -> ScienceStory
}

class MasterViewModel {
    
    // MARK: Properties
    private weak var view: MasterVCProtocol?
    private var scienceStories = [ScienceStory]()
    
    //MARK: init
    init(view: MasterVCProtocol) {
        self.view = view
    }
}

// MARK: Private Methods
extension MasterViewModel {
    
}

// MARK: MasterViewModel Protocol
extension MasterViewModel: MasterViewModelProtocol {

    // get data from api
    func getScienceStories() {
        view?.showLoader()
        APIManager.getScienceStories { [weak self] result in
            switch result {
            case .success(let response):
                if let data = response.results {
                    self?.scienceStories = data
                    self?.view?.reloadTableView()
                }
            case .failure(let error):
                print(error.localizedDescription)
            }
            self?.view?.hideLoader()
        }
    }
    
    // return data count
    func scienceStoriesCount() -> Int {
        return scienceStories.count
    }
    
    func getScienceStory(for index: Int) -> ScienceStory {
        return scienceStories[index]
    }
    
}
