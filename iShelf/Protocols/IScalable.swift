//
//  IScalable.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

protocol IScalable {
    var _imageName: String { get }
    var _devices: [DeviceModel] { get }
}
