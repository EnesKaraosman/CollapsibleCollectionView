# CollapsibleCollectionView

**TLDR;**
Clone project & enjoy.

Let's use!

Make sure you confirm protocols below!
```swift
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
```

And imagine you have **Section: CollapsibleSection** & **Row** Classes representing the data for related fields in collectionView

```swift

class CollectionViewController: UICollectionViewController, CollapsibleCollectionView { 
    var items: [GroupedSection<Section, Row>] = []
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items[section].section.isCollapsed ? 0 : items[section].rows.count
    }
    
    /*
    And when you bind your header, don't forget to set
      CollectionViewHeader.indexPath & CollectionViewHeader.delegate
    */
}

extension CollectionViewController: SectionTapped { } // Default impl. exist, you may override

class CollectionViewHeader: UICollectionReusableView, TrackableSectionHeader {
    weak var delegate: SectionTapped?
    var indexPath: IndexPath?
    
    // Bind tap gesture here and trigger delegate?.sectionTapped(indexpath)
}

class CollectionViewCell: UICollectionViewCell { }
```


![](https://github.com/EnesKaraosman/CollapsibleCollectionView/blob/master/CollectionView/collapsible-demo.gif)
