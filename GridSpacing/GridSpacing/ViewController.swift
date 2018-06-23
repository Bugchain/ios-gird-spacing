//
//  ViewController.swift
//  GridSpacing
//
//  Created by Chain Chaiyaphat on 23/6/2561 BE.
//  Copyright © 2561 Chain Chaiyaphat. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate,UICollectionViewDelegateFlowLayout {

    @IBOutlet weak var collectionView: UICollectionView!
    
    var esitmatedWidth = 100.0
    var cellMarginSize = 10.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib(nibName: "ItemCell", bundle: nil), forCellWithReuseIdentifier: "ItemCell")
        
        collectionView.dataSource = self
        collectionView.delegate = self
        
        self.setupGridView()
        
    }

    override func viewDidLayoutSubviews() {
        setupGridView()
        DispatchQueue.main.async {
            self.collectionView.reloadData()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 30
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ItemCell", for: indexPath) as! ItemCell
        cell.setData(text: "Title \(indexPath.row+1)")
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let width = calculateCellWidth()
        
        return CGSize(width: width, height: width)
    }
    
    
    func setupGridView(){
        let flow = collectionView.collectionViewLayout as! UICollectionViewFlowLayout
        flow.minimumLineSpacing = CGFloat(cellMarginSize)
        flow.minimumInteritemSpacing = CGFloat(cellMarginSize)
    }
    
    func calculateCellWidth()-> CGFloat{
        let estimateWidth = CGFloat(esitmatedWidth)
        let cellCount = floor(CGFloat(self.view.frame.size.width / estimateWidth))
        
        let margin = CGFloat(cellMarginSize * 2)
        let width = (self.view.frame.size.width - CGFloat(cellMarginSize) * (cellCount - 1) - margin) / cellCount
        return width
    
    }

}

