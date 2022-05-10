//
//  SoundsManager.swift
//  iShelf
//
//  Created by Daniel Tvorun on 10.05.2022.
//
//  Special thanks to Creator Assets for free sound assets 👍
//  Link: https://creatorassets.com
//  Youtube: https://www.youtube.com/c/CreatorAssets/videos
//  Email: contact@creatorassets.com
//

import AVFoundation

class SoundsManager {
    private var audioPlayer: AVAudioPlayer!
    
    private let _soundsNames = (
        click: "click_sound",
        swipe: "swipe_sound",
        segue: "segue_sound",
        success: "success_sound",
        preview: "toggle_sound"
    )
    
    public enum sounds {
        case click
        case swipe
        case segue
        case success
        case preview
    }
    
    public func playSound(_ sound: sounds) {
        let url = Bundle.main.url(forResource: defineResource(from: sound), withExtension: "mp3")
        
        audioPlayer = try! AVAudioPlayer(contentsOf: url!)
        audioPlayer.play()
    }
    
    private func defineResource(from sound: sounds) -> String {
        switch sound {
        case .click:
            return _soundsNames.click
        case .swipe:
            return _soundsNames.swipe
        case .segue:
            return _soundsNames.segue
        case .success:
            return _soundsNames.success
        case .preview:
            return _soundsNames.preview
        }
    }
}
