//
//  ModelType.swift
//  Dishes
//
//  Created by Серик Абдиров on 30.08.2022.
//

import Foundation
import RxCocoa
import RxSwift

protocol ModelType {
    associatedtype DishesInfo
    
    static func request() -> Single<[DishesInfo]>
    
}

