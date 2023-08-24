//
//  TableViewCell.swift
//  TodoList+URLsession
//
//  Created by t2023-m0056 on 2023/08/23.
//

import UIKit

class TableViewCell: UITableViewCell {

    @IBOutlet weak var switchBtn: UISwitch!
    @IBOutlet weak var tvLabel: UILabel!
    
    var todo: TodoData?
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)
    }
    
    @IBAction func switchBtnChange(_ sender: Any) {
        guard let todo else { return }
        if switchBtn.isOn {
            tvLabel?.text = nil
            tvLabel?.attributedText = todo.title.strikeThrough()
            DataManager.dataManager.completeTodo(todo.id)
        } else {
            tvLabel?.attributedText = nil
            tvLabel?.text = todo.title
            DataManager.dataManager.completeTodo(todo.id)
        }
    }
    
    func setTodo(_ _todo: TodoData) {
        todo = _todo
        guard let todo else { return }
        if todo.isCompleted {
            tvLabel?.text = nil
            tvLabel?.attributedText = todo.title.strikeThrough()
        } else {
            tvLabel?.attributedText = nil
            tvLabel?.text = todo.title
        }
        switchBtn.isOn = todo.isCompleted
    }
    
}

extension String {
    func strikeThrough() -> NSAttributedString {
        let attributeString: NSMutableAttributedString = NSMutableAttributedString(string: self)
        attributeString.addAttribute(NSAttributedString.Key.strikethroughStyle, value: NSUnderlineStyle.single.rawValue, range: NSMakeRange(0, attributeString.length))
        return attributeString
    }
}
