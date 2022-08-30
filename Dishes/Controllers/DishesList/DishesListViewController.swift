//
//  ViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import RxCocoa
import RxSwift

class DishesListViewController: UIViewController {
    
    private let disposeBag = DisposeBag()
    
    private var dataVariable = PublishSubject<DishesInfo>()
    
    private var dishesListView: DishesListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dishesListView = DishesListView()

        dishesListView.dishesCollectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        dishesListView.dishesCollectionView.delegate = self

        let data = DataManager.request()

        data.asObservable().bind(to: dishesListView.dishesCollectionView.rx.items) { (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
            cell.setupCell(dishId: element.id, dishName: element.name, dishPrice: element.price, imageURL: element.imageURL)
            return cell
        }.disposed(by: disposeBag)

        dishesListView.dishesCollectionView.rx
            .modelSelected(DishesInfo.self)
            .subscribe(onNext: { event in
                let infoVC = InfoViewController()
                infoVC.id = event.id
                self.present(infoVC, animated: true)
            })
            .disposed(by: disposeBag)

        self.view = dishesListView
    }
}

extension DishesListViewController: UICollectionViewDelegate {

}
