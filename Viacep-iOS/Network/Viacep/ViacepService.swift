//
//  ViacepService.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation

class ViacepService {
    class func getAddress(_ cep: String) -> NetworkPromise<Address> {
        return NetworkPromise { promise in
            do {
                try Network.request(ViacepProtocol(route: .getAddress(cep)), promise)
            } catch {
                
            }
        }
    }
}
