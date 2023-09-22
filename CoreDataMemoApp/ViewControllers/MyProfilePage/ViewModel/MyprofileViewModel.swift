//
//  MyprofileViewModel.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/21.
//

import UIKit


final class MyprofileViewModel {
    
    // MARK: - properties

    var imageManager: ImageManager
    
    var imageList: [Image] {
        return imageManager.getImageArray()
    }
    
    var minimumInteritemSpacing: CGFloat {
        return 2
    }
    
    var minimumLineSpacing: CGFloat {
        return 2
    }
    
    init(dataManager: ImageManager) {
        self.imageManager = dataManager
    }
    
    // MARK: - func

    func memberViewModelAtIndex(_ index: Int) -> ImageViewModel {
        let image = self.imageList[index]
        return ImageViewModel(imageManager: self.imageManager, image: image, index: index)
    }
    
    func insertCollectionImage(image: Image) {
        imageManager.insertImageArray(image: image)
    }
    
    func numberOfRowsInSection(_ section: Int) -> Int {
        return self.imageList.count
    }
}
