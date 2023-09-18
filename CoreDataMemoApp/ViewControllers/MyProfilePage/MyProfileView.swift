//
//  MyProfileView.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class MyProfileView: UIView {

    lazy var profileView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    
}
