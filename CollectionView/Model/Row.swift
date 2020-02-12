//
//  Row.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import Foundation

class Row: CollapsibleRow {
    var name: String = ""
    var isCollapsed: Bool = false
    
    init(name: String) {
        self.name = name
    }
}
