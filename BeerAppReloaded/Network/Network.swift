//
//  Network.swift
//  BeerAppReloaded
//
//  Created by Cecilia Andrea Pesce on 08/07/22.
//

import Foundation

// TOD: importar a lib `Alamofire` para poder fazer a requisição com o backend(API)
import Alamofire

struct DataType {
    typealias JSON = [AnyHashable: Any?]
}

class Network {
    // TODO: Criar uma variável `shared`, que é um singleton para não ser necessário instanciar várias vezes no código
    static let shared = Network()

    enum UrlEndpoint: String {
        case api = "https://api.punkapi.com/v2/"
    }
    
    
    // TODO: Criar função para fazer a requisição com a API
    func fetchBeerList(completion: @escaping ([Beer]?, Error?) -> Void) {
        let url = URL(string: UrlEndpoint.api.rawValue + "beers")!
        
        AF.request(url,method: .get, parameters: nil).validate().responseJSON { response in
            let result = try? JSONSerialization.jsonObject(with: response.data ?? Data(), options: .allowFragments) as? [DataType.JSON]
            let beers = result?.toBeers()
            completion(beers, response.error)
        }
    }
}

extension Data {
    func toBeer() -> Beer? {
        let decoder = JSONDecoder()
        return try? decoder.decode(Beer.self, from: self)
    }
}

extension Collection {
    func noDupes() -> [Beer]? {
        let beers = (self as? [Beer] ?? [])
        var result = [Beer]()
        for beer in beers {
            let hasDupes = result.filter({$0.id == beer.id}).count > Int()
            if !hasDupes {
                result.append(beer)
            }
        }
        
        return result
    }
    
    func toBeer() -> Beer? {
        guard let beer = try? JSONSerialization.data(withJSONObject: self, options: .prettyPrinted).toBeer() else {
            return nil 
        }
        
        return beer
    }
    func toBeers() -> [Beer]? {
        var result = [Beer]()
        for beer in self {
            guard let item = try? JSONSerialization.data(withJSONObject: beer, options: .prettyPrinted).toBeer() else {
                continue
            }
            result.append(item)
        }
        return result
    }
}
