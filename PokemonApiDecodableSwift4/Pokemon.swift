//
//  Pokemon.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/19/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation

class PokemonArray: Decodable {
    var pokemonArray: [Pokemon]?
}

struct Pokemon: Decodable {
    var name: String?
    var url: String?
}
