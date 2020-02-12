//
//  ViewController.swift
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

class CollectionViewController: UICollectionViewController, CollapsibleCollectionView {

    var items: [GroupedSection<Section, Row>] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        addRandomizeButton()
        randomizeData()
        
        collectionView.backgroundColor = .clear
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(CollectionViewCell.self, forCellWithReuseIdentifier: "CV")
        collectionView.register(
            CollectionViewHeader.self,
            forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
            withReuseIdentifier: "CV_Header"
        )
        
    }
    
    private func addRandomizeButton() {
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(
            title: "Random", style: .plain, target: self, action: #selector(randomizeData)
        )
    }

    @objc private func randomizeData() {
        let randomSectionCount = Int.random(in: 2...5)
        self.items = (1...randomSectionCount).map { section in
            let randomRowCount = Int.random(in: 2...5)

            let section = Section(title: "Section \(section)")
            let groupedSection = GroupedSection(
                section: section,
                rows: (1...randomRowCount).map { row in Row(name: "Row \(row)") }
            )
            return groupedSection
        }
        self.collectionView.reloadData()
    }

}

extension CollectionViewController: UICollectionViewDelegateFlowLayout {
    
    // MARK: - Section count
    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return items.count
    }
    
    // MARK: - Row count
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].section.isCollapsed ? 0 : items[section].rows.count
    }
    
    // MARK: - Header Binding
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(
            ofKind: kind,
            withReuseIdentifier: "CV_Header",
            for: indexPath
        ) as! CollectionViewHeader
        header.backgroundColor = #colorLiteral(red: 0.1248639998, green: 0.4042635447, blue: 1, alpha: 1)
        
        // Required
        header.indexPath = indexPath
        header.delegate = self
        
        // Display purposes
        header.item = items[indexPath.section].section
        
        return header
    }
    
    // MARK: - Header Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return .init(width: self.view.frame.width, height: 40)
    }
    
    // MARK: - Cell Binding
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CV", for: indexPath) as! CollectionViewCell
        cell.backgroundColor = .orange
        cell.item = self.items[indexPath.section].rows[indexPath.row] // Display purposes
        return cell
    }
    
    // MARK: - Cell Size
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return .init(width: self.view.frame.width * 0.9, height: 50)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAt section: Int) -> UIEdgeInsets {
        return .init(top: 8, left: 0, bottom: 0, right: 0)
    }
}

extension CollectionViewController: SectionTapped {
//    func sectionTapped(indexPath: IndexPath) {
//        print(indexPath)
//        self.items[indexPath.section].toggleCollapse()
//        self.collectionView.reloadSections(IndexSet(integer: indexPath.section))
//    }
}
