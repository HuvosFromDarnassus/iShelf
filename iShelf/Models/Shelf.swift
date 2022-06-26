//
//  Shelf.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

struct Shelf: IScalable {
    internal var _imageName: String
    internal var _devices: [DeviceModel]
    
    public var imageName: String {
        return _imageName
    }
    
    public var devices: [DeviceModel] {
        return _devices
    }
    
    init(imageName: String, devices: [DeviceModel]) {
        _imageName = imageName
        _devices = devices
    }
}
