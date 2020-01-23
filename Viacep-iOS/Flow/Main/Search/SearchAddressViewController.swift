//
//  SearchAddressViewController.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

//MARK: Controller
class SearchAddressViewController: UIViewController {
    
    private let searchAddressView = SearchAddressView()
    private let viewModel = SearchAddressViewModel()
    
    var delegate: AddressDetailViewControllerDelegate?
    
    override func loadView() {
        self.view = self.searchAddressView.build()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.searchAddressView.textField.delegate = self
        self.searchAddressView.button.addTarget(self, action: #selector(didPressSearchButton(_:)), for: UIControl.Event.touchUpInside)
    }
    
    @objc func didPressSearchButton(_ sender: Any) {
        self.viewModel.searchCep(self.searchAddressView.textField.text) { (address) in
            navigate(self, AddressDetailViewController()) { viewController in
                viewController.viewModel.address = address
                viewController.delegate = self.delegate
            }
        }
    }
}

//MARK: Delegate
extension SearchAddressViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        self.searchAddressView.button.isEnabled = !text.isEmpty
        return true
    }
}
