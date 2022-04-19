//
//  ImageSaver.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class ImageSaver {
    public static func mergeImages(topImage: UIImage, backImage: UIImage) {

        let bottomImage = backImage
        let topImage = topImage

        let size = backImage.size
        UIGraphicsBeginImageContextWithOptions(size, false, bottomImage.scale)

        let areaSize = CGRect(x: 0, y: 0, width: size.width, height: size.height)
        bottomImage.draw(in: areaSize)

        topImage.draw(in: areaSize, blendMode: .normal, alpha: 1.0)

        let defaultImage = UIImage(named: WallsCollectionViewController.wallDefaultImageName)
        let newImage:UIImage = UIGraphicsGetImageFromCurrentImageContext() ?? defaultImage!

        UIGraphicsEndImageContext()

        return writeToDevice(image: newImage)
    }
    
    private static func writeToDevice(image: UIImage) {
        UIImageWriteToSavedPhotosAlbum(image, nil, nil, nil)
    }
}
