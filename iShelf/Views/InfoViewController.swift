//
//  InfoViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 30.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let soundsManager: SoundsManager = SoundsManager()
    
    @IBAction private func shelvesTutorialButtonPressed(_ sender: UIButton) {
        soundsManager.playSound(.click)
        performSegue(withIdentifier: Constants.Info.infoSegue, sender: self)
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.Info.infoSegue {
            let destination = segue.destination as! EditorViewController
            
            destination.setInfoTutorialSignal(senderViewController: self)
        }
    }
}
