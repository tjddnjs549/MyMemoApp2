//
//  MyProfileTableViewCell.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/19.
//

import UIKit

final class MyProfileCollectionViewCell: UICollectionViewCell{
    
    
    var profileImageView: UIImageView = {
        let image = UIImageView()
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        //cellMakeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        cellMakeUI()
    }
}


// MARK: - CellMakeUI

extension MyProfileCollectionViewCell {
    
    func cellMakeUI() {
        makeCollectionViewUI()
    }
    
    
    func makeCollectionViewUI() {
        self.addSubview(profileImageView)
        
        NSLayoutConstraint.activate([
            profileImageView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 0),
            profileImageView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: 0),
            profileImageView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 0),
            profileImageView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: 0)

        ])
        
    }
}
