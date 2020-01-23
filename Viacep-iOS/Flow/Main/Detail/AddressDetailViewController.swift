//
//  AddressDetailViewController.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

protocol AddressDetailViewControllerDelegate {
    func didSaveAddress(_ address: Address)
}

//MARK: Controller
class AddressDetailViewController: UIViewController {
    
    private let addressDetailView = AddressDetailView()
    
    let viewModel = AddressDetailViewModel()
    
    var delegate: AddressDetailViewControllerDelegate?
    
    override func loadView() {
        view = self.addressDetailView.build()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupFields()
        self.addressDetailView.button.addTarget(self, action: #selector(didPressSaveButton(_:)), for: UIControl.Event.touchUpInside)
    }
    
    private func setupFields() {
        guard let address = self.viewModel.address else {
            return
        }
        
        self.setupTextField(self.addressDetailView.cepTextField, address.cep)
        self.setupTextField(self.addressDetailView.streetTextField, address.street)
        self.setupTextField(self.addressDetailView.complementTextField, address.complement)
        self.setupTextField(self.addressDetailView.neighborhoodTextField, address.neighborhood)
        self.setupTextField(self.addressDetailView.localityTextField, address.locality)
        self.setupTextField(self.addressDetailView.ufTextField, address.uf)
        self.setupTextField(self.addressDetailView.unityTextField, address.unity)
    }
    
    private func setupTextField(_ textField: UITextField, _ text: String?) {
        textField.text = text
        textField.delegate = self
    }
    
    @objc func didPressSaveButton(_ sender: Any) {
        self.viewModel.saveAddress(
            self.addressDetailView.cepTextField.text,
            self.addressDetailView.streetTextField.text,
            self.addressDetailView.complementTextField.text,
            self.addressDetailView.neighborhoodTextField.text,
            self.addressDetailView.localityTextField.text,
            self.addressDetailView.ufTextField.text,
            self.addressDetailView.unityTextField.text
        ) { (address) in
            self.delegate?.didSaveAddress(address)
            popToRoot(self)
        }
    }
}

extension AddressDetailViewController: UITextFieldDelegate {
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        let text = NSString(string: textField.text ?? "").replacingCharacters(in: range, with: string)
        self.addressDetailView.button.isEnabled = !text.isEmpty
        return true
    }
}
