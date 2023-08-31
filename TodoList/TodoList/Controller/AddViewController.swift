//
//  AddViewController.swift
//  TodoList+URLsession
//
//  Created by t2023-m0056 on 2023/08/23.
//

import UIKit

class AddViewController: UIViewController {
    
    var categorySection = Set(DataManager.dataManager.dataList.map{ $0.category })
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        tableView.sectionHeaderTopPadding = 3
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        tableView.reloadData()
    }
    
    @IBAction func addBtn(_ sender: UIBarButtonItem) {
        setAddbtn()
    }
    
    func setAddbtn() {
        let alert = UIAlertController(title: "완료 목록", message: "완료 하셨습니까?", preferredStyle: .alert)
        let sucess = UIAlertAction(title: "확인", style: .default){ ok in
            print("확인 버튼이 눌렸습니다.")
            DataManager.dataManager.createTodo(TodoData(title: alert.textFields?.first?.text ?? "",category: alert.textFields?.last?.text ?? "defaluts" , isCompleted: false, id: UUID().uuidString))
            self.tableView.reloadData()
        }
        let cancel = UIAlertAction(title: "취소", style: .destructive){ cancel in
            print("취소 버튼이 눌렸습니다.")
        }
        alert.addTextField { textField in
            textField.placeholder = "할 일을 입력하세요"
        }
        alert.addTextField { textField in
            textField.placeholder = "카테고리를 입력하세요"
        }
        alert.addAction(sucess)
        alert.addAction(cancel)
        present(alert, animated: true)
    }
    
}

extension AddViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        let data = Array(categorySection).sorted()[section]
        return DataManager.dataManager.dataList.filter{ $0.category == data }.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        let data = Array(categorySection).sorted()[indexPath.section]
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as! TableViewCell
        cell.setTodo(DataManager.dataManager.dataList.filter{ $0.category == data }[indexPath.row])
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        guard let detailViewController = self.storyboard?.instantiateViewController(identifier: "DetailViewController") as? DetailViewController else { return }
        detailViewController.todoData = DataManager.dataManager.dataList.filter{ $0.category == Array(categorySection).sorted()[indexPath.section] }[indexPath.row]
        navigationController?.pushViewController(detailViewController, animated: true)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return categorySection.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return String(Array(categorySection).sorted()[section])
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 30
    }
}
