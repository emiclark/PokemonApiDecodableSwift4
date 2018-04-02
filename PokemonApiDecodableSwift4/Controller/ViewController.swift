//
//  ViewController.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/31/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableview: UITableView!
    var pokemonArray = [Pokemon]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try ApiClient.getPokemonData(urlString: Constants.getInitialPokemonDataUrlString) { (pokemonArr) in
                DispatchQueue.main.async {
                    self.tableview.reloadData()
                }
            }
        } catch let error {
            print(error.localizedDescription)
        }
    }

    // MARK:- Tableview Delegates
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        cell.title.text = pokemonArray[indexPath.row].name
        let url = pokemonArray[indexPath.row].url
        
        do {
            try ApiClient.getSpriteImage(urlString: url!, completion: { (spriteImage) in
                DispatchQueue.main.async {
                    cell.pokemonImage.image = spriteImage
                }
            })
        } catch let error {
            print("error getting sprite image - \(error.localizedDescription)")
        }
        return cell
    }
}
////======
////    // MARK:- Api Calls
//func getPokemonData(completion: @escaping()->()) {
//
//    // make api call
//    let apiString = "http://pokeapi.co/api/v2/pokemon/"
//    guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
//
//    URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
//        guard let data = data else {print("data nil"); return }
//
//        do {
//            let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
//            if let  pokemonArr = mainJson.results {
//
//                print("previous: \(mainJson.previous ?? "no previous page")\nnext: \(mainJson.next ?? "no next page")\n")
//
//                self.pokemonArray.append(contentsOf: pokemonArr)
//
//                // print pokemon array
//                for item in self.pokemonArray {
//                    print(item.name as String!, item.url as String!)
//                }
//                var count = 1
//                while mainJson.next != nil && count < 3 {
//                    self.getMorePokemonData(urlString: mainJson.next!, completion: {
//                        print("get more data: \(count)")
//                    })
//                    count += 1
//                }
//
//                DispatchQueue.main.async {
//                    completion()
//                }
//            }
//        } catch {
//            print("error getting Pokemon data objects")
//        }
//        }.resume()
//}
//
//func getMorePokemonData(urlString: String, completion: @escaping()->()) {
//
//    // make api call
//    let apiString = urlString
//    guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }
//
//    URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
//        guard let data = data else {print("data nil"); return }
//
//        do {
//            let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
//            if let  pokemonArr = mainJson.results {
//
//                print("previous: \(mainJson.previous ?? "no previous page")\nnext: \(mainJson.next ?? "no next page")\n")
//
//                self.pokemonArray.append(contentsOf: pokemonArr)
//
//                // print pokemon array
//                for item in self.pokemonArray {
//                    print(item.name as String!, item.url as String!)
//                }
//
//
//
//                DispatchQueue.main.async {
//
//                    completion()
//                }
//            }
//        } catch {
//            print("error getting Pokemon data objects")
//        }
//        }.resume()
//}


