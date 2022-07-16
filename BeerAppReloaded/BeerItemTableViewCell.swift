//
//  BeerItemTableViewCell.swift
//  BeerAppReloaded
//
//  Created by Cecilia Andrea Pesce on 28/06/22.
//

import UIKit

// TODO: Importar a lib `AlamofireImage`, que serve para transformar a URL vinda da model em imagem
import AlamofireImage

class BeerItemTableViewCell: UITableViewCell, NibReusable {

    //MARK: - Outlets
    @IBOutlet private weak var beerImageView: UIImageView!
    @IBOutlet private weak var nameLabel: UILabel!
    @IBOutlet private weak var abvLabel: UILabel!
    
    //MARK: - Public Variable
    
    // TODO: criar a variável da model(Beer) para poder receber as informações vindas da ViewController e fazer o setup das outlets
    var beerLayout: Beer? {
        // TODO: Utilizar o `didSet` para podermos inicializar as informações e não vir nulas
        didSet {
            guard let beerLayout = beerLayout else { return }
            
            beerImageView.af.setImage(withURL: URL(string: beerLayout.beerImageUrl)!)
            
            nameLabel.text = beerLayout.name
            
            abvLabel.text = String(beerLayout.abv)
        }
    }
    
    //MARK: - Xib's Life Cycle
    override func awakeFromNib() {
        super.awakeFromNib()
    }

}
