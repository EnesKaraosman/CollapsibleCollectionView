//
//  CollectionViewHeader.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import UIKit
import SnapKit

class CollectionViewHeader: UICollectionReusableView, TrackableSectionHeader {
    
    weak var delegate: SectionTapped?
    var indexPath: IndexPath?
    
    var item: Section? {
        didSet {
            titleLabel.text = item?.title
        }
    }
    
    private lazy var titleLabel: UILabel = {
        let lbl = UILabel()
        lbl.textColor = .white
        return lbl
    }()
        
    override init(frame: CGRect) {
        super.init(frame: .zero)
        commonInitializer()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    private func commonInitializer() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(sectionTapped))
        self.addGestureRecognizer(tapGesture)
        
        self.addSubview(titleLabel)
        
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            titleLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            titleLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            titleLabel.topAnchor.constraint(equalTo: self.topAnchor),
            titleLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
        
    }
    
    @objc private func sectionTapped() {
        guard let indexPath = self.indexPath else { return }
        delegate?.sectionTapped(indexPath: indexPath)
    }
    
}
