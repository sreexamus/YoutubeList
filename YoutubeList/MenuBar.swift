//
//  MenuBar.swift
//  YoutubeList
//
//  Created by Iragam Reddy, Sreekanth Reddy on 4/22/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

struct MenuItems {
    let name: String
    let image: String
}

class MenuBar: UIView {
    let items = [MenuItems(name: "Airplane", image: "airplane-modeon"), MenuItems(name: "Airplane Off", image: "airplane-modeoff"), MenuItems(name: "Air Landing", image: "airplane-landing"), MenuItems(name: "Aircraft", image: "aircraft"),MenuItems(name: "Aircraftfilled", image: "aircraft-filled")]
    var collectionView: UICollectionView!
    let interimSpace: CGFloat = 4
    override func draw(_ rect: CGRect) {
        super.draw(rect)
        addViews()
    }
    
    private func addViews()  {
        let collectionLayout = UICollectionViewFlowLayout()
        collectionView = UICollectionView(frame: CGRect(x: 0, y: 0, width: frame.width, height: frame.height), collectionViewLayout: collectionLayout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.register(MenuCollectionCell.self, forCellWithReuseIdentifier: "Cell")
        addEdgeConstrained(subview: collectionView)
    }
}

extension MenuBar: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(indexPath)
    }
}

extension MenuBar: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! MenuCollectionCell
        cell.thumbnailImage.image = UIImage(named: items[indexPath.row].image)
        cell.backgroundColor = .yellow
        return cell
    }
}

extension MenuBar: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: (frame.width - (CGFloat(items.count)-1)*interimSpace)/CGFloat(items.count), height: frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return interimSpace
    }
}

class MenuCollectionCell: UICollectionViewCell {
    var thumbnailImage: UIImageView!
    override init(frame: CGRect) {
        super.init(frame: frame)
        addViews()
    }
    
    func addViews() {
        thumbnailImage = UIImageView(frame: frame)
        addEdgeConstrained(subview: thumbnailImage)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}


extension UIView {
    func addEdgeConstrained(subview: UIView, insets: UIEdgeInsets = UIEdgeInsets.zero) {
        subview.translatesAutoresizingMaskIntoConstraints = false
        addSubview(subview)
        subview.topAnchor.constraint(equalTo: topAnchor, constant: insets.top).isActive = true
        subview.leftAnchor.constraint(equalTo: leftAnchor, constant: insets.left).isActive = true
        subview.bottomAnchor.constraint(equalTo: bottomAnchor, constant: -insets.bottom).isActive = true
        subview.rightAnchor.constraint(equalTo: rightAnchor, constant: -insets.right).isActive = true
    }
}
