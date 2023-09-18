//
//  MyProfileViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class MyProfileViewController: UIViewController {

    var profileView = MyProfileView()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMakeUI()
        
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
        self.title = "nabaecamp"

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
