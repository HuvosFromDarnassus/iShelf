//
//  ShelfBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

class ShelfBrain {
    private let _shelves: [Shelf] = [
        Shelf(image: "shelf_1", device: DeviceManager.sizeClass.size2),
        Shelf(image: "shelf_2", device: DeviceManager.sizeClass.size2),
        Shelf(image: "shelf_3", device: DeviceManager.sizeClass.size2),
        Shelf(image: "shelf_4", device: DeviceManager.sizeClass.size2),
        Shelf(image: "shelf_5", device: DeviceManager.sizeClass.size2)
    ]
    
    private var _shelvesForDevice: [Shelf] = []
    
    private let deviceManager = DeviceManager()
    
    public init() {
        selectShelvesForDevice()
    }
    
    public func getShelvesCount() -> Int {
        return _shelvesForDevice.count
    }
    
    private func selectShelvesForDevice() {
        _shelvesForDevice = _shelves.filter( { $0.device == deviceManager.name } )
    }
    
    public func getShelf(by index: Int) -> Shelf {
        return _shelvesForDevice[index]
    }
}
