//
//  SoundsManager.swift
//  iShelf
//
//  Created by Daniel Tvorun on 10.05.2022.
//
//  Special thanks to Creator Assets for free sound assets 👍
//  Link: https://creatorassets.com
//  Youtube: https://www.youtube.com/c/CreatorAssets
//  Email: contact@creatorassets.com
//

import UIKit
import AVFoundation

class SoundsManager {
    private var audioPlayer: AVAudioPlayer!
    
    public enum sounds {
        case click
        case swipe
        case segue
        case success
        case preview
    }
    
    public func playSound(_ sound: sounds) {
        let url = Bundle.main.url(forResource: defineResource(from: sound), withExtension: Constants.SoundsManager.fileType)
        
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    public func vibrate() {
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
    }
    
    private func defineResource(from sound: sounds) -> String {
        switch sound {
        case .click:
            return Constants.SoundsManager.click
        case .swipe:
            return Constants.SoundsManager.swipe
        case .segue:
            return Constants.SoundsManager.segue
        case .success:
            return Constants.SoundsManager.success
        case .preview:
            return Constants.SoundsManager.preview
        }
    }
}
