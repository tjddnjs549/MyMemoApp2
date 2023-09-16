//
//  MyProfileViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class MyProfileViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColors.white
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.title = "Profile"
    }

}
