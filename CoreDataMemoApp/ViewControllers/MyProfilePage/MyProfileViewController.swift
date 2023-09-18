//
//  MyProfileViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit
import PhotosUI

final class MyProfileViewController: UIViewController {
    
    var profileView = MyProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMakeUI()
        imagePickerSetting()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }
    
}


// MARK: - 네비게이션 및 탭바


private extension MyProfileViewController {
    
    func viewMakeUI() {
        view.backgroundColor = UIColors.white
        naviSetting()
    }
    
    
    func naviSetting() {
        self.navigationItem.title = "nabaecamp"
        
        
        if let titleFont = UIFont(name: "Helvetica Neue Bold", size: 20) {
            self.navigationController?.navigationBar.titleTextAttributes = [
                NSAttributedString.Key.font: titleFont,
                NSAttributedString.Key.foregroundColor: UIColors.black
            ]
        }
        if let menuImage = UIImage(named: "Menu") {
            let scaledMenuImage = menuImage.resized(to: CGSize(width: 20, height: 20))
            let scaledImage = scaledMenuImage.withRenderingMode(.alwaysOriginal).withTintColor(UIColors.black)
            let menuBtn = UIBarButtonItem(image: scaledImage, style: .done, target: self, action: #selector(menuButtonTapped))
            
            navigationItem.rightBarButtonItem = menuBtn
        }
    }
    
}


// MARK: - @objc func

extension MyProfileViewController {
    @objc func menuButtonTapped() {
        return
    }
}

// MARK: - 이미지 제스쳐 및 PHPickerViewController

extension MyProfileViewController {
    
    private func imagePickerSetting() {
        setupTapGestures()
    }
    
    private func setupTapGestures() {
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(touchUpImageView))
        profileView.profileView.addGestureRecognizer(tapGesture)
        profileView.profileView.isUserInteractionEnabled = true
    }
    @objc func touchUpImageView() {
        print("이미지뷰 터치")
        setupImagePicker()
    }
    private func setupImagePicker() {
        var configuration = PHPickerConfiguration()
        configuration.selectionLimit = 0
        configuration.filter = .any(of: [.images])
        
        let picker = PHPickerViewController(configuration: configuration)
        picker.delegate = self
        self.present(picker, animated: true, completion: nil)
    }
}


extension MyProfileViewController: PHPickerViewControllerDelegate {
    
    // 사진이 선택이 된 후에 호출되는 메서드
    func picker(_ picker: PHPickerViewController, didFinishPicking results: [PHPickerResult]) {
        
        picker.dismiss(animated: true)
        
        let itemProvider: NSItemProvider? = results.first?.itemProvider
        
        if let itemProvider = itemProvider, itemProvider.canLoadObject(ofClass: UIImage.self) {
            itemProvider.loadObject(ofClass: UIImage.self) { (image, error) in
                DispatchQueue.main.async {
                    // 이미지뷰에 표시
                    self.profileView.profileView.image = image as? UIImage
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
}
