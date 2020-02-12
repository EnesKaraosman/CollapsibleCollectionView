//
//  Section.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import Foundation

class Section: CollapsibleSection {
    var title: String = ""
    var isCollapsed: Bool = false
    
    init(title: String) {
        self.title = title
    }
}
