//
//  CompleteViewController.swift
//  TodoList+URLsession
//
//  Created by t2023-m0056 on 2023/08/23.
//

import UIKit

class CompleteViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    var completeList = DataManager.dataManager.dataList.filter{ $0.isCompleted == true }

    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.delegate = self
        tableView.dataSource = self
    }
}

extension CompleteViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setTodo(completeList[indexPath.row])
        return cell
    }
}
