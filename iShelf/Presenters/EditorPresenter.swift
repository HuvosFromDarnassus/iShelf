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
    
    private var shelvesData: [IScalable]?
    private var previewsData: [IScalable]?
    
    public func setViewInputDelegate(delegate: EditorViewInputDelegate) {
        viewInputDelegate = delegate
    }
}

// MARK: - PresenterProtocol
extension EditorPresenter: PresenterProtocol {
    internal func fillData() {
        shelvesData = shelfBrain.getData()
        previewsData = previewBrain.getData()
    }
    
    internal func loadData() {
        if let shelves = shelvesData, let previews = previewsData {
            viewInputDelegate?.setupShelves(with: shelves)
            viewInputDelegate?.setupPreviews(with: previews)
        }
    }
}

// MARK: - EditorViewOutputDelegate
extension EditorPresenter: EditorViewOutputDelegate {
    internal func getData() {
        fillData()
        loadData()
    }
}
