//
//  MoreViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit

class MoreViewController: UIViewController {

    let moreLabel: UILabel = {
        let label = UILabel()
        label.text = "More"
        label.frame = CGRect(x: 100, y: 100, width: 100, height: 50)
        return label
    }()


    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        view.addSubview(moreLabel)
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
