//
//  GroupedSeciton.swift
//  CollectionView
//
//  Created by Enes Karaosman on 12.02.2020.
//  Copyright © 2020 Etiya. All rights reserved.
//

import Foundation

class GroupedSection<S: CollapsibleSection, R: CollapsibleRow> {
    var section: S
    var rows: [R]
    
    init (section: S, rows: [R]) {
        self.section = section
        self.rows = rows
    }
    
    func toggleCollapse() {
        self.section.isCollapsed.toggle()
        self.rows.forEach { $0.isCollapsed.toggle() }
    }
    
}
