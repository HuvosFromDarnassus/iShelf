//
//  Wall.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

struct Wall {
    internal var _imageName: String
    
    public var imageName: String {
        return _imageName
    }
    
    init(imageName: String) {
        _imageName = imageName
    }
}
