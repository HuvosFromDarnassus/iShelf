//
//  Shelf.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

struct Shelf: IScalable {
    internal var _image: String
    internal var _device: String
    
    public var image: String {
        return _image
    }
    
    public var device: String {
        return _device
    }
    
    init(image: String, device: String) {
        _image = image
        _device = device
    }
}
