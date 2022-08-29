//
//  DishesListCell.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit

class DishesListCell: UICollectionViewCell {
    
    static let cellIdentifier = "disheCell"

    private var stackView: UIStackView!
    
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
        stackView = {
            let stackView = UIStackView()
            stackView.axis = .vertical
            stackView.distribution = .fillProportionally
            return stackView
        }()

        imageView = {
            let image = UIImage(named: "dishes")
            let imageView = UIImageView(image: image)
            imageView.clipsToBounds = true
            return imageView
        }()
        
        nameLabel = {
            let label = UILabel()
            label.text = "Name"
            label.numberOfLines = 0
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
        contentView.addSubview(stackView)
        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
//        contentView.addSubview(nameLabel)
//        contentView.addSubview(priceLabel)
//        contentView.addSubview(weightLabel)

    }
    
    private func setConstraints() {

        imageView.snp.makeConstraints { make in
            make.top.equalTo(7)
            make.leading.equalTo(7)
            make.trailing.equalTo(-7)
            make.height.equalToSuperview().multipliedBy(0.6)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(11)
            make.leading.equalTo(7)
            make.trailing.equalTo(-7)
            make.bottom.equalTo(-18)
        }
//
//        nameLabel.snp.makeConstraints { make in
//            make.top.equalTo(imageView.snp.bottom).offset(11)
//            make.leading.equalTo(7)
//            make.trailing.equalTo(-7)
//        }
//
//        priceLabel.snp.makeConstraints { make in
//            make.top.equalTo(nameLabel.snp.bottom).offset(8)
//            make.leading.equalTo(7)
//            make.trailing.equalTo(-73)
//            make.bottom.equalTo(-18)
//        }
    }
    
    func setupCell(dishName: String, dishPrice: Int) {
        nameLabel.text = dishName
        priceLabel.text = "\(dishPrice)"
    }
}
