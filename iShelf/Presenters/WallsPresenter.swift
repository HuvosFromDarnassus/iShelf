//
//  WallsPresenter.swift
//  iShelf
//
//  Created by Daniel Tvorun on 26.06.2022.
//

class WallsPresenter {
    
    weak private var viewInputDelegate: WallsViewInputDelegate?
    
    private let wallBrain: WallBrain = WallBrain()
    
    private var wallsData: [Wall]?
    
    public func setViewInputDelegate(delegate: WallsViewInputDelegate) {
        viewInputDelegate = delegate
    }
    
    private func fillData() {
        wallsData = wallBrain.getWalls()
    }
    
    private func loadData() {
        if let walls = wallsData {
            viewInputDelegate?.setupData(with: walls)
        }
    }
}

// MARK: - WallsViewOutputDelegate
extension WallsPresenter: WallsViewOutputDelegate {
    func getData() {
        fillData()
        loadData()
    }
}
