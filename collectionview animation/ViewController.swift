//
//  ViewController.swift
//  collectionview animation
//
//  Created by Yogesh Patel on 29/12/19.
//  Copyright © 2019 yogesh patel. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource {
    
    let arr = [["Image":#imageLiteral(resourceName: "img3"),"Name":"WaterFall","Description":"A Nature is a bueauty of a Earth."],
   ["Image":#imageLiteral(resourceName: "img2"),"Name":"Valley of Flower","Description":"A Flower is a bueauty of a Earth."],
   ["Image":#imageLiteral(resourceName: "Photo4"),"Name":"Rainy Weather","Description":"A Rain is a bueauty of a Earth."]
    
    ]
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return arr.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! CollectionViewCell
        
        cell.img.image = arr[indexPath.row]["Image"] as? UIImage
        cell.name.text = arr[indexPath.row]["Name"] as? String
        cell.detail.text = arr[indexPath.row]["Description"] as? String
        
        cell.contentView.layer.cornerRadius = 5.0
        cell.contentView.layer.borderWidth = 1.0
        cell.contentView.layer.borderColor = UIColor.clear.cgColor
        cell.contentView.layer.masksToBounds = false
        cell.layer.shadowColor = UIColor.darkGray.cgColor
        cell.layer.shadowOffset = CGSize(width: 1.0, height: 1.0)
        cell.layer.shadowRadius = 5.0
        cell.layer.shadowOpacity = 10.0
        cell.layer.masksToBounds = false
        cell.layer.shadowPath = UIBezierPath(roundedRect: cell.bounds, cornerRadius: cell.contentView.layer.cornerRadius).cgPath
        return cell
    }
  func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
         let rotationTransformation = CATransform3DTranslate(CATransform3DIdentity, -500, 10, 0)
                  cell.layer.transform = rotationTransformation
                  cell.alpha = 0.5
                  UIView.animate(withDuration: 0.5) {
                      cell.layer.transform = CATransform3DIdentity
                      cell.alpha = 1.0
    }
    

    func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

}
