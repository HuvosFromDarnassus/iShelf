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
    
    private let shelfBrain = ShelfBrain()
    private var _shelfIndex = 0
    private var _shelvesImage: UIImage?
    private var _shelvesImageTransition: UIView.AnimationOptions = .transitionFlipFromRight
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        changeWallImage()
        changeShelvesImage()
    }
    
    @IBAction func shelvesSwiped(_ sender: UISwipeGestureRecognizer) {
        changeShelfIndex(by: sender.direction)
        changeShelfImageTransition(by: sender.direction)
        
        changeShelvesImage()
    }
    @IBAction private func backgroundsButtonPressed(_ sender: UIButton) {
        dismiss(animated: false)
    }
    
    private func changeWallImage() {
        _wallImage = UIImage(named: _wall?.image ?? WallsCollectionViewController.wallDefaultImageName)
        _wallImageView.image = _wallImage
    }
    
    private func changeShelvesImage() {
        let shelf = shelfBrain.getShelf(by: _shelfIndex)
        _shelvesImage = UIImage(named: shelf.image)
        
        UIView.transition(with: _shelvesImageView,
                          duration: 0.2,
                          options: _shelvesImageTransition,
                          animations: { self._shelvesImageView.image = self._shelvesImage },
                          completion: nil)
    }
    
    private func changeShelfIndex(by direction:  UISwipeGestureRecognizer.Direction) {
        switch direction {
        case .left:
            if _shelfIndex < shelfBrain.getShelvesCount() - 1 {
                _shelfIndex += 1
            }
        case .right:
            if _shelfIndex > 0 {
                _shelfIndex -= 1
            }
        default:
            _shelfIndex = 0
        }
    }
    
    private func changeShelfImageTransition(by direction: UISwipeGestureRecognizer.Direction) {
        if direction == .left {
            _shelvesImageTransition = .transitionFlipFromRight
        } else if direction == .right {
            _shelvesImageTransition = .transitionFlipFromLeft
        }
    }
    
    public func setWall(_ wall: Wall) {
        _wall = wall
    }
}
