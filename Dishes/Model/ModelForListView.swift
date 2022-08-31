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

struct ModelForListView {
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

    struct DishesList: Codable {
        var dishesInfo: [DishesInfo]
        enum CodingKeys: String, CodingKey {
            case dishesInfo = "results"
        }
    }
}
