//
//  WallsCollectionViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

class WallsCollectionViewController: UICollectionViewController {
    
    private let presentor: WallsPresenter = WallsPresenter()
    private let soundsManager: SoundsManager = SoundsManager()
    
    private var viewOutputDelegate: WallsViewOutputDelegate?
    
    private var walls: [Wall] = []
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
        
        presentor.setViewInputDelegate(delegate: self)
        viewOutputDelegate = presentor
        viewOutputDelegate?.getData()
        
        setupCollectionCellSize(itemsPerRow: 3, cellHeight: 300)
    }
    
    internal override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    internal override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return walls.count
    }
    
    internal override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: Constants.WallsCollection.wallReusableIdentifier, for: indexPath) as! WallCollectionViewCell
        
        let wall = walls[indexPath.row]
        
        cell.setImage(UIImage(named: wall.imageName))
        
        return cell
    }
    
    internal override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        soundsManager.playSound(.click)
        performSegue(withIdentifier: Constants.WallsCollection.wallCollectionSegue, sender: nil)
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == Constants.WallsCollection.wallCollectionSegue {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                let destination = segue.destination as! EditorViewController
                
                let wall = walls[indexPaths[0].row]
                
                destination.setWall(wall)
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
    
    private func setupCollectionCellSize(itemsPerRow: Int, cellHeight: Int) {
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        
        layout.sectionInset = UIEdgeInsets(top: 1, left: 0, bottom: 1, right: 0)
        
        let screenSize = UIScreen.main.bounds
        
        layout.itemSize = CGSize(width: Int(screenSize.width) / itemsPerRow - 1, height: cellHeight)
        
        layout.minimumInteritemSpacing = 1
        layout.minimumLineSpacing = 1
        
        self.collectionView.collectionViewLayout = layout
    }
}

// MARK: - WallsViewInputDelegate
extension WallsCollectionViewController: WallsViewInputDelegate {
    func setupData(with walls: [Wall]) {
        self.walls = walls
    }
}
