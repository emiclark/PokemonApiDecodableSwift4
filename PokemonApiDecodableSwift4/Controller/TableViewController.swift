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
    var spritesArray = [Sprites]()
    
    // MARK:- View Methods
    override func viewDidLoad() {
        super.viewDidLoad()
        
        do {
            try ApiClient.getPokemonData(urlString: Constants.initialURL, completion: { (pokemonArr) in
                DispatchQueue.main.async {
                    self.pokemonArray.append(contentsOf: pokemonArr)
                    print("getPokemonData() = \(self.pokemonArray)!")
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
        cell.pokemonImage.image = #imageLiteral(resourceName: "placeholder")
        
        
        //        https://raw.githubusercontent.com/PokeAPI/sprites/master/sprites/pokemon/1.png
        // separate components by '/' into an array
        let urlString = pokemonArray[indexPath.row].url!
        let tempArr = urlString.components(separatedBy: "/")
        let digit = tempArr[tempArr.count-2]
        let baseSpriteUrlString = Constants.baseSpriteURLString + "\(digit).png"
        print(baseSpriteUrlString)
        
//        if let urlString =  pokemonArray[indexPath.row].url {
//           let url = URL(string: urlString)
//
//            URLSession.shared.dataTask(with: url!) { (data, response, error) in
//                guard let data = data else { print("data is nil"); return }
//
//                do {
//                    let sprites = try JSONDecoder().decode([Sprites].self, from: data)
//                    self.spritesArray.append(contentsOf: sprites)
//                    print(self.spritesArray)
//
//                    DispatchQueue.main.async {
//
//                        // download sprite image
//                        for sprite in self.spritesArray {
//                            guard let spriteUrlString = sprite.front_default else {print("sprite urlString nil"); return }
//                            guard let url = URL(string: spriteUrlString) else {print("url conversion failed"); return }
//
//                            let imageData = self.downloadImage(url: url)
//                            cell.pokemonImage.image =  imageData
//                        }
//                        self.tableView.reloadData()
//                    }
//
//
////                    DispatchQueue.main.async {
////                        self.spritesArray.append(sprite.sprites!)
////                        print("\n\(sprite.sprites!)!")
////
////                        // download sprite image
////                        if let spriteUrlString = sprite.sprites?.front_default {
////                            let url = URL(string: spriteUrlString)
////                            let imageData = self.downloadImage(url: url!)
////                            cell.pokemonImage.image =  imageData
////                        }
////                        self.tableView.reloadData()
////                    }
////
//
////                    if let spriteUrl = mainJsonSpriteArr.sprites![indexPath.row] {
////
////                        downloadImage(url: URL(url: spriteUrl))
////                    }
//
//
//                } catch let error {
//                    print("error getting sprites - \(error.localizedDescription)")
//                }
//            }.resume()
//        }
        return cell
    }
    
    func downloadImage(url: URL) -> (UIImage) {
        var imageData = UIImage()
        
        print("Download Started")
        getDataFromUrl(url: url) { data, response, error in
            guard let data = data, error == nil else { return }
            print(response?.suggestedFilename ?? url.lastPathComponent)
            print("Download Finished")
            DispatchQueue.main.async() {
                imageData = UIImage(data: data)!
                print(imageData)
//                return imageData
            }
        }
        return #imageLiteral(resourceName: "placeholder")
    }
    
    func getDataFromUrl(url: URL, completion: @escaping (Data?, URLResponse?, Error?) -> ()) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            completion(data, response, error)
            }.resume()
    }
}


//==============


//                    // download sprite images
//                    URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
//                        guard let data = data else { print("sprite data nil"); return }
//
//
//                        DispatchQueue.main.async {
//                            print(data,  (spriteUrlString.sprites?.front_default)!)
//                            cell.pokemonImage.image = UIImage(url: (spriteUrlString.sprites?.front_default)!)
//                            cell.pokemonImage.image =  UIImage(data: data)
//                            self.tableView.reloadData()
//                        }
//                    }).resume()




//==============
// 1
//let cell = tableView.dequeueReusableCell(withIdentifier: "GameCell", for: indexPath)
//let dictionary = self.tableData[(indexPath as NSIndexPath).row] as! [String:AnyObject]
//cell.textLabel!.text = dictionary["trackName"] as? String
//cell.imageView?.image = UIImage(named: "placeholder")
//
//if (self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) != nil){
//    // 2
//    // Use cache
//    print("Cached image used, no need to download it")
//    cell.imageView?.image = self.cache.object(forKey: (indexPath as NSIndexPath).row as AnyObject) as? UIImage
//}else{
//    // 3
//    let artworkUrl = dictionary["artworkUrl100"] as! String
//    let url:URL! = URL(string: artworkUrl)
//    task = session.downloadTask(with: url, completionHandler: { (location, response, error) -> Void in
//        if let data = try? Data(contentsOf: url){
//            // 4
//            DispatchQueue.main.async(execute: { () -> Void in
//                // 5
//                // Before we assign the image, check whether the current cell is visible
//                if let updateCell = tableView.cellForRow(at: indexPath) {
//                    let img:UIImage! = UIImage(data: data)
//                    updateCell.imageView?.image = img
//                    self.cache.setObject(img, forKey: (indexPath as NSIndexPath).row as AnyObject)
//                }
//            })
//        }
//    })
//    task.resume()
//}
//return cell
//}

