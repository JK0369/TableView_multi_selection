//
//  ViewController.swift
//  StackViewEx
//
//  Created by 김종권 on 2021/08/25.
//

import UIKit

class ViewController: UIViewController {

    lazy var tableView: UITableView = {
        let view = UITableView()

        return view
    }()

    var dataSource: [String] = ["jake1", "jake iOS", "jake iOS 앱", "jake iOS 앱 개발", "jake iOS 앱 개발 알아가기"]

    override func viewDidLoad() {
        super.viewDidLoad()

        view.addSubview(tableView)
        tableView.register(CheckboxCell.self, forCellReuseIdentifier: "cell")
        tableView.delegate = self
        tableView.dataSource = self
        tableView.allowsMultipleSelection = true

        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 12).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -12).isActive = true
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 120).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -120).isActive = true
    }
}

extension ViewController: UITableViewDelegate, UITableViewDataSource {

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return dataSource.count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell") as? CheckboxCell else { fatalError(#function) }
        cell.model = dataSource[indexPath.row]
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 56
    }
}
