//
//  SearchAddressView.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

class SearchAddressView {
    
    //MARK: Properties
    lazy var rootView: UIView = UIView()
    lazy var textField: UITextField = UITextField()
    lazy var button: UIButton = UIButton()
    
    //MARK: Methods
    func build() -> UIView {
        self.buildRootView()
        return self.rootView
    }
    
    //MARK: Builders
    private  func buildRootView() {
        self.rootView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.buildTextField()
        self.buildButton()
    }
    
    private func buildTextField() {
        self.textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        self.textField.translatesAutoresizingMaskIntoConstraints = false
        self.rootView.addSubview(self.textField)
        self.buildTextFieldConstraints()
    }
    
    private func buildButton() {
        let color = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.button.setTitle("Search", for: UIControl.State.normal)
        self.button.setTitleColor(color, for: UIControl.State.normal)
        self.button.isEnabled = false
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.rootView.addSubview(self.button)
        self.buildButtonConstraints()
    }
    
    //MARK: Constraints
    private func buildTextFieldConstraints() {
        self.textField.leadingAnchor.constraint(equalTo: self.rootView.leadingAnchor, constant: 16).isActive = true
        self.textField.trailingAnchor.constraint(equalTo: self.rootView.trailingAnchor, constant: -16).isActive = true
        self.textField.topAnchor.constraint(equalTo: self.rootView.safeAreaLayoutGuide.topAnchor, constant: 16).isActive = true
        self.textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func buildButtonConstraints() {
        self.button.leadingAnchor.constraint(equalTo: self.rootView.leadingAnchor).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.rootView.trailingAnchor).isActive = true
        self.button.topAnchor.constraint(equalTo: self.textField.bottomAnchor, constant: 32).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
