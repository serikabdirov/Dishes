//
//  Model.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import Alamofire
import RxSwift
import RxCocoa

struct DishesList: Codable {
    var dishesInfo: [DishesInfo]

    enum CodingKeys: String, CodingKey {
        case dishesInfo = "results"
    }
}

struct DishesInfo: Codable {
    var id: Int
    var name: String
    var imageURL: URL?
    var price: Int
    var weight: String
    var description: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image"
        case price
        case weight
        case description
    }
}

enum DataManager {

    static func request() -> Single<[DishesInfo]> {
        return Single<[DishesInfo]>.create { single in
            let request = AF.request("https://m-order2.spider.ru/api/dishes/?limit=100&offset=300").responseDecodable(of: DishesList.self) { response in
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

    static func request(id: Int) -> Single<DishesInfo> {
        return Single<DishesInfo>.create { single in
            let request = AF.request("https://m-order2.spider.ru/api/dishes/\(id)").responseDecodable(of: DishesInfo.self) { response in
                switch response.result {
                case .success(let value):
                    single(.success(value))
                case .failure(let error):
                    single(.failure(error))
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }
}


