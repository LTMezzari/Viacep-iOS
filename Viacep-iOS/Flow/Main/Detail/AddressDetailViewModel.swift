//
//  AddressDetailViewModel.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation

class AddressDetailViewModel {
    var address: Address?
    
    func saveAddress(_ cep: String?, _ street: String?, _ complement: String?, _ neighborhood: String?, _ locality: String?, _ uf: String?, _ unity: String?, _ completition: (Address) -> Void) {
        guard
            let address = self.address,
            let cep = cep,
            let street = street,
            let complement = complement,
            let neighborhood = neighborhood,
            let locality = locality,
            let uf = uf,
            let unity = unity
        else {
                return
        }
        
        address.cep = cep
        address.street = street
        address.complement = complement
        address.neighborhood = neighborhood
        address.locality = locality
        address.uf = uf
        address.unity = unity
        
        completition(address)
    }
}
