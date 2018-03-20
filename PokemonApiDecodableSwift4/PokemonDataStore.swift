//
//  PokemonDataStore.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/19/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation

class PokemonDataStore {
    
    func getPokemonData(completion: @escaping([String:Any]) ->()) {
        
        // make api call
        let apiString = "http://pokeapi.co/api/v2/pokemon/"
        
        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
        let request = URLRequest(url: apiURL)
        
        URLSession.shared.dataTask(with: request) { (data, response, error) in
            guard let data = data else {print("data nil"); return }
            
        }.resume()
        completion(json)
        
    }
    
}
