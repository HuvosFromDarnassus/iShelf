//
//  EditorPresenter.swift
//  iShelf
//
//  Created by Daniel Tvorun on 26.06.2022.
//

class EditorPresenter {
    
    weak private var viewInputDelegate: EditorViewInputDelegate?
    
    private let shelfBrain: ShelfBrain = ShelfBrain()
    private let previewBrain: PreviewBrain = PreviewBrain()
    
    private var shelvesData: [Shelf]?
    private var previewsData: [Preview]?
    
    public func setViewInputDelegate(delegate: EditorViewInputDelegate) {
        viewInputDelegate = delegate
    }
    
    private func fillData() {
        shelvesData = shelfBrain.getShelves()
        previewsData = previewBrain.getPreviews()
    }
    
    private func loadData() {
        if let shelves = shelvesData, let previews = previewsData {
            viewInputDelegate?.setupShelves(with: shelves)
            viewInputDelegate?.setupPreviews(with: previews)
        }
    }
    
}

// MARK: - EditorViewOutputDelegate
extension EditorPresenter: EditorViewOutputDelegate {
    func getData() {
        fillData()
        loadData()
    }
}
