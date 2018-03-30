//
//  PokemonTableViewCell.swift
//  PokemonApiDecodableSwift4
//
//  Created by Emiko Clark on 3/26/18.
//  Copyright © 2018 Emiko Clark. All rights reserved.
//

import UIKit

class PokemonTableViewCell: UITableViewCell {

    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var pokemonImage: UIImageView!
    @IBOutlet weak var imageUrlString: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        self.pokemonImage.layer.borderWidth = 1
        self.pokemonImage.layer.borderColor = UIColor.orange.cgColor
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }

}
