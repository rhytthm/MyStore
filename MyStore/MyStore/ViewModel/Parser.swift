//
//  Parser.swift
//  FakeStore
//
//  Created by Rhytthm on 25/02/23.
//

import Foundation

// API - https://fakestoreapi.com/products
struct Parser {
    // Function to Parse the Data
    func parserProductList(completionHandler: @escaping (ProductList?) -> ()){
        let api = URL(string: "https://fakestoreapi.com/products")
        URLSession.shared.dataTask(with: api!){ (data, response, error) in
            if (error == nil && data != nil){
                do{
                    let result = try JSONDecoder().decode( ProductList.self, from: data!)
                    completionHandler(result)
                }catch let error {
                    debugPrint(error)
                }
            }
            
        }.resume()
    }
    
    func parserProduct(productId:Int?,completionHandler: @escaping (Product?) -> ()){
        if let productId = productId {
            var url = "https://fakestoreapi.com/products/\(productId)"
            let api = URL(string: url)
            URLSession.shared.dataTask(with: api!){ (data, response, error) in
                if (error == nil && data != nil){
                    do{
                        let result = try JSONDecoder().decode( Product.self, from: data!)
                        completionHandler(result)
                    }catch let error {
                        debugPrint(error)
                    }
                }
                
            }.resume()
        }
    }
}
