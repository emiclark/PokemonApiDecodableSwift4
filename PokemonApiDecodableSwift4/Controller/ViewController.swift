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
    let imageCache = NSCache<NSString, UIImage>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableview.delegate = self
        self.tableview.dataSource = self
        
        do {
            try ApiClient.getPokemonData(urlString: Constants.getInitialPokemonDataUrlString) { (pokemonArr) in
                self.pokemonArray = pokemonArr
                
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
        
        if self.imageCache.object(forKey: NSString(string: url!)) != nil {
            // use image in cache
            cell.pokemonImage.image = self.imageCache.object(forKey: NSString(string: url!))
        } else {
            // image not cached - download image
            do {
                try ApiClient.getSpriteImage(urlString: url!, completion: { (spriteImage) in
                    DispatchQueue.main.async {
                        // check if cell is visible before assigning image
                        if self.tableview.cellForRow(at: indexPath) != nil {
                            cell.pokemonImage.image = spriteImage
                            self.imageCache.setObject(spriteImage, forKey: NSString(string: url!))
                        }
                    }
                })
            } catch let error {
                print("error getting sprite image - \(error.localizedDescription)")
            }
        }
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return CGFloat(Constants.rowHeight)
    }
}

