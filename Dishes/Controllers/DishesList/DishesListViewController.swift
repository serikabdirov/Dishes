//
//  ViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import Nuke
import RxCocoa
import RxSwift

class DishesListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private var dishesListView: DishesListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dishesListView = DishesListView()
        
        dishesListView.dishesCollectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        
        let data = request()
        
        let _ = data.bind(to: dishesListView.dishesCollectionView.rx.items) { (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
            
            let url = element.imageURL
            let options = ImageLoadingOptions(
              placeholder: UIImage(systemName: "multiply"),
              transition: .fadeIn(duration: 0.5)
            )
            
            Nuke.loadImage(with: url, options: options, into: cell.imageView)
            cell.setupCell(dishName: element.name, dishPrice: element.price)
             return cell
            
        }.disposed(by: disposeBag)
        self.view = dishesListView
    }
}

extension DishesListViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let infoVC = InfoViewController()
        present(infoVC, animated: true)
    }
}
