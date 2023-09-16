//
//  Extension+UITextView.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

extension UITextView {
    
    func makeUITextView(backgroundColor: UIColor, text: String, font: UIFont, borderWidth: CGFloat, cornerRadius: CGFloat, borderColor: CGColor) {
        self.backgroundColor = backgroundColor
        self.text = text
        self.layer.borderWidth = borderWidth
        self.font = font
        self.layer.borderColor = borderColor
        self.layer.cornerRadius = cornerRadius
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

