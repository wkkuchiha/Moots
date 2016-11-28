//
//  ViewController.swift
//  UICollectionViewDemo
//
//  Created by 伯驹 黄 on 2016/11/28.
//  Copyright © 2016年 伯驹 黄. All rights reserved.
//

import UIKit

class DebugGapController: UIViewController {
    
    private lazy var collectionView: UICollectionView = {
        var rect = self.view.frame
        
        let layout = UICollectionViewFlowLayout()
        layout.itemSize = CGSize(width: layout.fixSlit(rect: &rect, colCount: 2, space: 0.5), height: 88)
        layout.minimumLineSpacing = 0.5
        layout.minimumInteritemSpacing = 0.5
        
        
        let collectionView = UICollectionView(frame: rect, collectionViewLayout: layout)
        collectionView.delegate = self
        collectionView.dataSource = self
        collectionView.backgroundColor = .white
        return collectionView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.blue
        
        collectionView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        view.addSubview(collectionView)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}

extension DebugGapController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 50
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        return collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath)
    }
}

extension DebugGapController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, willDisplay cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        cell.backgroundColor = UIColor(white: CGFloat(indexPath.row) / 10, alpha: 1)
    }
}

