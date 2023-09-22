//
//  ViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//
import UIKit


final class TabbarViewController: UITabBarController {
    
    enum TabBarMenu: Int {
        case Main = 0
        case MyProfile
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setTabControllers()
        self.delegate = self
    }
    
    func setTabControllers() {
        let imageManager = ImageManager()
        let myProfileViewModel = MyprofileViewModel(dataManager: imageManager)
        let mainViewModel = MainViewModel(title: "Main")
        let mainVC = MainViewController(viewModel: mainViewModel)
        let naviMainVC = UINavigationController(rootViewController: mainVC)
        let MyProfileVC = MyProfileViewController(viewModel: myProfileViewModel)
        let naviMyProfileVC = UINavigationController(rootViewController: MyProfileVC)
        
        let controllers = [naviMainVC, naviMyProfileVC]
        self.viewControllers = controllers
        
        self.tabBar.layer.borderWidth = 1
        self.tabBar.layer.borderColor = #colorLiteral(red: 0.9176470588, green: 0.9176470588, blue: 0.9176470588, alpha: 1)
        
        self.tabBar.tintColor = UIColors.orange
        
        // Main
        self.tabBar.items![0].imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        self.tabBar.items![0].image = UIImage(systemName: "house.circle")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColors.black).resized(to: CGSize(width: 36, height: 36))
        self.tabBar.items![0].selectedImage = UIImage(systemName: "house.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColors.orange).resized(to: CGSize(width: 36, height: 36))
        self.tabBar.items![0].title = "Main"
        
        // MyProfile
        self.tabBar.items![1].imageInsets = UIEdgeInsets(top: 4, left: 0, bottom: 0, right: 0)
        self.tabBar.items![1].image = UIImage(systemName: "person.crop.circle")?.withRenderingMode(.alwaysOriginal).resized(to: CGSize(width: 36, height: 36))
        self.tabBar.items![1].selectedImage = UIImage(systemName: "person.crop.circle.fill")?.withRenderingMode(.alwaysOriginal).withTintColor(UIColors.orange).resized(to: CGSize(width: 36, height: 36))
        self.tabBar.items![1].title = "Profile"
    }
}

extension TabbarViewController: UITabBarControllerDelegate {
    
    func tabBarController(_ tabBarController: UITabBarController, shouldSelect viewController: UIViewController) -> Bool {
        guard let fromView = selectedViewController?.view, let toView = viewController.view else {
            
            return false
        }
        if fromView != toView {
            UIView.transition(from: fromView, to: toView, duration: 0.3, options: [.transitionCrossDissolve], completion: nil)
        }
        
        return true
    }
}

