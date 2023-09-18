//
//  MyProfileView.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit
import PhotosUI

final class MyProfileView: UIView {
    
    // MARK: - component properties
    
    lazy var profileView: UIImageView = {
        let image = UIImageView()
        return image
    }()
    
    private let postLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.smallFont)
        label.text = "post"
        return label
    }()
    
    private let postIntLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.smallBoldFont)
        label.text = "7"
        return label
    }()
    
    private lazy var postStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postIntLabel,postLabel])
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let followerLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.smallFont)
        label.text = "follower"
        return label
    }()
    
    private let followerIntLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.smallBoldFont)
        label.text = "0"
        return label
    }()
    
    private lazy var followerStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followerIntLabel,followerLabel])
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.smallFont)
        label.text = "following"
        return label
    }()
    
    private let followingIntLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.smallBoldFont)
        label.text = "0"
        return label
    }()
    
    private lazy var followingStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followingIntLabel,followingLabel])
        stack.spacing = 5
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var labelStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [postStackView,followerStackView,followingStackView])
        stack.spacing = 25
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var highStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [profileView,labelStackView])
        stack.spacing = 50
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.MiddleBoldFont)
        label.text = "르탄이"
        label.layer.borderWidth = 2.0
        label.layer.borderColor = UIColor.black.cgColor
        return label
    }()
    
    private let jobLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.black, font: Font.MiddleFont)
        label.text = "iOS Developer 🍎"
        return label
    }()
    
    private let urlLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.blue, font: Font.MiddleFont)
        if let url = URL(string: "https://spartacodingclub.kr") {
            label.text = url.absoluteString
        }
        return label
    }()
    
    private lazy var middleStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [nameLabel,jobLabel,urlLabel])
        stack.spacing = 2
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let followButton: UIButton = {
        let follow = UIButton(type: .custom)
        follow.buttonMakeUI(cornerRadius: 4, borderWidth: 0, borderColor: CGColors.clear, setTitle: "Follow", font: Font.MiddleBoldFont, setTitleColor: UIColors.white)
        follow.backgroundColor = UIColors.lightBlue
        //follow.addTarget(self, action: #selector(followButtonTapped), for: .touchUpInside)
        return follow
    }()
    
    private let messageButton: UIButton = {
        let message = UIButton(type: .custom)
        message.buttonMakeUI(cornerRadius: 4, borderWidth: 2, borderColor: CGColors.lightGray, setTitle: "Message", font: Font.MiddleBoldFont, setTitleColor: UIColors.black)
        //follow.addTarget(self, action: #selector(messageButtonTapped), for: .touchUpInside)
        return message
    }()
    
    private let moreImageButton: UIButton = {
        let more = UIButton(type: .custom)
        more.buttonMakeUI(cornerRadius: 4, borderWidth: 2, borderColor: CGColors.lightGray, setTitle: "mo", font: Font.MiddleBoldFont, setTitleColor: UIColors.black)
        //follow.addTarget(self, action: #selector(moreImageButtonTapped), for: .touchUpInside)
        return more
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [followButton,messageButton,moreImageButton])
        stack.spacing = 8
        stack.axis = .horizontal
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private let divider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColors.gray
        divider.translatesAutoresizingMaskIntoConstraints = false
        return divider
    }()
    
    // MARK: - init, drawing Cycle
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("프로필 뷰 사라짐")
    }
    
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        self.profileView.clipsToBounds = true
        self.profileView.layer.cornerRadius = self.profileView.frame.width / 2
        profileView.layer.borderColor = UIColor.black.cgColor
        profileView.layer.borderWidth = 2
    }
    
}

// MARK: - viewMakeUI

private extension MyProfileView {
    
    func makeUI() {
        self.addSubview(highStackView)
        self.addSubview(middleStackView)
        self.addSubview(buttonStackView)
        self.addSubview(divider)
        
        NSLayoutConstraint.activate([
            highStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            highStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28),
            highStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 120),
            
            profileView.heightAnchor.constraint(equalToConstant: 90),
            profileView.widthAnchor.constraint(equalToConstant: 90),
            
            middleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            middleStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            middleStackView.topAnchor.constraint(equalTo: self.highStackView.bottomAnchor, constant: 30),
            
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            buttonStackView.topAnchor.constraint(equalTo: self.middleStackView.bottomAnchor, constant: 15),
            
            followButton.widthAnchor.constraint(equalToConstant: 150),
            messageButton.widthAnchor.constraint(equalToConstant: 150),
            moreImageButton.widthAnchor.constraint(equalToConstant: 40),
            
            divider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            divider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            divider.topAnchor.constraint(equalTo: self.buttonStackView.bottomAnchor, constant: 16),
            divider.heightAnchor.constraint(equalToConstant: 1.2)
        ])
    }
}




