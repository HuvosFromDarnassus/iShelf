//
//  WallBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

class WallBrain {
    private let deviceManager = DeviceManager()
    
    private let _walls: [Wall] = [
        Wall(image: "wall_1", device: DeviceManager.sizeClass.size2),
        Wall(image: "wall_2", device: DeviceManager.sizeClass.size2),
        Wall(image: "wall_3", device: DeviceManager.sizeClass.size2),
        Wall(image: "wall_4", device: DeviceManager.sizeClass.size2),
        Wall(image: "wall_5", device: DeviceManager.sizeClass.size2),
        Wall(image: "wall_6", device: DeviceManager.sizeClass.size2),
        Wall(image: "wall_7", device: DeviceManager.sizeClass.size2)
    ]
    
    private var _wallsForDevice: [Wall] = []
    
    public init() {
        selectWallsForDevice()
    }
    
    public func getWall(by index: Int) -> Wall {
        return _wallsForDevice[index]
    }
    
    public func getWallsCount() -> Int {
        return _wallsForDevice.count
    }
    
    private func selectWallsForDevice() {
        _wallsForDevice = _walls.filter( { $0.device == deviceManager.name } )
    }
}
