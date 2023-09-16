//
//  TodoViewController.swift
//  CoreDataMemoApp
//
//  Created by 박성원 on 2023/09/16.
//

import UIKit

final class TodoViewController: UIViewController {
    
    var dummmy: [String] = ["asd", "asd1", "asd2", "asd3", "asd4", "asd5"]
    
    // MARK: - properties
    
    private let tableView: UITableView = {
        let tbView = UITableView()
        tbView.translatesAutoresizingMaskIntoConstraints = false
        return tbView
    }()
    
    
    // MARK: - view lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        viewMakeUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    
}

// MARK: - UITableViewDataSource, UITableViewDelegate

extension TodoViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        
        return dummmy.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        
        
        return UITableViewCell()
    }
}


extension TodoViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        
    }
}



// MARK: - viewSetting

private extension TodoViewController {
    
    
    func viewMakeUI() {
        view.backgroundColor = UIColors.clear
        naviBarSetting()
        tableViewSetting()
        tableViewMakeUI()
    }
    
    
    func tableViewSetting() {
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableViewMakeUI() {
        view.addSubview(tableView)
        
        NSLayoutConstraint.activate([
            tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 0),
            tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 0),
            tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 0),
            tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: 0)
        ])
    }
    
    func naviBarSetting() {
        self.title = "Todo"
        let appearance = UINavigationBarAppearance()
        appearance.backgroundColor = UIColors.white
        appearance.shadowColor = .none
        navigationController?.navigationBar.tintColor = UIColors.orange
        navigationController?.navigationBar.standardAppearance = appearance
        navigationController?.navigationBar.compactAppearance = appearance
        navigationController?.navigationBar.scrollEdgeAppearance = appearance
        
        //한글 버튼 넣을 시
        let plusButton = UIBarButtonItem(title: "추가", style: .done, target: self, action: #selector(plusButtonTapped))
        navigationItem.rightBarButtonItem = plusButton
        
    }
}

// MARK: - @objc func

private extension TodoViewController {
    
    @objc func plusButtonTapped() {
        
    }
    
}
