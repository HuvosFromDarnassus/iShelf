//
//  EditorViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class EditorViewController: UIViewController {
    @IBOutlet private weak var _wallImageView: UIImageView!
    @IBOutlet weak var _shelvesImageView: UIImageView!
    
    private var _wall: Wall?
    private var _wallImage: UIImage?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        changeWallImage()
    }
    
    @IBAction private func backgroundsButtonPressed(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    private func changeWallImage() {
        _wallImage = UIImage(named: _wall?.image ?? WallsCollectionViewController.wallDefaultImageName)
        _wallImageView.image = _wallImage
    }
    
    public func setWall(_ wall: Wall) {
        _wall = wall
    }
}
