//
//  EditorViewInputDelegate.swift
//  iShelf
//
//  Created by Daniel Tvorun on 26.06.2022.
//

protocol EditorViewInputDelegate: AnyObject {
    func setupShelves(with shelves: [Shelf])
    func setupPreviews(with previews: [Preview])
}
