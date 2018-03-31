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
        let headerview: UIView = {
            let header = UIView()
            header.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 75)
            header.backgroundColor = UIColor(red: 101.0, green: 102.0, blue: 151.0, alpha: 1.0)
            return header
        }()
        
        let title: UILabel = {
            let label = UILabel()
            label.textColor = UIColor.red
            label.textAlignment = .center
            label.backgroundColor = UIColor.cyan
            label.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 50)
            label.center = headerview.center
            return label
        }()
        
        headerview.translatesAutoresizingMaskIntoConstraints = false
        title.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(headerview)
        headerview.addSubview(title)
        
        NSLayoutConstraint.activate([
            headerview.centerXAnchor.constraint(equalTo: self.view.centerXAnchor),
            headerview.centerYAnchor.constraint(equalTo:  self.view.centerYAnchor),
            headerview.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.topAnchor.constraint(equalTo: headerview.bottomAnchor)
            ])
        
        
        
        
        do {
            try ApiClient.getPokemonData(urlString: Constants.initialURL, completion: { (pokemonArr) in
                DispatchQueue.main.async {
                    self.pokemonArray.append(contentsOf: pokemonArr)
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
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 140
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return pokemonArray.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! PokemonTableViewCell
        
        cell.title.text = pokemonArray[indexPath.row].name 
        cell.pokemonImage.image = #imageLiteral(resourceName: "placeholder")
        
        // separate string into components separated by '/' into an array. grab 2nd from last value.
        let urlString = pokemonArray[indexPath.row].url!
        let tempArr = urlString.components(separatedBy: "/")
        let digit = tempArr[tempArr.count-2]
        let spriteUrlString = Constants.baseSpriteUrlString + "\(digit).png"
        
        downloadImage(spriteUrlString) { (image) -> Void in
            if let image = image{
                DispatchQueue.main.async {
                    cell.pokemonImage.image = image
                }
            }
        }
        return cell
    }
    
    func downloadImage(_ urlString: String, handler: @escaping (_ image:UIImage?)-> Void) {
        let imageURL: URL = URL(string: urlString)!
        
        URLSession.shared.dataTask(with: imageURL) { (data, _, _) in
            if let data = data{
                handler(UIImage(data: data))
            }
        }.resume()
    }
}
