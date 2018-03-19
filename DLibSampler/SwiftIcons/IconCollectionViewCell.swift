//
//  IconCollectionViewCell.swift
//  DLibSampler
//
//  Created by ELLIOTT, Dylan on 11/3/18.
//  Copyright © 2018 Dylan Elliott. All rights reserved.
//

import UIKit
import Cartography

class IconCollectionViewCell: UICollectionViewCell {
    let imageView: UIImageView
    let label: UILabel
    
    override init(frame: CGRect) {
        imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        
        label = UILabel()
        label.textAlignment = .center
        label.numberOfLines = 2
        label.adjustsFontSizeToFitWidth = true
        super.init(frame: frame)
        
        layer.cornerRadius = 10
        self.backgroundColor = .white
        
        contentView.addSubview(imageView)
        contentView.addSubview(label)
        
        constrain(imageView, label, contentView, block: { imageView, label, contentView in
            imageView.width == imageView.height
            imageView.leading == contentView.leading
            imageView.trailing == contentView.trailing
            imageView.top == contentView.top
            
            label.height == imageView.height * 0.2
            label.top == imageView.bottom
            label.leading == imageView.leading
            label.trailing == imageView.trailing
            label.bottom == contentView.bottom - 5
        })
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
