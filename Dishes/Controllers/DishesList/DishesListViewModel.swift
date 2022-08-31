//
//  DishesListViewModel.swift
//  Dishes
//
//  Created by Серик Абдиров on 30.08.2022.
//

import UIKit
import RxSwift
import RxCocoa

class DishesListViewModel: ViewModelType {

    init() {
        fetchData()
    }

    var model = ModelForListView()
    var dataVariable = BehaviorRelay<[ModelForListView.DishesInfo]>(value: [])
    var errorVariable = PublishRelay<Swift.Error>()
    
    private func fetchData() {
        DishesGetService
            .request()
            .subscribe(onSuccess: { [weak self] items in
                self?.dataVariable.accept(items)
            }, onFailure: { [weak self] error in
                self?.errorVariable.accept(error)
            })
    }

    func getData() -> BehaviorRelay<[ModelForListView.DishesInfo]> {
        return dataVariable
    }
}
