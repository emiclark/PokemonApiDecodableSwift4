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

class Sprites: Decodable {
    var front_default: Data?
}

//=================
// json sample
//"sprites": {
//    "back_female": null,
//    "back_shiny_female": null,
//    "back_default": "https:\/\/raw.githubusercontent.com\/PokeAPI\/sprites\/master\/sprites\/pokemon\/back\/1.png",
//    "front_female": null,
//    "front_shiny_female": null,
//    "back_shiny": "https:\/\/raw.githubusercontent.com\/PokeAPI\/sprites\/master\/sprites\/pokemon\/back\/shiny\/1.png",
//    "front_default": "https:\/\/raw.githubusercontent.com\/PokeAPI\/sprites\/master\/sprites\/pokemon\/1.png",
//    "front_shiny": "https:\/\/raw.githubusercontent.com\/PokeAPI\/sprites\/master\/sprites\/pokemon\/shiny\/1.png"
//},

//=================
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

