//
//  TodoTableViewCell.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class TodoTableViewCell: UITableViewCell {
    
    // MARK: - properties
    
    
    lazy var contentLabel: UILabel = {
        let ctn = UILabel()
        ctn.labelMakeUI(textColor: UIColors.black, font: Font.contentLabelFont)
        return ctn
    }()
    
    let dateLabel: UILabel = {
        let date = UILabel()
        date.labelMakeUI(textColor: UIColors.black, font: Font.dateLabelFont)
        return date
    }()
    
    private lazy var switchButton: UISwitch = {
        let switchBtn = UISwitch()
        switchBtn.tintColor = UIColors.orange
        switchBtn.layer.cornerRadius = switchBtn.frame.height / 2.0
        switchBtn.isOn = false // 초기값
        switchBtn.translatesAutoresizingMaskIntoConstraints = false
        switchBtn.addTarget(self, action: #selector(onClickSwitch(sender: )), for: UIControl.Event.valueChanged)
        return switchBtn
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


private extension TodoTableViewCell {
    
    func cellMakeUI() {
        self.contentView.addSubview(stackView)
        self.contentView.addSubview(switchButton)
        
        NSLayoutConstraint.activate([
            stackView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 20),
            stackView.trailingAnchor.constraint(equalTo: self.switchButton.leadingAnchor, constant: -40),
            stackView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 10),
            stackView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -10),
            
            switchButton.leadingAnchor.constraint(equalTo: self.stackView.trailingAnchor, constant: 40),
            switchButton.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -20),
            switchButton.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor)
        ])
    }
    
}




// MARK: - @objc func


private extension TodoTableViewCell {
    @objc func onClickSwitch(sender: Any) {
        //guard let todo else { return }
        if switchButton.isOn {
            contentLabel.textColor = UIColors.lightGray
            dateLabel.textColor = UIColors.lightGray
            //contentLabel.attributedText = todo.content?.strikeThrough()
            //TodoManager.completedTodo(todo: todo, isCompleted: true)
        } else {
            contentLabel.textColor = UIColors.black
            dateLabel.textColor = UIColors.black
            //contentLabel.attributedText = nil
            //contentLabel.text = todo.content
            //TodoManager.completedTodo(todo: todo, isCompleted: false)
        }
    }
}
