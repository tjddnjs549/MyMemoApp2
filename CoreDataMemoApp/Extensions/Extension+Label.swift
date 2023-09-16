//
//  Extension+Label.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit


extension UILabel {
    func labelMakeUI(textColor: UIColor, font: UIFont) {
        self.textColor = textColor
        self.font = font
        self.translatesAutoresizingMaskIntoConstraints = false
    }
}

