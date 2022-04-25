//
//  PreviewBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class PreviewBrain {
    private let deviceManager = DeviceManager()
    
    private let _previews: [Preview] = [
        Preview(image: "s0_preview", devices: DeviceManager.sizeClass.size0),
        Preview(image: "s1_preview", devices: DeviceManager.sizeClass.size1),
        Preview(image: "s2_preview", devices: DeviceManager.sizeClass.size2),
        Preview(image: "s3_preview", devices: DeviceManager.sizeClass.size3),
        Preview(image: "s4_preview", devices: DeviceManager.sizeClass.size4),
        Preview(image: "s5_preview", devices: DeviceManager.sizeClass.size5),
        Preview(image: "s6_preview", devices: DeviceManager.sizeClass.size6),
        Preview(image: "s7_preview", devices: DeviceManager.sizeClass.size7)
    ]
    
    private var _previewsForDevice: [Preview] = []
    
    public init() {
        sortPreviewsForDevice()
    }
    
    public func getPreview(by index: Int) -> Preview {
        return _previewsForDevice[index]
    }
    
    private func sortPreviewsForDevice() {
        for _preview in _previews {
            for device in _preview.devices {
                if device == deviceManager.type {
                    _previewsForDevice.append(_preview)
                }
            }
        }
    }
}
