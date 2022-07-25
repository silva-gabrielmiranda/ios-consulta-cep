//
//  CEP.swift
//  consulta-cep
//
//  Created by Gabriel Miranda on 23/07/22.
//

import Foundation

struct CEP: Hashable, Codable {
    let cep: String
    let logradouro: String
    let complemento: String
    let bairro: String
    let localidade: String
    let uf: String
    let ibge: String
    let gia: String
    let ddd: String
    let siafi: String
}
