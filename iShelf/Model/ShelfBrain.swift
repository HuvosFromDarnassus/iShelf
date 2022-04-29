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
        Shelf(imageName: "s0_shelf_1", devices: DeviceManager.sizeClass.size0),
        Shelf(imageName: "s0_shelf_2", devices: DeviceManager.sizeClass.size0),
        Shelf(imageName: "s0_shelf_3", devices: DeviceManager.sizeClass.size0),
        Shelf(imageName: "s0_shelf_4", devices: DeviceManager.sizeClass.size0),
        Shelf(imageName: "s0_shelf_5", devices: DeviceManager.sizeClass.size0),
        
        Shelf(imageName: "s1_shelf_1", devices: DeviceManager.sizeClass.size1),
        Shelf(imageName: "s1_shelf_2", devices: DeviceManager.sizeClass.size1),
        Shelf(imageName: "s1_shelf_3", devices: DeviceManager.sizeClass.size1),
        Shelf(imageName: "s1_shelf_4", devices: DeviceManager.sizeClass.size1),
        Shelf(imageName: "s1_shelf_5", devices: DeviceManager.sizeClass.size1),
        
        Shelf(imageName: "s2_shelf_1", devices: DeviceManager.sizeClass.size2),
        Shelf(imageName: "s2_shelf_2", devices: DeviceManager.sizeClass.size2),
        Shelf(imageName: "s2_shelf_3", devices: DeviceManager.sizeClass.size2),
        Shelf(imageName: "s2_shelf_4", devices: DeviceManager.sizeClass.size2),
        Shelf(imageName: "s2_shelf_5", devices: DeviceManager.sizeClass.size2),
        
        Shelf(imageName: "s3_shelf_1", devices: DeviceManager.sizeClass.size3),
        Shelf(imageName: "s3_shelf_2", devices: DeviceManager.sizeClass.size3),
        Shelf(imageName: "s3_shelf_3", devices: DeviceManager.sizeClass.size3),
        Shelf(imageName: "s3_shelf_4", devices: DeviceManager.sizeClass.size3),
        Shelf(imageName: "s3_shelf_5", devices: DeviceManager.sizeClass.size3),
        
        Shelf(imageName: "s4_shelf_1", devices: DeviceManager.sizeClass.size4),
        Shelf(imageName: "s4_shelf_2", devices: DeviceManager.sizeClass.size4),
        Shelf(imageName: "s4_shelf_3", devices: DeviceManager.sizeClass.size4),
        Shelf(imageName: "s4_shelf_4", devices: DeviceManager.sizeClass.size4),
        Shelf(imageName: "s4_shelf_5", devices: DeviceManager.sizeClass.size4),
        
        Shelf(imageName: "s5_shelf_1", devices: DeviceManager.sizeClass.size5),
        Shelf(imageName: "s5_shelf_2", devices: DeviceManager.sizeClass.size5),
        Shelf(imageName: "s5_shelf_3", devices: DeviceManager.sizeClass.size5),
        Shelf(imageName: "s5_shelf_4", devices: DeviceManager.sizeClass.size5),
        Shelf(imageName: "s5_shelf_5", devices: DeviceManager.sizeClass.size5),
        
        Shelf(imageName: "s6_shelf_1", devices: DeviceManager.sizeClass.size6),
        Shelf(imageName: "s6_shelf_2", devices: DeviceManager.sizeClass.size6),
        Shelf(imageName: "s6_shelf_3", devices: DeviceManager.sizeClass.size6),
        Shelf(imageName: "s6_shelf_4", devices: DeviceManager.sizeClass.size6),
        Shelf(imageName: "s6_shelf_5", devices: DeviceManager.sizeClass.size6),
        
        Shelf(imageName: "s7_shelf_1", devices: DeviceManager.sizeClass.size7),
        Shelf(imageName: "s7_shelf_2", devices: DeviceManager.sizeClass.size7),
        Shelf(imageName: "s7_shelf_3", devices: DeviceManager.sizeClass.size7),
        Shelf(imageName: "s7_shelf_4", devices: DeviceManager.sizeClass.size7),
        Shelf(imageName: "s7_shelf_5", devices: DeviceManager.sizeClass.size7)
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
