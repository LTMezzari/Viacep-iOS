//
//  AddressDetailView.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

class AddressDetailView {
    
    //MARK: Properties
    lazy var scrollView: UIScrollView = UIScrollView()
    lazy var contentView: UIView = UIView()
    
    lazy var cepTextField: UITextField = UITextField()
    lazy var streetTextField: UITextField = UITextField()
    lazy var complementTextField: UITextField = UITextField()
    lazy var neighborhoodTextField: UITextField = UITextField()
    lazy var localityTextField: UITextField = UITextField()
    lazy var ufTextField: UITextField = UITextField()
    lazy var unityTextField: UITextField = UITextField()
    
    lazy var button: UIButton = UIButton()
    
    //MARK: Methods
    func build() -> UIView {
        self.scrollView.addSubview(self.contentView)
        self.buildScrollView()
        return self.scrollView
    }
    
    func setupFields() {
        self.buildTextField(self.cepTextField, self.contentView.topAnchor)
        self.buildTextField(self.streetTextField, self.cepTextField.bottomAnchor)
        self.buildTextField(self.complementTextField, self.streetTextField.bottomAnchor)
        self.buildTextField(self.neighborhoodTextField, self.complementTextField.bottomAnchor)
        self.buildTextField(self.localityTextField, self.neighborhoodTextField.bottomAnchor)
        self.buildTextField(self.ufTextField, self.localityTextField.bottomAnchor)
        self.buildTextField(self.unityTextField, self.ufTextField.bottomAnchor)
    }

    //MARK: Builders
    private func buildScrollView() {
        self.contentView.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        self.scrollView.backgroundColor = #colorLiteral(red: 1.0, green: 1.0, blue: 1.0, alpha: 1.0)
        
        self.buildContentViewConstraints()
        
        self.cepTextField.isEnabled = false
        self.setupFields()
        
        self.buildButton()
    }
    
    private func buildTextField(_ textField: UITextField, _ aboveAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        textField.textColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        textField.borderStyle = UITextField.BorderStyle.roundedRect
        
        textField.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(textField)
        self.buildTextFieldConstraints(textField, aboveAnchor)
    }
    
    private func buildButton() {
        let color = #colorLiteral(red: 0, green: 0.4784313725, blue: 1, alpha: 1)
        self.button.setTitle("Save", for: UIControl.State.normal)
        self.button.setTitleColor(color, for: UIControl.State.normal)
        
        self.button.translatesAutoresizingMaskIntoConstraints = false
        self.contentView.addSubview(self.button)
        self.buildButtonConstraints()
    }
    
    //MARK: Constraints
    private func buildContentViewConstraints() {
        self.contentView.trailingAnchor.constraint(equalTo: self.scrollView.trailingAnchor).isActive = true
        self.contentView.leadingAnchor.constraint(equalTo: self.scrollView.leadingAnchor).isActive = true
        self.contentView.topAnchor.constraint(equalTo: self.scrollView.topAnchor).isActive = true
        self.contentView.bottomAnchor.constraint(equalTo: self.scrollView.bottomAnchor).isActive = true
        self.contentView.centerXAnchor.constraint(equalTo: self.scrollView.centerXAnchor).isActive = true
        self.contentView.centerYAnchor.constraint(equalTo: self.scrollView.centerYAnchor).isActive = true
    }
    
    private func buildTextFieldConstraints(_ textField: UITextField, _ aboveAnchor: NSLayoutAnchor<NSLayoutYAxisAnchor>) {
        textField.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 16).isActive = true
        textField.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -16).isActive = true
        textField.topAnchor.constraint(equalTo: aboveAnchor, constant: 16).isActive = true
        textField.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
    
    private func buildButtonConstraints() {
        self.button.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor).isActive = true
        self.button.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor).isActive = true
        self.button.topAnchor.constraint(equalTo: self.unityTextField.bottomAnchor, constant: 32).isActive = true
        self.button.bottomAnchor.constraint(lessThanOrEqualToSystemSpacingBelow: self.contentView.bottomAnchor, multiplier: 0).isActive = true
        self.button.heightAnchor.constraint(equalToConstant: 50).isActive = true
    }
}
