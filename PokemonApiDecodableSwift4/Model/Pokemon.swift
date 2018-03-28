//
//  Pokemon.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/26/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation

class MainJSON: Decodable {
    var results: [Pokemon]?
    var next: String?
    var previous: String?
}

struct Pokemon: Decodable {
    var name: String?
    var url: String?
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
//    }
//    ],
//    "next": "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=20"
//}

