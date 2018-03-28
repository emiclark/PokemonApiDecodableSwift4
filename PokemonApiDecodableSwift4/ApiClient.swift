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
    
//    static var pokemonArray = [Pokemon]()

    // MARK:- Api Calls
    class func getPokemonData(urlString: String, completion: @escaping([Pokemon])->()) throws {
        
        // make api call
        let apiString = urlString
        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
        
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {print("data nil"); return }
            
            do {
                let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
                if let  pokemonArr = mainJson.results {
                    print("previous: \(mainJson.previous ?? "no previous page")\nnext: \(mainJson.next ?? "no next page")\n")
                    completion(pokemonArr)
                }
            } catch {
                print("getPokemonData() - error getting Pokemon data objects")
            }
        }.resume()
    }
    
//    static func downloadImage(urlString: String, completion: @escaping(UIImage)->()) {
//        let apiString = urlString
//        print("downloadImage() - \(apiString)")
//        guard let url = URL(string: apiString) else { print("Conversion to url failed"); return }
//        
//        URLSession.shared.dataTask(with: url) { (data, response, error) in
//            guard let data = data else { print("data is nil"); return }
//            let pokeImage = UIImage.init(data: data)
//            completion(pokeImage)
//        }.resume()
//        
//    }
}

// json sample
//{
//    "count": 949,
//    "previous": null,
//    "results": [
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/1/",
//    "name": "bulbasaur"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/2/",
//    "name": "ivysaur"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/3/",
//    "name": "venusaur"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/4/",
//    "name": "charmander"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/5/",
//    "name": "charmeleon"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/6/",
//    "name": "charizard"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/7/",
//    "name": "squirtle"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/8/",
//    "name": "wartortle"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/9/",
//    "name": "blastoise"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/10/",
//    "name": "caterpie"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/11/",
//    "name": "metapod"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/12/",
//    "name": "butterfree"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/13/",
//    "name": "weedle"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/14/",
//    "name": "kakuna"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/15/",
//    "name": "beedrill"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/16/",
//    "name": "pidgey"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/17/",
//    "name": "pidgeotto"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/18/",
//    "name": "pidgeot"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/19/",
//    "name": "rattata"
//    },
//    {
//    "url": "https://pokeapi.co/api/v2/pokemon/20/",
//    "name": "raticate"
//    }
//    ],
//    "next": "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=20"
//}


