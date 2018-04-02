//
//  ApiClient.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/26/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import Foundation
import UIKit

class ApiClient {
        
    // MARK:- Api Calls
    class func getPokemonData(urlString: String, completion: @escaping([Pokemon])->()) throws {

        let apiString = urlString
        guard let apiURL = URL(string: apiString) else { print("url conversion failed"); return }

        URLSession.shared.dataTask(with: apiURL) { (data, response, error) in
            guard let data = data else {print("getPokemonData()- data nil"); return }

            do {
                let mainJson = try JSONDecoder().decode(MainJSON.self, from: data)
                if let  pokemonArr = mainJson.results {
                    completion(pokemonArr)
                }
            } catch {
                print("getPokemonData() - error getting Pokemon data objects")
            }
        }.resume()
    }

    // Get sprite image
    class func getSpriteImage(urlString: String, completion: @escaping(UIImage)->()) throws {
        
        let spriteUrlString = getSpriteImageID(id: urlString)
        
        guard let url = URL(string: spriteUrlString) else {print("url conversion failed"); return }
        
        URLSession.shared.dataTask(with: url) { (data, response, error) in
            guard let data = data else { print("data nil"); return }
        
            if let spriteImage = UIImage(data: data) {
                // return sprite image
                completion(spriteImage)
            } else {
                // return placeholder image if sprite image is nil
                completion(#imageLiteral(resourceName: "placeholder"))
            }
        }.resume()
    }
    
    // parses urlString for sprite id, creates and returns a urlString to download spriteImage
    class func getSpriteImageID(id: String) -> (String) {
        let array = id.components(separatedBy: "/")
        let spriteId = array[array.count - 2]
        let spriteUrlString = Constants.baseSpriteUrlString + spriteId + ".png"
        return spriteUrlString
    }
}
