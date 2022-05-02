//
//  InfoViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 30.04.2022.
//

import UIKit

class InfoViewController: UIViewController {
    
    private let _segueId: String = "backToEditorVC"
    
    @IBAction private func shelvesTutorialButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: _segueId, sender: self)
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == _segueId {
            let destination = segue.destination as! EditorViewController
            
            destination.setInfoTutorialSignal(senderViewController: self)
        }
    }
}
