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
        Preview(image: "previewImage", devices: DeviceManager.sizeClass.size5)
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
