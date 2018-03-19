//
//  LibrarySamplerViewController.swift
//  DLibSampler
//
//  Created by ELLIOTT, Dylan on 9/3/18.
//  Copyright © 2018 Dylan Elliott. All rights reserved.
//

import UIKit

typealias ViewControllerCellViewModel = (title: String, viewControllerClass: UIViewController.Type)
typealias SectionViewModel<T> = (title: String?, cellViewModels: [T])

class LibrarySamplerViewController: UITableViewController {
    var sectionViewModels: [SectionViewModel<ViewControllerCellViewModel>] { return [] }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return sectionViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sectionViewModels[section].title
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sectionViewModels[section].cellViewModels.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.reusableCell()
        
        let cellViewModel = sectionViewModels[indexPath.section].cellViewModels[indexPath.row]
        
        cell.textLabel?.text = cellViewModel.title
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let cellViewModel = sectionViewModels[indexPath.section].cellViewModels[indexPath.row]
        let viewController = cellViewModel.viewControllerClass.init()
        
        self.navigationController?.pushViewController(viewController, animated: true)
    }
}
