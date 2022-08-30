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
    
    private var model: ModelForListView!
    
    private var disposeBag = DisposeBag()
    
    private var dataVariable = BehaviorRelay<[ModelForListView.DishesInfo]>(value: [])
    private var errorVariable = PublishRelay<Swift.Error>()
    
    init() {
        self.model = ModelForListView()
        fetchData()
    }
    
    private func fetchData() {
        ModelForListView.request()
            .subscribe { [weak self] event in
                switch event {
                case .success(let items):
                    self?.dataVariable.accept(items)
                case .failure(let error):
                    self?.errorVariable.accept(error)
                }
            }
            .disposed(by: disposeBag)
    }
    
    func getData() -> BehaviorRelay<[ModelForListView.DishesInfo]> {
        return dataVariable
    }
    
    func transform(input: Input) -> Output {
        return Output()
    }
    
    struct Input {
    }
    
    struct Output {
        
    }
    

}
