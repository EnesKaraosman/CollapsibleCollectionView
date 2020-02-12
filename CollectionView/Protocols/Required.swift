//
//  Required.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import UIKit

protocol CollapsibleSection where Self: Section {
    var isCollapsed: Bool { get set }
}

protocol TrackableSectionHeader: class {
    var delegate: SectionTapped? { get }
    var indexPath: IndexPath? { get set }
}

protocol CollapsibleCollectionView where Self: UICollectionViewController {
    var items: [GroupedSection<Section, Row>] { get set }
}

protocol SectionTapped where Self: CollapsibleCollectionView {
    func sectionTapped(indexPath: IndexPath)
}

extension SectionTapped where Self: CollapsibleCollectionView {
    func sectionTapped(indexPath: IndexPath) {
        self.items[indexPath.section].toggleCollapse()
        self.collectionView.reloadSections(IndexSet(integer: indexPath.section))
    }
}
