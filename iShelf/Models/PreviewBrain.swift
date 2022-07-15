//
//  PreviewBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class PreviewBrain: ModelBrain {
    private let _previews: [Preview] = [
        Preview(imageName: "s0_preview", devices: DeviceManager.sizeClass.size0),
        Preview(imageName: "s1_preview", devices: DeviceManager.sizeClass.size1),
        Preview(imageName: "s2_preview", devices: DeviceManager.sizeClass.size2),
        Preview(imageName: "s3_preview", devices: DeviceManager.sizeClass.size3),
        Preview(imageName: "s4_preview", devices: DeviceManager.sizeClass.size4),
        Preview(imageName: "s5_preview", devices: DeviceManager.sizeClass.size5),
        Preview(imageName: "s6_preview", devices: DeviceManager.sizeClass.size6),
        Preview(imageName: "s7_preview", devices: DeviceManager.sizeClass.size7)
    ]
    
    public override init() {
        super.init()
        sortDataForDevice(using: _previews)
    }
}
