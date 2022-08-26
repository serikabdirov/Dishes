//
//  ViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit

class DishesListViewController: UIViewController {
    
    private var dishesListView: DishesListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dishesListView = DishesListView()
        
        dishesListView.dishesCollectionView.dataSource = self
        dishesListView.dishesCollectionView.delegate = self
        dishesListView.dishesCollectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        
        self.view = dishesListView
    }
}

extension DishesListViewController: UICollectionViewDelegateFlowLayout {
    
}

extension DishesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        20
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
        
        return cell
    }
    
    
}
