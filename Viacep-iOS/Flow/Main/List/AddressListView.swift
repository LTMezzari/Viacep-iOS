//
//  AddressListView.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 13/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

class AddressListView {
    //MARK: Properties
    lazy var rootView: UIView = UIView()
    lazy var searchButton: UIButton = UIButton()
    lazy var tableView: UITableView = UITableView()
    
    //MARK: Methods
    func build(_ viewController: UIViewController) -> UIView {
        self.buildRootView(viewController)
        return self.rootView
    }
    
    //MARK: Builders
    private func buildRootView(_ viewController: UIViewController) {
        self.buildSearchButton(viewController.navigationItem)
        self.buildTableView()
    }
    
    private func buildSearchButton(_ navigationItem: UINavigationItem) {
        let button = UIBarButtonItem()
        let color = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.searchButton.setTitle("Search", for: UIControl.State.normal)
        self.searchButton.setTitleColor(color, for: UIControl.State.normal)
        button.customView = self.searchButton
        navigationItem.rightBarButtonItem = button
    }
    
    private func buildTableView() {
        self.tableView.separatorStyle = .none
        
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.rootView.addSubview(self.tableView)
        self.buildTableViewConstraints()
    }
    
    //MARK: Constraints
    private func buildTableViewConstraints() {
        self.tableView.topAnchor.constraint(equalTo: self.rootView.topAnchor, constant: 0).isActive = true
        self.tableView.leadingAnchor.constraint(equalTo: self.rootView.leadingAnchor, constant: 0).isActive = true
        self.tableView.trailingAnchor.constraint(equalTo: self.rootView.trailingAnchor, constant: 0).isActive = true
        self.tableView.bottomAnchor.constraint(equalTo: self.rootView.bottomAnchor, constant: 0).isActive = true
    }
}
