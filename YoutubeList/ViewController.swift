//
//  ViewController.swift
//  YoutubeList
//
//  Created by Iragam Reddy, Sreekanth Reddy on 4/22/19.
//  Copyright © 2019 Iragam Reddy, Sreekanth Reddy. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var headerView: MenuBar!
    @IBOutlet weak var collectionLayout: UICollectionViewFlowLayout!
    @IBOutlet weak var collectionView: UICollectionView!
    let items = ["home","videos","list","favoutire","bookmarks"]

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.contentInset = .zero
        // Do any additional setup after loading the view, typically from a nib.
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
    }
    
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        super.viewWillTransition(to: size, with: coordinator)
        configureCollectionViewLayout()
    }

    private func configureCollectionViewLayout() {
        // Set the item size with the view frame width and invalidate the payout to redraw
        collectionLayout.itemSize = CGSize(width: Int(view.frame.width), height: 200)
         collectionView.collectionViewLayout.invalidateLayout()
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
         print(indexPath)
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath)
        cell.backgroundColor = .red
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return items.count
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return  CGSize(width: collectionView.bounds.size.width, height: 200)
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
