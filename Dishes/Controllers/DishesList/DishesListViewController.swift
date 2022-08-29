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
    
    private var dishesListView: DishesListView!

    override func viewDidLoad() {
        super.viewDidLoad()
        dishesListView = DishesListView()

        dishesListView.dishesCollectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        dishesListView.dishesCollectionView.delegate = self

//        let data = DataManager.request()
        let data = Observable<[DishesInfo]>.just(
                    (1 ... 10).map {
                        DishesInfo(
                            id: $0,
                            name: "Name \($0)",
                            imageURL: URL(string: "https://picsum.photos/id/\($0)/200")!,
                            price: 200,
                            weight: "300"
                        )
                    }
        )

        let _ = data.bind(to: dishesListView.dishesCollectionView.rx.items) { (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
            cell.setupCell(dishName: element.name, dishPrice: element.price, imageURL: element.imageURL)
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

extension DishesListViewController: UICollectionViewDelegateFlowLayout {
//    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
//        CGSize(width: (dishesListView.dishesCollectionView.bounds.width - 45) / 2, height: (dishesListView.dishesCollectionView.bounds.height - 30) / 3)
//    }
}
