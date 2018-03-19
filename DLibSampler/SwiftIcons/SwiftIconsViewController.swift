//
//  SwiftIconsViewController.swift
//  DLibSampler
//
//  Created by ELLIOTT, Dylan on 11/3/18.
//  Copyright © 2018 Dylan Elliott. All rights reserved.
//

import UIKit
import SwiftIcons

class SwiftIconsViewController: UICollectionViewController {
    typealias Section = (title: String, icons: [FontType])
    typealias CellViewModel = (text: String?, icon: FontType, section: Section?)
    
    var cellViewModels: [CellViewModel] = []
    
    func sectionCellViewModels() -> [CellViewModel] {
        let sections: [Section] = {
            return [
                iconSection("Emoji") {
                    guard let glyph = EmojiType(rawValue: $0) else { return nil }
                    return FontType.emoji(glyph)
                },
                iconSection("Drip Icon") {
                    guard let glyph = DripiconType(rawValue: $0) else { return nil }
                    return FontType.dripicon(glyph)
                },
                iconSection("Font Awesome") {
                    guard let glyph = FAType(rawValue: $0) else { return nil }
                    return FontType.fontAwesome(glyph)
                },
                iconSection("Google Material") {
                    guard let glyph = GoogleMaterialDesignType(rawValue: $0) else { return nil }
                    return FontType.googleMaterialDesign(glyph)
                },
                iconSection("Icofont") {
                    guard let glyph = IcofontType(rawValue: $0) else { return nil }
                    return FontType.icofont(glyph)
                },
                iconSection("Ionicons") {
                    guard let glyph = IoniconsType(rawValue: $0) else { return nil }
                    return FontType.ionicons(glyph)
                },
                iconSection("Linear Icon") {
                    guard let glyph = LinearIconType(rawValue: $0) else { return nil }
                    return FontType.linearIcons(glyph)
                },
                iconSection("Mapicons") {
                    guard let glyph = MapiconsType(rawValue: $0) else { return nil }
                    return FontType.mapicons(glyph)
                },iconSection("Open Iconic") {
                    guard let glyph = OpenIconicType(rawValue: $0) else { return nil }
                    return FontType.openIconic(glyph)
                },
                  iconSection("State") {
                    guard let glyph = StatefaceType(rawValue: $0) else { return nil }
                    return FontType.state(glyph)
                },
                  iconSection("Weather") {
                    guard let glyph = WeatherType(rawValue: $0) else { return nil }
                    return FontType.weather(glyph)
                }
            ]
        }()
        
        return sections.map({
            ($0.title, $0.icons[0], $0)
        })
    }
    
    func iconSection(_ sectionName: String, _ producer: (Int) -> FontType?) -> Section {
        var icons: [FontType] = []
        
        var count = 0
        while let icon = producer(count) {
            icons.append(icon)
            count += 1
        }
        
        return (sectionName, icons)
    }
    
    convenience init() {
        self.init(section: nil)
    }
    
    init(section: Section? = nil) {
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: 80, height: 80)
        super.init(collectionViewLayout: layout)
        
        if let section = section { cellViewModels = section.icons.map({ ($0.text, $0, nil) }) }
        else { cellViewModels = sectionCellViewModels() }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(white: 0.95, alpha: 1.0)
        
        collectionView?.contentInset = UIEdgeInsets(top: 10, left: 20, bottom: 10, right: 20)
        collectionView?.backgroundColor = .clear
        collectionView?.register(IconCollectionViewCell.self, forCellWithReuseIdentifier: "Cell")
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return cellViewModels.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! IconCollectionViewCell
        
        let cellViewModel = cellViewModels[indexPath.row]
        
        cell.imageView.image = UIImage(icon: cellViewModel.icon, size: CGSize(width: 300, height: 300))
        cell.label.text = cellViewModel.text
        
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let cellViewModel = cellViewModels[indexPath.row]
        
        guard let section = cellViewModel.section else { return }
        
        let sectionViewController = SwiftIconsViewController(section: section)
        sectionViewController.title = cellViewModel.text
        self.navigationController?.pushViewController(sectionViewController, animated: true)
    }
}
