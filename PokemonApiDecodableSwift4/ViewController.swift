//
//  ViewController.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/19/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

struct Pokemon: Decodable {
    var name: String?
    var url: String?
}

class ViewController: UIViewController {
    
    var pokemonArray = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getPokemonData()

    }

    func getPokemonData() {
        
        // make api call
        let apiString = "http://pokeapi.co/api/v2/pokemon/"
        
        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
        
        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {print("data nil"); return }
            
            do {
                self.pokemonArray = try JSONDecoder().decode([Pokemon].self, from: data)
                self.printPokemonArray()

            } catch {
                print("error getting Pokemon data objects")
            }
        }.resume()
        DispatchQueue.main.async() {
            self.printPokemonArray()
        }
    }
    
    func printPokemonArray() {
        for item in pokemonArray {
            print(item.name as String!, item.url as String!)
        }
    }
}

