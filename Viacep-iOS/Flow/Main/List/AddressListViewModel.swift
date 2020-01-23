//
//  AddressListViewModel.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 13/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation

class AddressListViewModel {
    var addresses: [Address] = []
    
    func putAddress(_ address: Address) {
        if !self.addresses.contains(address) {
            self.addresses.append(address)
        }
    }
}
