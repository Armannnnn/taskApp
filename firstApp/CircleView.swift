//
//  CircleView.swift
//  firstApp
//
//  Created by Anastasiya on 19.03.2023.
//

import UIKit

class CircleView: UIView {

    var isSelected: Bool = false {
            didSet {
                layer.borderColor = isSelected ? UIColor.black.cgColor : color.cgColor
                layer.borderWidth = isSelected ? 3 : 0
            }
        }
        
        private let color: UIColor
        
        init(color: UIColor) {
            self.color = color
            super.init(frame: .zero)
            backgroundColor = color
            layer.cornerRadius = bounds.width / 2
            layer.borderColor = UIColor.white.cgColor
        }
        
        required init?(coder aDecoder: NSCoder) {
            fatalError("init(coder:) has not been implemented")
        }
        
        override func layoutSubviews() {
            super.layoutSubviews()
            layer.cornerRadius = bounds.width / 2
        }

}
