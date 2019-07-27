//
//  AlbumTableViewCell.swift
//  GaanaExercise
//
//  Created by Manisha Sharma on 27/07/19.
//  Copyright © 2019 Manisha Sharma. All rights reserved.
//

import UIKit

class AlbumTableViewCell: UITableViewCell {

    @IBOutlet weak var collectionView: UICollectionView?

    var itemArray: [AlbumItem]?
    
    override func awakeFromNib() {
        super.awakeFromNib()

        createSubView()
    }
    
    func createSubView() {
        collectionView?.dataSource = self
        collectionView?.delegate = self
        collectionView?.register(AlbumCell.self, forCellWithReuseIdentifier: "cellId")
        collectionView?.showsVerticalScrollIndicator = false
        
        collectionView?.translatesAutoresizingMaskIntoConstraints = false
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        collectionView?.collectionViewLayout = layout
    }
}

extension AlbumTableViewCell: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cellId", for: indexPath) as! AlbumCell
        return cell
//        cell.layer.borderColor = UIColor.blue.cgColor
//        cell.layer.borderWidth = 1
//        cell.item = itemArray?[indexPath.row]
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let padding: CGFloat =  16.0
        let collectionViewSize = collectionView.frame.size.width - padding
        
        return CGSize(width: collectionViewSize/2, height: 300)
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        //       let outfitDetailVC = OutfitDetailScreenViewController()
        //        let itemData = objectArray[indexPath.row]
        //        outfitDetailVC.clothObjectArray = itemData.clothes
        //        outfitDetailVC.fullOutfitUrl = imgUrls[indexPath.row]
        //       self.navigationController?.pushViewController(outfitDetailVC, animated: true)
    }   
}
