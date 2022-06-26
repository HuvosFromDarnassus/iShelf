//
//  EditorViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit
import AVFoundation

class EditorViewController: UIViewController {
    @IBOutlet private weak var _wallImageView: UIImageView!
    @IBOutlet private weak var _shelvesImageView: UIImageView!
    @IBOutlet private weak var _previewImageView: UIImageView!
    @IBOutlet private weak var _successModalView: UIView!
    @IBOutlet private weak var _tutorialOverlayView: UIView!
    @IBOutlet private var _buttons: [UIButton]?
    
    // ==============================================
    private var _wall: Wall?
    private var _wallImage: UIImage?
    
    private let shelfBrain: ShelfBrain = ShelfBrain()
    private var _shelfIndex: Int = 0
    private var _shelvesImage: UIImage?
    private var _shelvesImageTransition: UIView.AnimationOptions = .transitionFlipFromRight
    
    private let previewBrain: PreviewBrain = PreviewBrain()
    
    private var _isFirstLaunch: Bool {
        let launchedBefore = UserDefaults.standard.bool(forKey: Constants.Editor.launchedBefore)
        
        if launchedBefore {
            return false
        } else {
            UserDefaults.standard.set(true, forKey: Constants.Editor.launchedBefore)
            return true
        }
    }
    
    private var _infoShowTutorialSignal: Bool = false
    
    private var _needShowTutorialOverlay: Bool {
        if _isFirstLaunch || _infoShowTutorialSignal {
            return true
        }
        
        return false
    }
    
    private let soundsManager: SoundsManager = SoundsManager()
    // ==============================================
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        changeWallImage()
        changeShelvesImage()
        
        if _needShowTutorialOverlay {
            showTutorialOverlay()
        }
        
        setupButtons(opacity: 0.8, offsetWidth: 3, offsetHeight: 3, radius: 4)
        setupSuccessModalView(cornerRadius: 15, alpha: 0.7)
    }
    // ==============================================
    public func setWall(_ wall: Wall) {
        _wall = wall
    }
    // ==============================================
    
    // MARK: - IBActions
    @IBAction private func shelvesSwiped(_ sender: UISwipeGestureRecognizer) {
        changeShelfIndex(by: sender.direction)
        changeShelfImageTransition(by: sender.direction)
        
        soundsManager.playSound(.swipe)
        
        changeShelvesImage()
    }
    @IBAction private func tutorialOverlayTaped(_ sender: UITapGestureRecognizer) {
        soundsManager.playSound(.click)
        
        if _infoShowTutorialSignal {
            dismiss(animated: true)
        }
        _tutorialOverlayView.isHidden = true
    }
    @IBAction private func downloadButtonPressed(_ sender: UIButton) {
        ImageSaver.mergeImages(topImage: _shelvesImage!, backImage: _wallImage!)
        
        UIView.transition(with: _successModalView,
                          duration: 0.3,
                          options: .transitionFlipFromBottom,
                          animations: { self._successModalView.isHidden = false },
                          completion: nil)
        
        soundsManager.playSound(.success)
        soundsManager.vibrate()
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self._successModalView.isHidden = true
        }
    }
    @IBAction private func backgroundsButtonPressed(_ sender: UIButton) {
        soundsManager.playSound(.click)
        dismiss(animated: true)
    }
    @IBAction private func infoButtonPressed(_ sender: UIButton) {
        soundsManager.playSound(.segue)
        
        performSegue(withIdentifier: Constants.Editor.editorSegue, sender: self)
    }
    @IBAction private func previewButtonPressed(_ sender: UIButton) {
        _previewImageView.isHidden = !_previewImageView.isHidden
        
        sender.isSelected = !_previewImageView.isHidden
        sender.setTitleColor(.cyan, for: .selected)
        
        let preview = previewBrain.getPreview(by: 0)
        
        UIView.transition(with: _previewImageView,
                          duration: 0.2,
                          options: .transitionFlipFromBottom,
                          animations: { self._previewImageView.image = UIImage(named: preview.imageName) },
                          completion: nil)
        
        soundsManager.playSound(.preview)
    }
    
    // ==============================================
    // MARK: - Change IBOutlets
    private func changeWallImage() {
        _wallImage = UIImage(named: _wall?.imageName ?? Constants.WallsCollection.wallDefaultImageName)
        _wallImageView.image = _wallImage
    }
    
    private func changeShelvesImage() {
        let shelf = shelfBrain.getShelf(by: _shelfIndex)
        _shelvesImage = UIImage(named: shelf.imageName)
        
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
    
    
    // MARK: - Setuping
    private func setupSuccessModalView(cornerRadius: CGFloat, alpha: CGFloat) {
        _successModalView.layer.cornerRadius = cornerRadius
        _successModalView.alpha = alpha
    }
    
    private func setupButtons(opacity: Float, offsetWidth: CGFloat, offsetHeight: CGFloat, radius: CGFloat) {
        _buttons?.forEach({
            $0.layer.shadowOpacity = opacity
            $0.layer.shadowOffset = CGSize(width: offsetWidth, height: offsetHeight)
            $0.layer.shadowRadius = radius
        })
    }
    
    
    // MARK: - Tutorial overlay
    private func showTutorialOverlay() {
        UIView.transition(with: _tutorialOverlayView,
                          duration: 0.3,
                          options: .transitionCurlDown,
                          animations: { self._tutorialOverlayView.isHidden = false },
                          completion: nil)
    }
    // ==============================================
    public func setInfoTutorialSignal(senderViewController: UIViewController) {
        guard senderViewController.classForCoder == InfoViewController.classForCoder() else { return }
        
        _infoShowTutorialSignal = true
    }
}
