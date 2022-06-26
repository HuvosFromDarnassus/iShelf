//
//  WallCollectionViewCell.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class WallCollectionViewCell: UICollectionViewCell {
    @IBOutlet private weak var _wallImageView: UIImageView!
    
    public func setImage(_ image: UIImage?) {
        guard let unwrappedImage = image else {
            _wallImageView.image = UIImage(named: Constants.WallsCollection.wallDefaultImageName)
            return
        }
        
        _wallImageView.image = unwrappedImage
    }
}
