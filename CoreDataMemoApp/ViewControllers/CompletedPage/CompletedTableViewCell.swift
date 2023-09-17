//
//  CompletedTableViewCell.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/17.
//

import UIKit

final class CompletedTableViewCell: UITableViewCell {

    var task: Task? {
        didSet {
            contentLabel.text = task?.title
            dateLabel.text = task?.createDateString
        }
    }
    
    
    var contentLabel: UILabel = {
        let ctn = UILabel()
        ctn.labelMakeUI(textColor: UIColors.black, font: Font.contentLabelFont)
        return ctn
    }()
    
    let dateLabel: UILabel = {
        let date = UILabel()
        date.labelMakeUI(textColor: UIColors.black, font: Font.dateLabelFont)
        return date
    }()

    private lazy var stackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [contentLabel,dateLabel])
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    // MARK: - init

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: .default, reuseIdentifier: reuseIdentifier)
        cellMakeUI()
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - CellMakeUI

private extension CompletedTableViewCell {
    
    func cellMakeUI() {
        self.contentView.addSubview(stackView)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -60),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
        ])
    }
    
}
