//
//  DishesListCell.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit

class DishesListCell: UICollectionViewCell {
    
    static let cellIdentifier = "disheCell"
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var weightLabel: UILabel!
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = UIColor(red: 225/255, green: 215/255, blue: 200/255, alpha: 1)
        layer.cornerRadius = 3
        
        configViews()
        setConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError()
    }
    
    private func configViews() {
        imageView = {
            let image = UIImage(named: "dishes")
            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFill
            return imageView
        }()
        
        nameLabel = {
            let label = UILabel()
            label.text = "Name"
            return label
        }()
        
        priceLabel = {
            let label = UILabel()
            label.text = "Price"
            return label
        }()
        
        weightLabel = {
            let label = UILabel()
            label.text = "Weight"
            return label
        }()
        
        contentView.addSubview(imageView)
        contentView.addSubview(nameLabel)
        contentView.addSubview(priceLabel)
        contentView.addSubview(weightLabel)

    }
    
    private func setConstraints() {
        imageView.snp.makeConstraints { make in
            make.top.equalTo(14)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
        }
        
        nameLabel.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(11)
            make.leading.equalTo(7)
            make.trailing.equalTo(-7)
        }
        
        priceLabel.snp.makeConstraints { make in
            make.top.equalTo(nameLabel.snp.bottom).offset(8)
            make.leading.equalTo(7)
            make.trailing.equalTo(-73)
            make.bottom.equalTo(-18)
        }
    }
    
    func setupCell(dishName: String, dishPrice: Int) {
        nameLabel.text = dishName
        priceLabel.text = "\(dishPrice)"
    }
}
