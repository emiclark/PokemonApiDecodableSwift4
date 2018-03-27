////
////  ViewController.swift
////  PokemonApiDecodableSwift4
////
////  Created by Emiko Clark on 3/19/18.
////  Copyright © 2018 Emiko Clark. All rights reserved.
////
//
//import UIKit
//
////class MainJSON: Decodable {
////    var results: [Pokemon]?
////    var next: String?
////    var previous: String?
////}
////
////struct Pokemon: Decodable {
////    var name: String?
////    var url: String?
////}
//
////class ViewController: UIViewController {
//
//class TableviewController2: UITableViewController {
//    var pokemonArray = [Pokemon]()
//
//    // MARK:- View Methods
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        getPokemonData {
//            print("successful")
//        }
//    }
//
//    // MARK:- Tableview Delegates
//    override func numberOfSections(in tableView: UITableView) -> Int {
//        return 1
//    }
//    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        return pokemonArray.count
//    }
//
//    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell =
//    }
//
//    // MARK:- Api Calls
//    func getPokemonData(completion: @escaping()->()) {
//
//        // make api call
//        let apiString = "http://pokeapi.co/api/v2/pokemon/"
//        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
//
//        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
//            guard let data = data else {print("data nil"); return }
//
//            do {
//                let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
//                if let  pokemonArr = mainJson.results {
//
//                    print("previous: \(mainJson.previous ?? "no previous page")\nnext: \(mainJson.next ?? "no next page")\n")
//
//                    self.pokemonArray.append(contentsOf: pokemonArr)
//
//                    // print pokemon array
//                    for item in self.pokemonArray {
//                        print(item.name as String!, item.url as String!)
//                    }
//                    var count = 1
//                    while mainJson.next != nil && count < 3 {
//                        self.getMorePokemonData(urlString: mainJson.next!, completion: {
//                            print("get more data: \(count)")
//                        })
//                        count += 1
//                    }
//
//                    DispatchQueue.main.async {
//                        completion()
//                    }
//                }
//            } catch {
//                print("error getting Pokemon data objects")
//            }
//        }.resume()
//    }
//
//    func getMorePokemonData(urlString: String, completion: @escaping()->()) {
//
//        // make api call
//        let apiString = urlString
//        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
//
//        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
//            guard let data = data else {print("data nil"); return }
//
//            do {
//                let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
//                if let  pokemonArr = mainJson.results {
//
//                    print("previous: \(mainJson.previous ?? "no previous page")\nnext: \(mainJson.next ?? "no next page")\n")
//
//                    self.pokemonArray.append(contentsOf: pokemonArr)
//
//                    // print pokemon array
//                    for item in self.pokemonArray {
//                        print(item.name as String!, item.url as String!)
//                    }
//
//
//
//                    DispatchQueue.main.async {
//
//                        completion()
//                    }
//                }
//            } catch {
//                print("error getting Pokemon data objects")
//            }
//            }.resume()
//    }
//
//}
//
//// json sample
////{
////    "count": 949,
////    "previous": null,
////    "results": [
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/1/",
////    "name": "bulbasaur"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/2/",
////    "name": "ivysaur"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/3/",
////    "name": "venusaur"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/4/",
////    "name": "charmander"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/5/",
////    "name": "charmeleon"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/6/",
////    "name": "charizard"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/7/",
////    "name": "squirtle"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/8/",
////    "name": "wartortle"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/9/",
////    "name": "blastoise"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/10/",
////    "name": "caterpie"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/11/",
////    "name": "metapod"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/12/",
////    "name": "butterfree"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/13/",
////    "name": "weedle"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/14/",
////    "name": "kakuna"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/15/",
////    "name": "beedrill"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/16/",
////    "name": "pidgey"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/17/",
////    "name": "pidgeotto"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/18/",
////    "name": "pidgeot"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/19/",
////    "name": "rattata"
////    },
////    {
////    "url": "https://pokeapi.co/api/v2/pokemon/20/",
////    "name": "raticate"
////    }
////    ],
////    "next": "https://pokeapi.co/api/v2/pokemon/?limit=20&offset=20"
////}
//
