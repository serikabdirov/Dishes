//
//  ViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import Nuke

class DishesListViewController: UIViewController {
    
    private var data: [Result]?
    
    private var dishesListView: DishesListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dishesListView = DishesListView()
        
        fetchData { data in
            self.data = data
            self.dishesListView.dishesCollectionView.reloadData()
        }
        
        dishesListView.dishesCollectionView.dataSource = self
        dishesListView.dishesCollectionView.delegate = self
        dishesListView.dishesCollectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        
        self.view = dishesListView
    }
}

extension DishesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}

extension DishesListViewController: UICollectionViewDelegateFlowLayout {
    
}

extension DishesListViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
                
        let url = data?[indexPath.row].name
        
        let options = ImageLoadingOptions(
          placeholder: UIImage(named: "dishes"),
          transition: .fadeIn(duration: 0.5)
        )
        
        Nuke.loadImage(with: url, options: options, into: cell.imageView)
        
        cell.setupCell(dishName: data?[indexPath.row].name ?? "Name", dishPrice: data?[indexPath.row].price ?? 0)
        return cell
    }
    
    
}
