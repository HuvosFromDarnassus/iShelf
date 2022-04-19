//
//  EditorViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class EditorViewController: UIViewController {
    @IBOutlet private weak var _wallImageView: UIImageView!
    @IBOutlet private weak var _shelvesImageView: UIImageView!
    @IBOutlet private weak var _previewImageView: UIImageView!
    
    private let _segueId: String = "goToInfoVC"
    
    private var _wall: Wall?
    private var _wallImage: UIImage?
    
    private let shelfBrain: ShelfBrain = ShelfBrain()
    private var _shelfIndex: Int = 0
    private var _shelvesImage: UIImage?
    private var _shelvesImageTransition: UIView.AnimationOptions = .transitionFlipFromRight
    
    private let previewBrain: PreviewBrain = PreviewBrain()
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        changeWallImage()
        changeShelvesImage()
    }
    
    @IBAction private func shelvesSwiped(_ sender: UISwipeGestureRecognizer) {
        changeShelfIndex(by: sender.direction)
        changeShelfImageTransition(by: sender.direction)
        
        changeShelvesImage()
    }
    @IBAction private func downloadButtonPressed(_ sender: UIButton) {
        ImageSaver.mergeImages(topImage: _shelvesImage!, backImage: _wallImage!)
    }
    @IBAction private func backgroundsButtonPressed(_ sender: UIButton) {
        dismiss(animated: true)
    }
    @IBAction private func infoButtonPressed(_ sender: UIButton) {
        performSegue(withIdentifier: _segueId, sender: self)
    }
    @IBAction private func previewButtonPressed(_ sender: UIButton) {
        _previewImageView.isHidden = _previewImageView.isHidden == false ? true : false

        let preview = previewBrain.getPreview(by: 0)

        UIView.transition(with: _previewImageView,
                          duration: 0.2,
                          options: .transitionFlipFromBottom,
                          animations: { self._previewImageView.image = UIImage(named: preview.image) },
                          completion: nil)
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
