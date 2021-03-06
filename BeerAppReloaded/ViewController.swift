//
//  ViewController.swift
//  BeerAppReloaded
//
//  Created by Cecilia Andrea Pesce on 28/06/22.
//

import UIKit

class ViewController: UIViewController {
    
    //MARK: - Public Vars
    
    // TODO: Criar uma variável instanciando uma lista do tipo da nossa model (Beer)
    var beerList = [Beer]()
    
    //MARK: - Outlets
    @IBOutlet private weak var tableView: UITableView!
    
    //MARK: - Life Cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Beers"
        
        // TODO: Chamar a função para fazer o setup da TableView
        setUpTableView()
        
        // TODO: Fazer a requisição para a API
        fetchBeerList()
    }
    
    //MARK: - Private Functions
    private func setUpTableView() {
        // TODO: Registrar a célula (XIB)
        tableView.register(cellType: BeerItemTableViewCell.self)
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    //MARK: - Public Functions
    
    // TODO: Fazer a requisição para o backend
    func fetchBeerList() {
        Network.shared.fetchBeerList(completion: { result in
            switch result {
            case .success(let beerResponse):
                //if the result carries an optional value, it should be unwrapped or given two ?? optional chains and the data type as a default value.
                self.beerList = beerResponse ?? []
                
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            case .failure(let error):
                debugPrint(error)
            }
        })
        
        
    }
}

//MARK: - TableViewDataSource Extension
extension ViewController: UITableViewDataSource {
    // TODO: Retornar a quantidade de itens da lista (beerList)
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beerList.count
    }
    
    
    // TODO: Instanciar a célula (XIB) e passar as informações vindas de cada linha (IndexPath) para preencher a célula
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell: BeerItemTableViewCell = tableView.dequeueReusableCell(for: indexPath)
        cell.beerLayout = beerList[indexPath.row]
        return cell
        
    }
}

//MARK: - TableViewDelegate Extension
extension ViewController: UITableViewDelegate {
    // TODO: Instanciar a Storyboard (Main) e ViewController de detalhes (DetailsViewController) para que assim possamos dar um `push` na NavigationController
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        if let detailsViewController = storyboard.instantiateViewController(withIdentifier: "DetailsViewController") as? DetailsViewController {
            
            // TODO: Passar as informações vindas de cada linha(IndexPath), para a variável instanciada na classe DetailsViewController para podermos fazer o setup das informações da tela
            detailsViewController.beer = beerList[indexPath.row]
            
            self.navigationController?.pushViewController(detailsViewController, animated: true)
        }
    }
}


