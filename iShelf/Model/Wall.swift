//
//  Wall.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

struct Wall {
    internal var _image: String
    
    public var image: String {
        return _image
    }
    
    init(image: String) {
        _image = image
    }
}
