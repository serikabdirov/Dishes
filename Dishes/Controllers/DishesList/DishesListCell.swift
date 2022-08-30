//
//  DishesListCell.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import Nuke
import RxSwift

class DishesListCell: UICollectionViewCell {
    let disposeBag = DisposeBag()
    
    static let cellIdentifier = "disheCell"

    private var stackView: UIStackView!

    private var id: Int!
    
    var imageView: UIImageView!
    var nameLabel: UILabel!
    var priceLabel: UILabel!
    var weightLabel: UILabel!
    
    var button: UIButton!
    
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
            label.font = .systemFont(ofSize: 14)
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
        
        button = {
            let button = UIButton()
            var tapCount = 0
            button.setTitle("+", for: .normal)
            button.setTitleColor(.black, for: .normal)
            button.titleLabel?.font = .systemFont(ofSize: 25)
            button.layer.cornerRadius = 15
            button.clipsToBounds = true
            button.backgroundColor = .white
            button.rx.tap.subscribe(onNext: {
                tapCount += 1
                button.setTitle("\(tapCount)", for: .normal)
                print(button.tag)
            }).disposed(by: disposeBag)
            return button
        }()
        
        contentView.addSubview(imageView)
        contentView.addSubview(stackView)
        contentView.addSubview(button)

        stackView.addArrangedSubview(nameLabel)
        stackView.addArrangedSubview(priceLabel)
    }
    
    private func setConstraints() {

        imageView.snp.makeConstraints { make in
            make.top.equalTo(14)
            make.leading.equalTo(22)
            make.trailing.equalTo(-22)
            make.height.equalTo(imageView.snp.width)
        }
        
        button.snp.makeConstraints { make in
            make.trailing.bottom.equalTo(-10)
            make.size.equalTo(34)
        }

        stackView.snp.makeConstraints { make in
            make.top.equalTo(imageView.snp.bottom).offset(10)
            make.leading.equalTo(10)
            make.trailing.equalTo(-10)
            make.bottom.equalTo(-18)
        }
    }
    
    func setupCell(dishId: Int, dishName: String, dishPrice: Int, imageURL : URL?) {
        nameLabel.text = dishName
        priceLabel.text = "\(dishPrice)₽"
        button.tag = dishId

        let contentModes = ImageLoadingOptions.ContentModes(success: .scaleAspectFill, failure: .scaleAspectFill, placeholder: .scaleAspectFill)

        let options = ImageLoadingOptions(
          placeholder: UIImage(systemName: "multiply"),
          transition: .fadeIn(duration: 0.5),
          contentModes: contentModes
        )

        Nuke.loadImage(with: imageURL, options: options, into: imageView)
    }
}
