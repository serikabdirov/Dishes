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

    private var numbersOfItemsInLandscape: CGFloat!

    override func layoutSubviews() {
        super.layoutSubviews()
        guard let layout = dishesCollectionView.collectionViewLayout as? UICollectionViewFlowLayout else {
            return
        }
        switch traitCollection.horizontalSizeClass {
        case .unspecified:
            break
        case .compact:
            numbersOfItemsInLandscape = 3
        case .regular:
            numbersOfItemsInLandscape = 4
        @unknown default:
            break
        }

        if UIDevice.current.orientation.isPortrait {
            layout.sectionInset = UIEdgeInsets(top: 0, left: 15, bottom: 20, right: 15)
            layout.itemSize = CGSize(
                width: (dishesCollectionView.bounds.width - 45) / 2,
                height: (dishesCollectionView.bounds.height - 30) / 3
            )
        } else {
            layout.sectionInset = UIEdgeInsets(top: 0, left: 40, bottom: 20, right: 40)
            layout.itemSize = CGSize(
                width: (dishesCollectionView.bounds.width - 125) / numbersOfItemsInLandscape,
                height: (dishesCollectionView.bounds.height - 15) / 1.5
            )
        }
        layout.invalidateLayout()
    }

    override init(frame: CGRect) {
        super.init(frame: frame)
        
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
