//
//  PreviewBrain.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

class PreviewBrain {
    private let deviceManager = DeviceManager()
    
    private let _previews: [Preview] = [
        Preview(image: "previewImage", device: DeviceManager.sizeClass.size2)
    ]
    
    private var _previewsForDevice: [Preview] = []
    
    public init() {
        selectPreviewsForDevice()
    }
    
    public func getPreview(by index: Int) -> Preview {
        return _previewsForDevice[index]
    }
    
    private func selectPreviewsForDevice() {
        _previewsForDevice = _previews.filter( { $0.device == deviceManager.name } )
    }
}
