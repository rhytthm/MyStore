//
//  ProductListVC.swift
//  FakeStore
//
//  Created by Rhytthm on 25/02/23.
//

import UIKit

class ProductListVC: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var products: [Product]? = nil
    let parser: Parser = Parser()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self

        parser.parserProductList { (_ProductList) in
            if(_ProductList != nil){
                self.products = _ProductList
                print("product 1 = \(products[0])")
                // now Reloading table on the main thread
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
}

extension ProductListVC: UITableViewDelegate, UITableViewDataSource
{
    // Creating rows in the table
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        self.products?.count ?? 0
    }
    // Adding Data to the rows
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "characterCell") as! TableViewCell
        let characters = self.Characters?[indexPath.row]
        
        cell.lblTitle.text = characters?.title
        cell.lblDescription.text = characters?.description
        
        // Here there can be a case of eager Loading
        let CharacterImageUrl = URL(string: (characters?.imgUrl)!)!
        cell.CharacterImg .loadImage(fromURL: CharacterImageUrl, placeHolderImage: "Loading Image!")
        
        return cell
        
    }
    
    // Creating a single section in the table
    func numberOfSections(in tableView: UITableView) -> Int {
        1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        // Height of the row
        100
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // To deselect the cell once tapped
        tableView.deselectRow(at: indexPath, animated: true)
        // Initiating Detailed VC OnTap of cell
//        let vc = storyboard?.instantiateViewController(withIdentifier: "DetailVC") as? DetailVC
//        // Sending the data to DetailedVC
//        vc?.imageURL = self.Characters?[indexPath.row].imgUrl ?? ""
//        vc?.Title = self.Characters?[indexPath.row].title ?? ""
//               navigationController?.pushViewController(vc!, animated: true)
//        vc?.Description = self.Characters?[indexPath.row].summary ?? ""
       
    }
    
    
}
