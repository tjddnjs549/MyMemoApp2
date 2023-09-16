//
//  Constant.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit


public enum Font {
    static let buttonFont = UIFont.boldSystemFont(ofSize: 20)
    //static let titleFont = UIFont.boldSystemFont(ofSize: 18)
    static let contentLabelFont = UIFont.boldSystemFont(ofSize: 18)
    static let dateLabelFont = UIFont.systemFont(ofSize: 14)
    static let TextViewFont = UIFont.boldSystemFont(ofSize: 14)
}

public enum CGColors {
    static let orange = CGColor(red: 0.98, green: 0.52, blue: 0.00, alpha: 1.00)
    static let black = CGColor(red: 0.98, green: 0.52, blue: 0.00, alpha: 1.00)
    
}

public enum UIColors {
    static let orange = UIColor.systemOrange
    static let black = UIColor.black
    static let white = UIColor.white
    static let clear = UIColor.clear
    static let lightGray = UIColor.lightGray
}

public enum Cell {
    static let todoTableViewCell: String = "TodoTableViewCell"
}


public enum Url {
    static let imageUrl: String = "https://spartacodingclub.kr/css/images/scc-og.jpg"
}
