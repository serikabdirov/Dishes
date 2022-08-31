//
//  ViewModelType.swift
//  Dishes
//
//  Created by Серик Абдиров on 30.08.2022.
//

import Foundation
import RxSwift
import RxCocoa

protocol ViewModelType {
    func getData() -> BehaviorRelay<[ModelForListView.DishesInfo]>
}
