//
//  CollectionViewCell.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import UIKit

class CollectionViewCell: UICollectionViewCell {
    
    var item: Row? {
        didSet {
            nameLabel.text = item?.name
        }
    }
    
    private lazy var nameLabel: UILabel = {
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
        self.addSubview(nameLabel)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            nameLabel.leftAnchor.constraint(equalTo: self.leftAnchor, constant: 8),
            nameLabel.rightAnchor.constraint(equalTo: self.rightAnchor),
            nameLabel.topAnchor.constraint(equalTo: self.topAnchor),
            nameLabel.bottomAnchor.constraint(equalTo: self.bottomAnchor)
        ])
    }
    
}
