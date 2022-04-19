//
//  WallsCollectionViewController.swift
//  iShelf
//
//  Created by Daniel Tvorun on 19.04.2022.
//

import UIKit

private let reuseIdentifier = "wallDataCell"

class WallsCollectionViewController: UICollectionViewController {
    
    private let wallBrain: WallBrain = WallBrain()
    
    public static let wallDefaultImageName: String = "wall_1"
    
    private let _segueId: String = "goToEditorVC"
    
    internal override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    internal override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    internal override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return wallBrain.getWallsCount()
    }
    
    internal override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! WallCollectionViewCell
        
        let wall = wallBrain.getWall(by: indexPath.row)
        
        cell.setImage(UIImage(named: wall.image))
        
        return cell
    }
    
    internal override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        performSegue(withIdentifier: _segueId, sender: nil)
    }
    
    internal override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == _segueId {
            if let indexPaths = collectionView.indexPathsForSelectedItems {
                let destination = segue.destination as! EditorViewController
                
                let wall = wallBrain.getWall(by: indexPaths[0].row)
                
                destination.setWall(wall)
                collectionView.deselectItem(at: indexPaths[0], animated: false)
            }
        }
    }
}
