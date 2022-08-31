//
//  ViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import RxCocoa
import RxSwift

class DishesListViewController: UIViewController, UICollectionViewDelegate {
    private var disposeBag = DisposeBag()
    private var collectionView: UICollectionView!
    private var activityIndicator: UIActivityIndicatorView!
    private var viewModel: DishesListViewModel!
    
    private var data = BehaviorRelay<[ModelForListView.DishesInfo]>(value: [])
    private var error = PublishRelay<Swift.Error>()
    
    init(viewModel: DishesListViewModel) {
        self.viewModel = viewModel
        self.data = viewModel.dataVariable
        self.error = viewModel.errorVariable
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let view = DishesListView()
        self.view = view
        collectionView = view.dishesCollectionView
        activityIndicator = view.loadingActivityIndicatorView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        configureViews()
    }
    
    private func configureViews() {
        collectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        collectionView.delegate = self

        data.map({
            $0.isEmpty
        }).bind(to: activityIndicator.rx.isHidden)

        data.bind(to: collectionView.rx.items) { (collectionView, row, element) in
            let indexPath = IndexPath(row: row, section: 0)
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
            cell.setupCell(dishId: element.id, dishName: element.name, dishPrice: element.price, imageURL: element.imageURL)
             return cell
        }.disposed(by: disposeBag)
    }

}







//
//        dataVariable.bind(to: collectionView.rx.items) { (collectionView, row, element) in
//            let indexPath = IndexPath(row: row, section: 0)
//            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
//            cell.setupCell(dishId: element.id, dishName: element.name, dishPrice: element.price, imageURL: element.imageURL)
//            return cell
//        }.disposed(by: disposeBag)
//
//        collectionView.rx
//            .modelSelected(DishesInfo.self)
//            .subscribe(onNext: { event in
//                let infoVC = InfoViewController()
//                infoVC.id = event.id
//                print(event.id)
//                self.present(infoVC, animated: true)
//            })
//            .disposed(by: disposeBag)

