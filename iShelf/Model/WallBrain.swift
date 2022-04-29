//
//  WallBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

class WallBrain {
    private let deviceManager = DeviceManager()
    
    private let _walls: [Wall] = [
        Wall(imageName: "wall_1"),
        Wall(imageName: "wall_2"),
        Wall(imageName: "wall_3"),
        Wall(imageName: "wall_4"),
        Wall(imageName: "wall_5"),
        Wall(imageName: "wall_6"),
        Wall(imageName: "wall_7"),
    ]
    
    public func getWall(by index: Int) -> Wall {
        return _walls[index]
    }
    
    public func getWallsCount() -> Int {
        return _walls.count
    }
}
