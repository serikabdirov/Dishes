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
        tabBar.unselectedItemTintColor = UIColor(red: 225/255, green: 215/255, blue: 200/255, alpha: 1)
        tabBar.tintColor = UIColor(red: 170/255, green: 205/255, blue: 95/255, alpha: 1)
        setupTapBar()
    }
    
    func setupTapBar() {
        let vc1 = createNavController(vc: DishesListViewController(viewModel: DishesListViewModel()), imageName: "dishes", itemName: "Блюда")
        let vc2 = createNavController(vc: SearchViewController(), imageName: "search", itemName: "Поиск")
        let vc3 = createNavController(vc: ShoppingCartViewController(), imageName: "shopping.cart", itemName: "Корзина")
        let vc4 = createNavController(vc: ProfileViewController(), imageName: "profile", itemName: "Профиль")
        let vc5 = createNavController(vc: MoreViewController(), imageName: "more", itemName: "Ещё")

        viewControllers = [vc1, vc2, vc3, vc4, vc5]
    }
    
    func createNavController(vc: UIViewController, imageName: String, itemName: String = "") -> UINavigationController {
        let item = UITabBarItem(title: itemName, image: UIImage(named: imageName), tag: 0)

        let navController = UINavigationController(rootViewController: vc)
        navController.tabBarItem = item
        return navController
    }

}
