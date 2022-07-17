//
//  Beer.swift
//  BeerAppReloaded
//
//  Created by Cecilia Andrea Pesce on 28/06/22.
//

import Foundation

struct Beer: Codable {
    let beerImageUrl: String? //URL da imagem da cerveja
    let name: String? // Nome da cerveja
    let abv: Double? // Teor alcóolico
    let tagline: String? // Slogan
    let ibu: Double? // Amargor
    let description: String? // Descrição
    let id: Int? // ID da cerveja
    
    private enum CodingKeys: String, CodingKey {
        case beerImageUrl = "image_url"
        case name,
             abv,
             tagline,
             ibu,
             description,
             id
    }
}
