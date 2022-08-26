//
//  DishesListView.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import SnapKit

class DishesListView: UIView {
    
    var dishesCollectionView: UICollectionView!
    private var screenSize: CGRect!
    private var screenWidth: CGFloat!
    private var screenHeight: CGFloat!

    override init(frame: CGRect) {
        super.init(frame: frame)
        
        screenSize = UIScreen.main.bounds
        screenWidth = screenSize.width
        screenHeight = screenSize.height
        
        backgroundColor = .white
        configViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configViews() {
        dishesCollectionView = {
            let layout = UICollectionViewFlowLayout()
            layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 20, right: 15)
            layout.itemSize = CGSize(width: (screenWidth - 45)/2, height: (screenHeight - 30)/3)
            layout.minimumLineSpacing = 15
            layout.minimumInteritemSpacing = 15
            
            let collectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: layout)
            collectionView.backgroundColor = .clear
            collectionView.alwaysBounceVertical = true
            collectionView.showsVerticalScrollIndicator = false
            return collectionView
        }()
        
        addSubview(dishesCollectionView)
    }
    
    private func setConstraints() {
        dishesCollectionView.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }

}
