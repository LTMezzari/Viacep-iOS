//
//  AddressTableViewCell.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 13/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import UIKit

class AddressTableViewCell: UITableViewCell {
    
    //MARK: Properties
    static let identifier: String = "AddressTableViewCell"
    
    lazy var cepLabel: UILabel = UILabel()
    lazy var streetLabel: UILabel = UILabel()
    
    var isCellConstructed: Bool = false
    
    var address: Address? {
        didSet {
            self.cepLabel.text = address?.cep
            self.streetLabel.text = address?.street
        }
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        if !self.isCellConstructed {
            self.isCellConstructed = true
            self.translatesAutoresizingMaskIntoConstraints = false
            self.buildView()
        }
    }
    
    //MARK: Builders
    private func buildView() {
        self.buildCep()
        self.buildStreet()
        self.buildSeparator()
    }
    
    private func buildCep() {
        self.contentView.addSubview(self.cepLabel)
        self.buildCepConstraints(self.contentView)
    }
    
    private func buildStreet() {
        self.contentView.addSubview(self.streetLabel)
        self.buildStreetConstraints(self.contentView)
    }
    
    private func buildSeparator() {
        let separator = UIView()
        separator.backgroundColor = #colorLiteral(red: 0, green: 0, blue: 0, alpha: 1)
        self.contentView.addSubview(separator)
        self.buildSeparatorConstraints(separator, self.contentView)
    }
    
    //MARK: Constraints
    private func buildCepConstraints(_ parent: UIView) {
        self.cepLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.cepLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
        self.cepLabel.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 8).isActive = true
        self.cepLabel.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        self.cepLabel.widthAnchor.constraint(equalToConstant: 100).isActive = true
    }
    
    private func buildStreetConstraints(_ parent: UIView) {
        self.streetLabel.translatesAutoresizingMaskIntoConstraints = false
        
        self.streetLabel.topAnchor.constraint(equalTo: parent.topAnchor, constant: 0).isActive = true
        self.streetLabel.leadingAnchor.constraint(equalTo: self.cepLabel.trailingAnchor, constant: 8).isActive = true
        self.streetLabel.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        self.streetLabel.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 8).isActive = true
    }
    
    private func buildSeparatorConstraints(_ separator: UIView, _ parent: UIView) {
        separator.translatesAutoresizingMaskIntoConstraints = false
        
        separator.leadingAnchor.constraint(equalTo: parent.leadingAnchor, constant: 0).isActive = true
        separator.trailingAnchor.constraint(equalTo: parent.trailingAnchor, constant: 0).isActive = true
        separator.bottomAnchor.constraint(equalTo: parent.bottomAnchor, constant: 0).isActive = true
        separator.heightAnchor.constraint(equalToConstant: 2).isActive = true
    }
}
