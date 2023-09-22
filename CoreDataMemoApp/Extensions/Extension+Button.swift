//
//  Extension+Button.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

extension UIButton {
    
    func buttonMakeUI(cornerRadius: CGFloat, borderWidth: CGFloat, borderColor: CGColor, setTitle: String, font: UIFont, setTitleColor:  UIColor) {
        self.backgroundColor = .clear
        self.layer.cornerRadius = cornerRadius
        self.clipsToBounds = true //둥글게
        self.layer.borderWidth = borderWidth
        self.layer.borderColor = borderColor
        self.setTitle(setTitle, for: .normal)
        self.setTitleColor(setTitleColor, for: .normal)
        self.titleLabel?.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}
