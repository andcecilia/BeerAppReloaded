//
//  DetailsViewController.swift
//  BeerAppReloaded
//
//  Created by Cecilia Andrea Pesce on 11/07/22.
//

import UIKit

// TODO: Importar a lib `AlamofireImage`, que serve para transformar a URL vinda da model em imagem
import AlamofireImage

class DetailsViewController: UIViewController {

    //MARK: - Outlets
    @IBOutlet weak var beerImageView: UIImageView!
    @IBOutlet weak var alcoholLabel: UILabel!
    @IBOutlet weak var bitternessLabel: UILabel!
    @IBOutlet weak var taglineLabel: UILabel!
    @IBOutlet weak var descriptionLabel: UILabel!
    @IBOutlet weak var descriptionTextView: UITextView!

    //MARK: - Public Vars
    
    // TODO: criar a variável da model(Beer) para poder receber as informações vindas da ViewController e fazer o setup das outlets
    var beer: Beer?
    
    //MARK: -  Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()

        // TODO: chamar a função do setup
        setUpDetails()
    }
    
    //MARK: - Public Functions
    
    // TODO: criar uma função que faz o setup dos detalhes
    func setUpDetails() {
        // TODO: Fazer um `guard let` da variável pois ela é 'nullaba' (tem a `?`)
        guard let beer = beer else { return }

        title = beer.name

        beerImageView.af.setImage(withURL: URL(string: beer.beerImageUrl)!)
        
        alcoholLabel.text = "Alcohol Content: \(beer.abv)"
        bitternessLabel.text = "Bitterness:  \(beer.ibu)"
        taglineLabel.text = beer.tagline
        descriptionLabel.text = "Description"
        descriptionTextView.text = beer.description
        descriptionTextView.textAlignment = .justified
    }
    
}
