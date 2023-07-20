//
//  ViewController.swift
//  SpartaCodingCalculator
//
//  Created by t2023-m0056 on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    var sum = 0
    var firstNum = 0
    var secondNum = 0
//    var sum = 0

    @IBOutlet weak var display: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func numBtn(_ sender: UIButton) {
        let num = sender.currentTitle!
        print(display.text!)
        if display.text == "0" {
            display.text! = num            
        } else {
            display.text! += num
        }

    }
    
    @IBAction func divideBtn(_ sender: UIButton) {
        firstNum += Int(display.text!)!
        display.text = "0"
    }

    @IBAction func multiplyBtn(_ sender: UIButton) {
        firstNum += Int(display.text!)!
        display.text = "0"
    }

    @IBAction func subtractBtn(_ sender: UIButton) {
        firstNum += Int(display.text!)!
        display.text = "0"
    }

    @IBAction func addBtn(_ sender: UIButton) {
        // add
//        firstNum += Int(display.text)
        display.text = "0"
    }

    @IBAction func remainBtn(_ sender: UIButton) {
        firstNum += Int(display.text!)!
        display.text = "0"
    }

    @IBAction func resultBtn(_ sender: UIButton) {
        display.text = "0"
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        display.text = "0"
        firstNum = 0
        secondNum = 0
        sum = 0
    }
}

