//
//  MainTabBarController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit

class MainTabBarController: UITabBarController {

    override func viewDidLoad() {
        super.viewDidLoad()
        tabBar.backgroundColor = .black
        tabBar.layer.cornerRadius = 15
        tabBar.tintColor = UIColor(red: 170/256, green: 205/256, blue: 95/256, alpha: 1)
        setupTapBar()
    }
    
    func setupTapBar() {
        let vc1 = createNavController(vc: DishesListViewController(), imageName: "dishes")
        let vc2 = createNavController(vc: SearchViewController(), imageName: "search")
        let vc3 = createNavController(vc: ShoppingCartViewController(), imageName: "shopping.cart")
        let vc4 = createNavController(vc: ProfileViewController(), imageName: "profile")
        let vc5 = createNavController(vc: MoreViewController(), imageName: "more")

        viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
    
    func createNavController(vc: UIViewController, imageName: String, itemName: String = "") -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(named: imageName), tag: 0)

        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }

}
