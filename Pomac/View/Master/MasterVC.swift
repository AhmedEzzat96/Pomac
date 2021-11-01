//
//  MasterVC.swift
//  Pomac
//
//  Created by Ahmed Ezzat on 01/11/2021.
//

import UIKit

protocol MasterVCProtocol: AnyObject {
    func showLoader()
    func hideLoader()
    func reloadTableView()
}

class MasterVC: UIViewController {
    
    // MARK: Outlets
    @IBOutlet weak var masterView: MasterView!
    
    //MARK: Properties
    private var viewModel: MasterViewModelProtocol!
    
    // MARK: LifeCycle Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        self.viewModel = MasterViewModel(view: self)
        setupTableView()
        viewModel.getScienceStories()
    }
    
}

// MARK: TableView Data Source
extension MasterVC: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.scienceStoriesCount()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: Cells.masterCell) as! MasterCell
        cell.configure(scienceStory: viewModel.getScienceStory(for: indexPath.row))
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        self.goToDetailsVC(index: indexPath.row)
        self.masterView.tableView.deselectRow(at: indexPath, animated: true)
    }
    
    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return 300
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
}

// MARK: MasterVC Protocol
extension MasterVC: MasterVCProtocol {
    func showLoader() {
        self.masterView.showActivityIndicator()
    }
    
    func hideLoader() {
        self.masterView.hideActivityIndicator()
    }
    
    func reloadTableView() {
        self.masterView.tableView.reloadData()
    }
    
    
}

// MARK: Private Methods
extension MasterVC {
    private func setupTableView() {
        masterView.tableView.delegate = self
        masterView.tableView.dataSource = self
        masterView.tableView.register(UINib(nibName: Cells.masterCell, bundle: nil), forCellReuseIdentifier: Cells.masterCell)
    }
    
    private func goToDetailsVC(index: Int) {
        let detailsVC = DetailsVC.create(scieneStory: viewModel.getScienceStory(for: index))
        self.navigationController?.pushViewController(detailsVC, animated: true)
    }
}


