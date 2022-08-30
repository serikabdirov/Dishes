//
//  ViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import RxCocoa
import RxSwift

class DishesListViewController<ViewModel: ViewModelType>: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {
    private var collectionView: UICollectionView!
    private var viewModel: ViewModel!
    
    private var data: BehaviorRelay<[ModelForListView.DishesInfo]>!
    
    init(viewModel: ViewModel) {
        self.viewModel = viewModel
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func loadView() {
        super.loadView()
        let view = DishesListView()
        self.view = view
        self.data = viewModel.getData()
        collectionView = view.dishesCollectionView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViews()
    }
    
    private func configureViews() {
        collectionView.register(DishesListCell.self, forCellWithReuseIdentifier: DishesListCell.cellIdentifier)
        collectionView.delegate = self
        collectionView.dataSource = self
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        data.value.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: DishesListCell.cellIdentifier, for: indexPath) as! DishesListCell
        cell.setupCell(dishId: data.value[indexPath.row].id, dishName: data.value[indexPath.row].name, dishPrice: data.value[indexPath.row].price, imageURL: data.value[indexPath.row].imageURL)
        return cell
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

