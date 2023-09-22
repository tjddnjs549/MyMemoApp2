//
//  ImageViewModel.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/21.
//

import UIKit

final class ImageViewModel {
    
    let imageManager: ImageManager
    
    private var image: Image?
    private var index: Int?
    
    init(imageManager: ImageManager, image: Image? = nil, index: Int? = nil) {
        self.imageManager = imageManager
        self.image = image
        self.index = index
    }
    
    var itemimage: UIImage? {
        self.image?.image
    }
    
    // Input
    func handleButtonTapped(image: UIImage?) {
        makeNewMember(image: image)
    }
    
    private func makeNewMember(image: UIImage?) {
        let newImage = Image(image: image)
        self.imageManager.insertImageArray(image: newImage)
    }
}
