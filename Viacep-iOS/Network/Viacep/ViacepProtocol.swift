//
//  ViacepProtocol.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 14/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import Alamofire

enum ViacepRoute {
    case getAddress(_ cep: String)
}

class ViacepProtocol: NSObject, NetworkProtocol {
    
    let route: ViacepRoute
    
    var url: URL {
        switch route {
        case .getAddress(let cep):
            return URL(string: "https://viacep.com.br/ws/\(cep)/json")!
        }
    }
    
    var headers: HTTPHeaders?
    
    var httpMethod: HTTPMethod = .get
    
    var parameters: Parameters?
    
    var encoding: ParameterEncoding = URLEncoding.httpBody
    
    var responseType: ResponseType = .object
    
    init(route: ViacepRoute) {
        self.route = route
    }
}
