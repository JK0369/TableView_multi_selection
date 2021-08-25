//
//  CheckboxCell.swift
//  StackViewEx
//
//  Created by 김종권 on 2021/08/25.
//

import UIKit

class CheckboxCell: BaseTableViewCell<String> {

    var isCheck: Bool = false {
        didSet {
            let imageName = isCheck ? "checkmark.square" : "checkmark.square.fill"
            checkBoxButton.setImage(UIImage(systemName: imageName), for: .normal)
        }
    }

    lazy var checkBoxButton: UIButton = {
        let button = UIButton()
        button.setImage(UIImage(systemName: "checkmark.square"), for: .normal)
        button.isUserInteractionEnabled = false
        
        return button
    }()

    lazy var titleLabel: UILabel = {
        let label = UILabel()

        return label
    }()

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
        isCheck.toggle()
    }

    override func bind(_ model: String) {
        super.bind(model)

        titleLabel.text = model
    }

    override func configure() {
        super.configure()

        backgroundColor = .white

        addSubviews()
        makeConstraints()
    }

    private func addSubviews() {
        contentView.addSubview(checkBoxButton)
        contentView.addSubview(titleLabel)
    }

    private func makeConstraints() {
        checkBoxButton.translatesAutoresizingMaskIntoConstraints = false
        titleLabel.translatesAutoresizingMaskIntoConstraints = false

        checkBoxButton.setContentHuggingPriority(.defaultHigh, for: .horizontal)
        checkBoxButton.leadingAnchor.constraint(equalTo: contentView.leadingAnchor, constant: 12).isActive = true
        checkBoxButton.centerYAnchor.constraint(equalTo: contentView.centerYAnchor).isActive = true

        titleLabel.leadingAnchor.constraint(equalTo: checkBoxButton.trailingAnchor, constant: 8).isActive = true
        titleLabel.trailingAnchor.constraint(greaterThanOrEqualTo: contentView.trailingAnchor, constant: -8).isActive = true
        titleLabel.centerYAnchor.constraint(equalTo: checkBoxButton.centerYAnchor).isActive = true
    }
}
