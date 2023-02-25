//
//  ProductListTableViewCell.swift
//  MyStore
//
//  Created by Rhytthm on 25/02/23.
//

import UIKit

class ProductListTableViewCell: UITableViewCell {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var verticalStack: UIStackView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        
        // Configure the view for the selected state
    }
    
    public func configure(image:UIImage?, title:String?, price:String?, rating:String?){
        // Here there can be a case of eager Loading
        let productImageUrl = URL(string: (image)!)!
        cell.CharacterImg .loadImage(fromURL: productImageUrl, placeHolderImage: "Loading")
        verticalStack.addSubview(<#T##UIView#>)
    }

}
