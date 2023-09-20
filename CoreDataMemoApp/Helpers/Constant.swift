//
//  Constant.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit


public enum Font {
    static let buttonFont = UIFont.boldSystemFont(ofSize: 20)
    static let contentLabelFont = UIFont.boldSystemFont(ofSize: 17)
    static let dateLabelFont = UIFont.systemFont(ofSize: 13)
    static let TextViewFont = UIFont.boldSystemFont(ofSize: 14)
    static let smallFont = UIFont.systemFont(ofSize: 14)
    static let smallBoldFont = UIFont.boldSystemFont(ofSize: 16.5)
    static let MiddleBoldFont = UIFont.boldSystemFont(ofSize: 16)
    static let MiddleFont = UIFont.systemFont(ofSize: 16)
}

public enum CGColors {
    static let orange = CGColor(red: 0.98, green: 0.52, blue: 0.00, alpha: 1.00)
    static let black = CGColor(red: 0.0, green: 0.0, blue: 0.00, alpha: 1.00)
    static let clear = CGColor(red: 0, green: 0, blue: 0.00, alpha: 0)
    static let lightGray = CGColor(red: 0.85, green: 0.85, blue: 0.85, alpha: 1)
}

public enum UIColors {
    static let orange = UIColor.systemOrange
    static let black = UIColor.black
    static let white = UIColor.white
    static let clear = UIColor.clear
    static let lightGray = UIColor.lightGray
    static let blue = UIColor.blue
    static let lightBlue = UIColor(red: 0.22, green: 0.6, blue: 0.95, alpha: 1)
    static let gray = UIColor(red: 0.86, green: 0.86, blue: 0.86, alpha: 1)
}

public enum Cell {
    static let todoTableViewCell: String = "TodoTableViewCell"
    static let completedTableViewCell: String = "CompletedTableViewCell"
    static let myProfileCollectionViewCell: String = "MyProfileCollectionViewCell"
}


public enum Url {
    static let imageUrl: String = "https://spartacodingclub.kr/css/images/scc-og.jpg"
}
