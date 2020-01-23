//
//  SearchAddressViewModel.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation

class SearchAddressViewModel {
    func searchCep(_ cep: String?, _ completition: @escaping (Address) -> Void) {
        guard let cep = cep else {
            return
        }
        
        ViacepService.getAddress(cep).onSuccess { (promise, result) in
            if result != nil {
                completition(result!)
            }
        }.onFailure { (promise, error) in
            
        }
    }
}
