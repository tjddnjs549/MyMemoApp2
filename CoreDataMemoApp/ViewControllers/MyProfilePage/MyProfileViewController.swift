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
    
    var imageItemArray: [UIImage] = [
        UIImage(named: "1")!.resized(to: CGSize(width: 130, height: 130)),
        UIImage(named: "2")!.resized(to: CGSize(width: 130, height: 130)),
        UIImage(named: "3")!.resized(to: CGSize(width: 130, height: 130)),
        UIImage(named: "4")!.resized(to: CGSize(width: 130, height: 130)),
        UIImage(named: "5")!.resized(to: CGSize(width: 130, height: 130)),
        UIImage(named: "6")!.resized(to: CGSize(width: 130, height: 130)),
        UIImage(named: "7")!.resized(to: CGSize(width: 130, height: 130))
    ]
    
    private lazy var collectionView: UICollectionView = {
        let collection = UICollectionView(frame: .zero, collectionViewLayout: UICollectionViewFlowLayout())
        collection.showsHorizontalScrollIndicator = false
        collection.backgroundColor = .clear
        collection.translatesAutoresizingMaskIntoConstraints = false
        return collection
    }()
    
    override func loadView() {
        view = profileView
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViewSetting()
        viewMakeUI()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
    }
    
}


extension MyProfileViewController: UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 2
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let collectionViewWidth = collectionView.bounds.width
        let itemWidth = (collectionViewWidth - 4) / 3
        let itemHeight = itemWidth
        
        return CGSize(width: itemWidth, height: itemHeight)
    }
}


// MARK: - collectionViewMakeUI

private extension MyProfileViewController {
    
    func collectionViewSetting() {
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.register(MyProfileCollectionViewCell.self, forCellWithReuseIdentifier: Cell.myProfileCollectionViewCell)
        collectionMakeUI()
    }
    
    func collectionMakeUI() {
        view.addSubview(collectionView)
        
        NSLayoutConstraint.activate([
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: 0),
            collectionView.topAnchor.constraint(equalTo: self.profileView.selectedDivider.bottomAnchor, constant: 1.5)
        ])
    }
    
}

extension MyProfileViewController: UICollectionViewDataSource {
    
    //셀 몇개?
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return imageItemArray.count
    }
    
    //셀 어떤 식으로 보여줘? -> 컬렉션뷰가 2개면 여기서 셀을 등록해야 한다⭐️⭐️⭐️⭐️⭐️
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        print(#function)
        let cell = self.collectionView.dequeueReusableCell(withReuseIdentifier: Cell.myProfileCollectionViewCell, for: indexPath) as! MyProfileCollectionViewCell
        
            cell.profileImageView.image = self.imageItemArray[indexPath.item]
        
        return cell
        
    }
}


extension MyProfileViewController: UICollectionViewDelegate {
    
    //셀을 클릭하면
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
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
        var items: [UIBarButtonItem] = []
        
        if let menuImage = UIImage(named: "Menu") {
            let scaledMenuImage = menuImage.resized(to: CGSize(width: 20, height: 20))
            let scaledImage = scaledMenuImage.withRenderingMode(.alwaysOriginal).withTintColor(UIColors.black)
            let menuBtn = UIBarButtonItem(image: scaledImage, style: .done, target: self, action: #selector(menuButtonTapped))
            
            items.append(menuBtn)
        }
        
        if let plusImage = UIImage(systemName: "plus.bubble") {
            let scaledPlusImage = plusImage.resized(to: CGSize(width: 26, height: 26))
            let scaledImage = scaledPlusImage.withRenderingMode(.alwaysOriginal).withTintColor(UIColors.black)
            let plusBtn = UIBarButtonItem(image: scaledImage, style: .done, target: self, action: #selector(plusButtonTapped))
            
            items.append(plusBtn)
        }
        navigationItem.rightBarButtonItems = items
    }
    
}


// MARK: - @objc func

extension MyProfileViewController {
    @objc func menuButtonTapped() {
        return
    }
    @objc func plusButtonTapped() {
        setupImagePicker()
    }
    
    
}

// MARK: - PHPickerViewController

extension MyProfileViewController {
    
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
                if let image = image as? UIImage {
                    DispatchQueue.main.async {
                        self.imageItemArray.append(image.resized(to: CGSize(width: 130, height: 130)))
                        self.collectionView.reloadData()
                    }
                }
            }
        } else {
            print("이미지 못 불러왔음!!!!")
        }
    }
}
