//
//  DishesGetService.swift
//  Dishes
//
//  Created by Серик Абдиров on 31.08.2022.
//

import Foundation
import RxCocoa
import RxSwift
import Alamofire

struct DishesGetService {
    static func request() -> Single<[ModelForListView.DishesInfo]> {
        print("request")
        return Single<[ModelForListView.DishesInfo]>.create { single in
            let request = AF.request("https://m-order2.spider.ru/api/dishes/?limit=100&offset=300").responseDecodable(of: ModelForListView.DishesList.self) { response in
                switch response.result {
                case .success(let value):
                    single(.success(value.dishesInfo))
                case .failure(let error):
                    single(.failure(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }

//    static func request(id: Int) -> Single<DishesInfo> {
//        return Single<DishesInfo>.create { single in
//            let request = AF.request("https://m-order2.spider.ru/api/dishes/\(id)").responseDecodable(of: DishesInfo.self) { response in
//                switch response.result {
//                case .success(let value):
//                    single(.success(value))
//                case .failure(let error):
//                    single(.failure(error))
//                }
//            }
//            return Disposables.create {
//                request.cancel()
//            }
//        }
//    }
}
