//
//  Address.swift
//  Viacep-iOS
//
//  Created by Lucas Torres Mezzari on 13/01/20.
//  Copyright © 2020 Lucas Torres Mezzari. All rights reserved.
//

import Foundation
import ObjectMapper

class Address: NSObject {
    
    //MARK: Properties
    var cep: String?
    
    var street: String?
    
    var complement: String?
    
    var neighborhood: String?
    
    var locality: String?
    
    var uf: String?
    
    var unity: String?
    
    var ibge: String?
    
    var gia: String?
    
    //MARK: Constructors
    override init() {}
    
    required init?(map: Map) {
        
    }
    
}

//MARK: Mappable
extension Address: Mappable {
    
    func mapping(map: Map) {
        self.cep <- map["cep"]
        self.street <- map["logradouro"]
        self.complement <- map["complemento"]
        self.neighborhood <- map["bairro"]
        self.locality <- map["localidade"]
        self.uf <- map["uf"]
        self.unity <- map["unidade"]
        self.ibge <- map["ibge"]
        self.gia <- map["gia"]
    }
}
