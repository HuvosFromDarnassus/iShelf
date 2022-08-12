//
//  ModelBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 15.07.2022.
//

class ModelBrain {
    internal let deviceManager = DeviceManager()
    
    internal var assetsForDevice: [IScalable] = []
    
    internal func sortAssetsForDevice(using assets: [IScalable]) {
        assetsForDevice = assets.map {
            $0._devices.filter { $0 == deviceManager.type }
            return $0
        }
    }
}

extension ModelBrain: GetDataProtocol {
    internal func getData() -> [IScalable] {
        return assetsForDevice
    }
}
