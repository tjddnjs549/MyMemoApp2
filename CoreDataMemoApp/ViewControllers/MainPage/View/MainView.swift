//
//  MainView.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.

import UIKit

final class MainView: UIView {
    
    var navigationController = UINavigationController()
    
    private lazy var checkToDoListButton: UIButton = {
        let checkBtn = UIButton(type: .custom)
        checkBtn.buttonMakeUI(cornerRadius: 5, borderWidth: 2, borderColor: CGColors.orange, setTitle: "할 일 확인하기", font: Font.buttonFont, setTitleColor: UIColors.orange)
        checkBtn.addTarget(self, action: #selector(checkButtonTapped), for: .touchUpInside)
        return checkBtn
    }()
    
    
    private lazy var successToDoListButton: UIButton = {
        let successBtn = UIButton(type: .custom)
        successBtn.buttonMakeUI(cornerRadius: 5, borderWidth: 2, borderColor: CGColors.orange, setTitle: "완료한 일 확인", font: Font.buttonFont, setTitleColor: UIColors.orange)
        successBtn.addTarget(self, action: #selector(successButtonTapped), for: .touchUpInside)
        return successBtn
    }()
    
    private lazy var homeImage: UIImageView = {
        let image = UIImageView()
        let url = URL(string: Url.imageUrl)
        image.load(url: url!)
        image.translatesAutoresizingMaskIntoConstraints = false
        return image
    }()
    
    private lazy var buttonStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [checkToDoListButton, successToDoListButton])
        stack.spacing = 20 // 간격
        stack.axis = .horizontal
        stack.distribution = .fillEqually
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        viewSetting()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    deinit {
        print("메인 페이지 사라짐")
    }
    private func viewSetting() {
        makeUI()
    }
    
}

// MARK: - @objc func

private extension MainView {
    
    @objc func checkButtonTapped() {
        let coreDataManager = CoreDataManager.shared
        let viewModel = TodoViewModel(dataManager: coreDataManager, title: "Main")
        let todoVC = TodoViewController(viewModel: viewModel)
        self.navigationController.pushViewController(todoVC, animated: true)
    }
    
    @objc func successButtonTapped() {
        let coreDataManager = CoreDataManager.shared
        let viewModel = CompletedViewModel(dataManager: coreDataManager, title: "Completed")
        let completedVC = CompletedViewController(viewModel: viewModel)
        self.navigationController.pushViewController(completedVC, animated: true)
    }
}

// MARK: - ViewmakeUI


private extension MainView {
    
    func makeUI() {
        self.backgroundColor = .white
        
        self.addSubview(buttonStackView)
        self.addSubview(homeImage)
        
        NSLayoutConstraint.activate([
            homeImage.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10),
            homeImage.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10),
            homeImage.topAnchor.constraint(equalTo: self.topAnchor, constant: 200),
            homeImage.bottomAnchor.constraint(equalTo: self.buttonStackView.topAnchor, constant: -20),
            
            buttonStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 40),
            buttonStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -40),
            buttonStackView.topAnchor.constraint(equalTo: homeImage.bottomAnchor, constant: 20),
            buttonStackView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -340)
        ])
    }
}

