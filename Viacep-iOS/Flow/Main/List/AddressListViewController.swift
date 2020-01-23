//
//  ViewController.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 13/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import UIKit

//MARK: Controller
class AddressListViewController: UIViewController {
    
    private let viewModel = AddressListViewModel()
    private let addressListView = AddressListView()
    
    override func loadView() {
        self.view = self.addressListView.build(self)
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.addressListView.tableView.delegate = self
        self.addressListView.tableView.dataSource = self
        
        self.addressListView.tableView.register(AddressTableViewCell.self, forCellReuseIdentifier: AddressTableViewCell.identifier)
        
        self.addressListView.searchButton.addTarget(self, action: #selector(didPressSearch(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func didPressSearch(_ sender: Any) {
        navigate(self, SearchAddressViewController()) { viewController in
            viewController.delegate = self
        }
    }

}

//MARK: TableView Delegate
extension AddressListViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.addresses.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: AddressTableViewCell.identifier, for: indexPath) as! AddressTableViewCell
        cell.address = self.viewModel.addresses[indexPath.row]
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 52
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let address = self.viewModel.addresses[indexPath.row]
        
        navigate(self, AddressDetailViewController()) { viewController in
            viewController.delegate = self
            viewController.viewModel.address = address
        }
    }
}

//MARK: AddressDetail Delegate
extension AddressListViewController: AddressDetailViewControllerDelegate {
    func didSaveAddress(_ address: Address) {
        self.viewModel.putAddress(address)
        self.addressListView.tableView.reloadData()
    }
}
