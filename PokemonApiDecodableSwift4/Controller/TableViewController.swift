//
//  TableViewController.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/26/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class TableViewController: UITableViewController {

    var pokemonArray = [Pokemon]()
    
    // MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try ApiClient.getPokemonData(urlString: Constants.initialURL, completion: { (pokemonArr) in
                DispatchQueue.main.async {
                    self.pokemonArray.append(contentsOf: pokemonArr)
                    print("getPokemonData() = \(self.pokemonArray)")
                    self.tableView.reloadData()
                }
            })
        } catch let error {
            print("getting data failed-\(error.localizedDescription)")
        }
        
        self.tableView.delegate = self
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        
        cell.title.text = pokemonArray[indexPath.row].name 
        cell.imageUrlString.text = pokemonArray[indexPath.row].url
        
        if let urlString =  pokemonArray[indexPath.row].url {
            ApiClient.downloadImage(urlString: urlString, completion:  { (data)  in
                DispatchQueue.main.async {
                    cell.pokemonImage.image = UIImage(data: data)
                    self.tableView.reloadData()
                }
            })
        }
        return cell
    }

}
