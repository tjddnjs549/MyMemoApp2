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
        image.image = UIImage(named: "Sparta") // 이미지 설정
        image.contentMode = .scaleAspectFit
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
        more.setImage(UIImage(named: "More")?.resized(to: CGSize(width: 30, height: 30)), for: .normal)
        more.tintColor = UIColors.black
        more.contentVerticalAlignment = .center
        more.contentHorizontalAlignment = .center
        more.translatesAutoresizingMaskIntoConstraints = false
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
    
    private let leftButton: UIButton = {
        let left = UIButton(type: .custom)
        left.setImage(UIImage(named: "Item1")?.resized(to: CGSize(width: 22.5, height: 22.5)), for: .normal)
        left.tintColor = UIColors.black
        left.contentVerticalAlignment = .center
        left.contentHorizontalAlignment = .center
        left.addTarget(self, action: #selector(leftButtonTapped), for: .touchUpInside)
        left.translatesAutoresizingMaskIntoConstraints = false
        return left
    }()
    
    @objc func leftButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.selectedDivider.center.x = self.leftButton.center.x
        }
    }
    
    private let middleButton: UIButton = {
        let mid = UIButton(type: .custom)
        mid.setImage(UIImage(named: "Item1")?.resized(to: CGSize(width: 22.5, height: 22.5)), for: .normal)
        mid.tintColor = UIColors.black
        mid.contentVerticalAlignment = .center
        mid.contentHorizontalAlignment = .center
        mid.addTarget(self, action: #selector(middleButtonTapped), for: .touchUpInside)
        mid.translatesAutoresizingMaskIntoConstraints = false
        return mid
    }()
    
    @objc func middleButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.selectedDivider.center.x = self.middleButton.center.x
        }
    }
    
    private let rightButton: UIButton = {
        let right = UIButton(type: .custom)
        right.setImage(UIImage(named: "Item1")?.resized(to: CGSize(width: 22.5, height: 22.5)), for: .normal)
        right.tintColor = UIColors.black
        right.contentVerticalAlignment = .center
        right.contentHorizontalAlignment = .center
        right.addTarget(self, action: #selector(rightButtonTapped), for: .touchUpInside)
        right.translatesAutoresizingMaskIntoConstraints = false
        return right
    }()

    @objc func rightButtonTapped() {
        UIView.animate(withDuration: 0.3) {
            self.selectedDivider.center.x = self.rightButton.center.x
        }
    }
    
    private lazy var itemButtonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [leftButton,middleButton,rightButton])
        stack.spacing = 0
        stack.axis = .horizontal
        stack.distribution = .equalSpacing
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    let selectedDivider: UIView = {
        let divider = UIView()
        divider.backgroundColor = UIColors.black
        divider.layer.cornerRadius = 3.0
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
        profileView.layer.borderColor = CGColors.black
        profileView.layer.borderWidth = 1.5
    }
    
}

// MARK: - viewMakeUI

private extension MyProfileView {
    
    func makeUI() {
        self.addSubview(highStackView)
        self.addSubview(middleStackView)
        self.addSubview(buttonStackView)
        self.addSubview(divider)
        self.addSubview(itemButtonStackView)
        self.addSubview(selectedDivider)
        
        NSLayoutConstraint.activate([
            highStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 14),
            highStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -28),
            highStackView.topAnchor.constraint(equalTo: self.topAnchor, constant: 100),
            
            profileView.heightAnchor.constraint(equalToConstant: 90),
            profileView.widthAnchor.constraint(equalToConstant: 90),
            
            middleStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            middleStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -15),
            middleStackView.topAnchor.constraint(equalTo: self.highStackView.bottomAnchor, constant: 16),
            
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 15),
            buttonStackView.topAnchor.constraint(equalTo: self.middleStackView.bottomAnchor, constant: 15),
            
            followButton.widthAnchor.constraint(equalToConstant: 150),
            messageButton.widthAnchor.constraint(equalToConstant: 150),
            moreImageButton.widthAnchor.constraint(equalToConstant: 40),
            
            divider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            divider.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            divider.topAnchor.constraint(equalTo: self.buttonStackView.bottomAnchor, constant: 16),
            divider.heightAnchor.constraint(equalToConstant: 1.2),
            
            itemButtonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            itemButtonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: 0),
            itemButtonStackView.topAnchor.constraint(equalTo: self.divider.bottomAnchor, constant: 0),
            itemButtonStackView.heightAnchor.constraint(equalToConstant: 40),
            
            leftButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            middleButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            rightButton.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            
            selectedDivider.heightAnchor.constraint(equalToConstant: 1.5),
            selectedDivider.widthAnchor.constraint(equalTo: self.widthAnchor, multiplier: 1/3),
            selectedDivider.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 0),
            selectedDivider.topAnchor.constraint(equalTo: self.itemButtonStackView.bottomAnchor, constant: 0)
            
        ])
    }
}




