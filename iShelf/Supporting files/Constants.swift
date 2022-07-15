//
//  Constants.swift
//  iShelf
//
//  Created by Daniel Tvorun on 26.06.2022.
//

struct Constants {
    struct WallsCollection {
        static let wallCollectionSegue = "goToEditorVC"
        static let wallDefaultImageName = "wall_1"
        static let wallReusableIdentifier = "wallDataCell"
    }
    
    struct Editor {
        static let editorSegue = "goToInfoVC"
        static let launchedBefore = "launchedBefore"
    }
    
    struct Info {
        static let infoSegue = "backToEditorVC"
    }
    
    struct SoundsManager {
        static let fileType = "mp3"
        static let click = "click_sound"
        static let swipe = "swipe_sound"
        static let segue = "segue_sound"
        static let success = "success_sound"
        static let preview = "toggle_sound"
    }
}
