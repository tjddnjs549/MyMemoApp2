//
//  Extension+String.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/23.
//

import UIKit


extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
// 취소선 지우기
        func removeStrikethrough() -> NSAttributedString {
        let attributedString = NSMutableAttributedString(string: self)
        attributedString.removeAttribute(NSAttributedString.Key.strikethroughStyle, range: NSMakeRange(0, self.count))
        return attributedString
    }
}
