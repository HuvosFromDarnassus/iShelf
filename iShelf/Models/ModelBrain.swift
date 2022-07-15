//
//  ModelBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 15.07.2022.
//

class ModelBrain {
    internal let deviceManager = DeviceManager()
    
    internal var dataForDevice: [IScalable] = []
    
    internal func sortDataForDevice(using data: [IScalable]) {
        for dataObject in data {
            for device in dataObject._devices {
                if device == deviceManager.type {
                    dataForDevice.append(dataObject)
                }
            }
        }
    }
}

extension ModelBrain: GetDataProtocol {
    internal func getData() -> [IScalable] {
        return dataForDevice
    }
}
