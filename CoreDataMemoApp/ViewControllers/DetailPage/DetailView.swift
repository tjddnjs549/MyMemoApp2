//
//  DetailView.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class DetailView: UIView {
    
    let categoryManager = CategoryDataManager.shared
    var selectedCategory: String? = "None"
    
    lazy var contentTextView: UITextView = {
        let content = UITextView()
        content.makeUITextView(backgroundColor: UIColors.white, text: "내용을 입력해주세요", font: Font.TextViewFont, borderWidth: 1.0, cornerRadius: 8, borderColor: CGColors.orange)
        return content
    }()
    
    private let segmentedControl: UISegmentedControl = {
        let control = UISegmentedControl(items: ["none", "work", "life"])
        control.addTarget(self, action: #selector(segmentChanged(sender:)), for: .valueChanged)
        control.translatesAutoresizingMaskIntoConstraints = false
        return control
    }()
    
    private let firstDateLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.lightGray, font: Font.dateLabelFont)
        label.text = "최초:"
        return label
    }()
    lazy var firstDate: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.lightGray, font: Font.dateLabelFont)
        label.text = "2023년 9월 20일 18:18"
        return label
    }()
    
    private let modifiedDateLabel: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.lightGray, font: Font.dateLabelFont)
        label.text = "   수정:"
        return label
    }()
    
    lazy var modifiedDate: UILabel = {
        let label = UILabel()
        label.labelMakeUI(textColor: UIColors.lightGray, font: Font.dateLabelFont)
        label.text = "2023년 9월 20일 18:18"
        return label
    }()
    
    private let nilLabel: UILabel = {
        let label = UILabel()
        return label
    }()
    
    private lazy var firstDateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstDateLabel, firstDate, nilLabel])
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var modifiedDateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [modifiedDateLabel, modifiedDate, nilLabel])
        stack.spacing = 10
        stack.axis = .horizontal
        stack.distribution = .fillProportionally
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var DateStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [firstDateStackView, modifiedDateStackView])
        stack.spacing = 10
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .center
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    private lazy var allStackView: UIStackView = {
        let stack = UIStackView(arrangedSubviews: [contentTextView, segmentedControl, DateStackView])
        stack.spacing = 20
        stack.axis = .vertical
        stack.distribution = .fill
        stack.alignment = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()
    
    var allStackViewTopConstraint: NSLayoutConstraint!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        makeUI()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    private func makeUI() {
        setupNotification()
        stackViewMakeUI()
        setting()
    }
    
    deinit {
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.removeObserver(self, name: UIResponder.keyboardWillHideNotification, object: nil)
    }
}

// MARK: - 키보드 관련 및 @objc func

extension DetailView {
    
    private func setupNotification() {
        NotificationCenter.default.addObserver(self, selector: #selector(moveUpAction), name: UIResponder.keyboardWillShowNotification, object: nil)
        NotificationCenter.default.addObserver(self, selector: #selector(moveDownAction), name: UIResponder.keyboardWillHideNotification, object: nil)
    }
    
    
    @objc func moveUpAction() {
        allStackViewTopConstraint.constant = 10
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    @objc func moveDownAction() {
        allStackViewTopConstraint.constant = 40
        UIView.animate(withDuration: 0.3) {
            self.layoutIfNeeded()
        }
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.endEditing(true)
    }
    
    @objc func segmentChanged(sender: UISegmentedControl) {
        switch sender.selectedSegmentIndex {
        case 0:
            selectedCategory = "None"
            categoryManager.createCategory(title: selectedCategory!)
        case 1:
            selectedCategory = "Work"
            categoryManager.createCategory(title: selectedCategory!)
        case 2:
            selectedCategory = "Life"
            categoryManager.createCategory(title: selectedCategory!)
        default:
            selectedCategory = "None"
            categoryManager.createCategory(title: selectedCategory!)
        }
    }
    
}

// MARK: - makeUI


private extension DetailView {
    
    func setting() {
        self.backgroundColor = UIColors.white
        contentTextView.delegate = self
    }

    func stackViewMakeUI() {
        self.addSubview(allStackView)
        
        allStackViewTopConstraint = allStackView.topAnchor.constraint(equalTo: self.safeAreaLayoutGuide.topAnchor, constant: 60)
        
        NSLayoutConstraint.activate([
            contentTextView.heightAnchor.constraint(equalToConstant: 240),
            allStackView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 20),
            allStackView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -20),
            allStackViewTopConstraint,
            allStackView.heightAnchor.constraint(equalToConstant: 350)
        ])
        
    }
    
}

// MARK: - UITextViewDelegate

extension DetailView: UITextViewDelegate {
    //입력이 시작했을 때
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "내용을 입력해주세요" {
            textView.text = nil
            textView.textColor = .black
        }
    }
    
    // 입력이 끝났을때
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty {
            textView.text = "내용을 입력해주세요"
            textView.textColor = .lightGray
        }
    }
}


