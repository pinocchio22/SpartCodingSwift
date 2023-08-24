//
//  DetailViewController.swift
//  TodoList+URLsession
//
//  Created by t2023-m0056 on 2023/08/23.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    var todoData: TodoData?


    
    override func viewDidLoad() {
        super.viewDidLoad()
        titleLabel.text = todoData?.title
    }
}
