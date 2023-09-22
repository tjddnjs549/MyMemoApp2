//
//  ImageManager.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/21.
//

import UIKit

class ImageManager {
    
    var imageItemArray: [Image] = []
    
    
    init() {
        makeImageItemArray()
    }
    
    func makeImageItemArray() {
        imageItemArray = [
            Image(image: UIImage(named: "1")!.resized(to: CGSize(width: 130, height: 130))),
            Image(image: UIImage(named: "2")!.resized(to: CGSize(width: 130, height: 130))),
            Image(image: UIImage(named: "3")!.resized(to: CGSize(width: 130, height: 130))),
            Image(image: UIImage(named: "4")!.resized(to: CGSize(width: 130, height: 130))),
            Image(image: UIImage(named: "5")!.resized(to: CGSize(width: 130, height: 130))),
            Image(image: UIImage(named: "6")!.resized(to: CGSize(width: 130, height: 130))),
            Image(image: UIImage(named: "7")!.resized(to: CGSize(width: 130, height: 130)))
        ]
    }
    
    func getImageArray() -> [Image] {
        return imageItemArray
    }
    
    func insertImageArray(image: Image) {
        self.imageItemArray.append(image)
    }
    
    subscript(index: Int) -> Image {
        get {
            return imageItemArray[index]
        }
        
    }
}
