//
//  Shelf.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

struct Shelf: IScalable {
    internal var _image: String
    internal var _devices: [DeviceModel]
    
    public var image: String {
        return _image
    }
    
    public var devices: [DeviceModel] {
        return _devices
    }
    
    init(image: String, devices: [DeviceModel]) {
        _image = image
        _devices = devices
    }
}
