//
//  InfoViewController.swift
//  Dishes
//
//  Created by Серик Абдиров on 26.08.2022.
//

import UIKit
import RxSwift
import Nuke

class InfoViewController: UIViewController {
    private var nameLabel = UILabel()
    private var descriptionLabel = UILabel()
    private var imageView = UIImageView()
    private var stack = UIStackView()

    private var imageURL = PublishSubject<URL?>()

    private let disposeBag = DisposeBag()

    var id: Int!

    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        let data = DataManager.request(id: id)

        data.asObservable()
            .map { $0.name }
            .bind(to: nameLabel.rx.text)
            .disposed(by: disposeBag)

        data.asObservable()
            .map { $0.description }
            .bind(to: descriptionLabel.rx.text)
            .disposed(by: disposeBag)
        
        data.asObservable()
            .map { $0.imageURL }
            .bind(to: imageURL)
            .disposed(by: disposeBag)

        setConstraint()
    }

    private func setConstraint() {
        view.addSubview(stack)
        stack.axis = .vertical

        stack.addArrangedSubview(nameLabel)
        nameLabel.numberOfLines = 0
        stack.addArrangedSubview(descriptionLabel)
        descriptionLabel.numberOfLines = 0
        stack.addArrangedSubview(imageView)

        let contentModes = ImageLoadingOptions.ContentModes(success: .scaleAspectFill, failure: .scaleAspectFill, placeholder: .scaleAspectFill)

        let options = ImageLoadingOptions(
          placeholder: UIImage(systemName: "multiply"),
          transition: .fadeIn(duration: 0.5),
          contentModes: contentModes
        )

        imageURL.subscribe(onNext: { image in
            Nuke.loadImage(with: image, options: options, into: self.imageView)
        })
        .disposed(by: disposeBag)

        stack.snp.makeConstraints { make in
            make.edges.equalToSuperview()
        }
    }


}
