//
//  ShelfBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class ShelfBrain {
    private let deviceManager = DeviceManager()
    
    private let _shelves: [Shelf] = [
        Shelf(image: "s0_shelf_1", devices: DeviceManager.sizeClass.size0),
        Shelf(image: "s0_shelf_2", devices: DeviceManager.sizeClass.size0),
        Shelf(image: "s0_shelf_3", devices: DeviceManager.sizeClass.size0),
        Shelf(image: "s0_shelf_4", devices: DeviceManager.sizeClass.size0),
        Shelf(image: "s0_shelf_5", devices: DeviceManager.sizeClass.size0),
        
        Shelf(image: "s1_shelf_1", devices: DeviceManager.sizeClass.size1),
        Shelf(image: "s1_shelf_2", devices: DeviceManager.sizeClass.size1),
        Shelf(image: "s1_shelf_3", devices: DeviceManager.sizeClass.size1),
        Shelf(image: "s1_shelf_4", devices: DeviceManager.sizeClass.size1),
        Shelf(image: "s1_shelf_5", devices: DeviceManager.sizeClass.size1),
        
        Shelf(image: "s2_shelf_1", devices: DeviceManager.sizeClass.size2),
        Shelf(image: "s2_shelf_2", devices: DeviceManager.sizeClass.size2),
        Shelf(image: "s2_shelf_3", devices: DeviceManager.sizeClass.size2),
        Shelf(image: "s2_shelf_4", devices: DeviceManager.sizeClass.size2),
        Shelf(image: "s2_shelf_5", devices: DeviceManager.sizeClass.size2),
        
        Shelf(image: "s3_shelf_1", devices: DeviceManager.sizeClass.size3),
        Shelf(image: "s3_shelf_2", devices: DeviceManager.sizeClass.size3),
        Shelf(image: "s3_shelf_3", devices: DeviceManager.sizeClass.size3),
        Shelf(image: "s3_shelf_4", devices: DeviceManager.sizeClass.size3),
        Shelf(image: "s3_shelf_5", devices: DeviceManager.sizeClass.size3),
        
        Shelf(image: "s4_shelf_1", devices: DeviceManager.sizeClass.size4),
        Shelf(image: "s4_shelf_2", devices: DeviceManager.sizeClass.size4),
        Shelf(image: "s4_shelf_3", devices: DeviceManager.sizeClass.size4),
        Shelf(image: "s4_shelf_4", devices: DeviceManager.sizeClass.size4),
        Shelf(image: "s4_shelf_5", devices: DeviceManager.sizeClass.size4),
        
        Shelf(image: "s5_shelf_1", devices: DeviceManager.sizeClass.size5),
        Shelf(image: "s5_shelf_2", devices: DeviceManager.sizeClass.size5),
        Shelf(image: "s5_shelf_3", devices: DeviceManager.sizeClass.size5),
        Shelf(image: "s5_shelf_4", devices: DeviceManager.sizeClass.size5),
        Shelf(image: "s5_shelf_5", devices: DeviceManager.sizeClass.size5),
        
        Shelf(image: "s6_shelf_1", devices: DeviceManager.sizeClass.size6),
        Shelf(image: "s6_shelf_2", devices: DeviceManager.sizeClass.size6),
        Shelf(image: "s6_shelf_3", devices: DeviceManager.sizeClass.size6),
        Shelf(image: "s6_shelf_4", devices: DeviceManager.sizeClass.size6),
        Shelf(image: "s6_shelf_5", devices: DeviceManager.sizeClass.size6),
        
        Shelf(image: "s7_shelf_1", devices: DeviceManager.sizeClass.size7),
        Shelf(image: "s7_shelf_2", devices: DeviceManager.sizeClass.size7),
        Shelf(image: "s7_shelf_3", devices: DeviceManager.sizeClass.size7),
        Shelf(image: "s7_shelf_4", devices: DeviceManager.sizeClass.size7),
        Shelf(image: "s7_shelf_5", devices: DeviceManager.sizeClass.size7)
    ]
    
    private var _shelvesForDevice: [Shelf] = []
    
    public init() {
        sortShelvesForDevice()
    }
    
    public func getShelf(by index: Int) -> Shelf {
        return _shelvesForDevice[index]
    }
    
    public func getShelvesCount() -> Int {
        return _shelvesForDevice.count
    }
    
    private func sortShelvesForDevice() {
        for _shelf in _shelves {
            for device in _shelf.devices {
                if device == deviceManager.type {
                    _shelvesForDevice.append(_shelf)
                }
            }
        }
    }
}
