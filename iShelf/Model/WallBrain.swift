//
//  WallBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

class WallBrain {
    private let deviceManager = DeviceManager()
    
    private let _walls: [Wall] = [
        Wall(image: "wall_1"),
        Wall(image: "wall_2"),
        Wall(image: "wall_3"),
        Wall(image: "wall_4"),
        Wall(image: "wall_5"),
        Wall(image: "wall_6"),
        Wall(image: "wall_7"),
    ]
    
    public func getWall(by index: Int) -> Wall {
        return _walls[index]
    }
    
    public func getWallsCount() -> Int {
        return _walls.count
    }
}
