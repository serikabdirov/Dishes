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
    var results: [Result]
}

struct Result: Codable {
    var id: Int
    var name: String
    var imageURL: URL?
    var price: Int
    var weight: String
    
    enum CodingKeys: String, CodingKey {
        case id
        case name
        case imageURL = "image"
        case price
        case weight
    }
}

func request () -> Observable<[Result]> {
        return Observable<[Result]>.create { observer in
            let request = AF.request("https://m-order2.spider.ru/api/dishes/?limit=100&offset=240").responseDecodable(of: DishesList.self) { response in
                switch response.result {
                case .success(let value):
                    observer.onNext(value.results)
                    observer.onCompleted()
                case .failure(let error):
                    observer.onError(error)
                }
            }
            return Disposables.create {
                request.cancel()
            }
        }
    }

func fetchData(complitionHandler: @escaping ([Result]) -> Void) {
    AF.request("https://m-order2.spider.ru/api/dishes").responseDecodable(of: DishesList.self) { response in
        guard let data = response.value else { return }
        complitionHandler(data.results)
    }
}
