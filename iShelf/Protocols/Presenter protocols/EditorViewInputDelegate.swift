//
//  EditorViewInputDelegate.swift
//  iShelf
//
//  Created by Daniel Tvorun on 26.06.2022.
//

protocol EditorViewInputDelegate: AnyObject {
    func setupShelves(with shelves: [IScalable])
    func setupPreviews(with previews: [IScalable])
}
