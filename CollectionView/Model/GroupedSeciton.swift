//
//  GroupedSeciton.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import Foundation

class GroupedSection<S: CollapsibleSection, _Row> {
    
    var section: S
    var rows: [_Row]
    
    init (section: S, rows: [_Row]) {
        self.section = section
        self.rows = rows
    }
    
    func toggleCollapse() {
        self.section.isCollapsed.toggle()
    }
    
}
