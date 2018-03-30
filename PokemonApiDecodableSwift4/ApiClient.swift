//
//  ApiClient.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/26/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation
import UIKit

class ApiClient {
    
    // MARK:- Api Calls
    class func getPokemonData(urlString: String, completion: @escaping([Pokemon])->()) throws {

        let apiString = urlString
        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
        
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {print("getPokemonData()- data nil"); return }
            
            do {
                let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
                if let  pokemonArr = mainJson.results {
                    completion(pokemonArr)
                }
            } catch {
                print("getPokemonData() - error getting Pokemon data objects")
            }
        }.resume()
    }
}
