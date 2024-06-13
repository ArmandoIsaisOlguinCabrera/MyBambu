//
//  MyBambyViewController.swift
//  MyBambu
//
//  Created by Armando Isais Olguin Cabrera  on 12/06/24.
//

import Foundation
import UIKit

class MyBambyViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.objects.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let object = viewModel.objects[indexPath.row]
        cell.textLabel?.text = object.title
        return cell
    }
    
    var viewModel = MyBambuViewModel()
    var tableView = UITableView()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setupUI()
        tableView.dataSource = self
        tableView.delegate = self
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        viewModel.fetchObjects {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
        
    }
    
    private func setupUI(){
        self.navigationItem.title = "Constants.titleHomeScreenNavigationTitle"
        self.view.backgroundColor = .systemBackground
        self.view.addSubview(tableView)
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            self.tableView.topAnchor.constraint(equalTo: self.view.topAnchor),
            self.tableView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor),
            self.tableView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor),
            self.tableView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor)
        ])
    }
    
    
}

