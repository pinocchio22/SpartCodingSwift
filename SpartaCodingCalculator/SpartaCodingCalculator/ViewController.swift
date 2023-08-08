//
//  ViewController.swift
//  SpartaCodingCalculator
//
//  Created by t2023-m0056 on 2023/07/19.
//

import UIKit

class ViewController: UIViewController {
    
    var numArr = [String]()
    var result = ""
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
        numArr.append(display.text ?? "")
        numArr.append("/")
        display.text = "0"
        print(numArr)
    }

    @IBAction func multiplyBtn(_ sender: UIButton) {
        numArr.append(display.text ?? "")
        numArr.append("*")
        display.text = ""
        print(numArr)
    }

    @IBAction func subtractBtn(_ sender: UIButton) {
        numArr.append(display.text ?? "")
        numArr.append("-")
        display.text = ""
        print(numArr)
    }

    @IBAction func addBtn(_ sender: UIButton) {
        numArr.append(display.text ?? "")
        numArr.append("+")
        display.text = ""
        print(numArr)
    }

    @IBAction func remainBtn(_ sender: UIButton) {
        numArr.append(display.text ?? "")
        numArr.append("%")
        display.text = ""
        print(numArr)
    }

    @IBAction func resultBtn(_ sender: UIButton) {
        display.text = result
        numArr = []
        print(numArr)
    }
    
    @IBAction func deleteBtn(_ sender: UIButton) {
        numArr.append(display.text ?? "")
        result = ""
        numArr = []
        display.text = "0"
    }
    // 반복문을 돌면서 곱하기 나누기만 선별
    // 배열을 세개로
    ["3","-","5"]
    ["-2"]
    ["2","-"]
    ["1","-","10"]
    func priorityNum(_ numArr: Array<String>) -> Array<String> {
        var newArr = [String]()
        for i in 0...numArr.count-1 {
            switch numArr[i] {
            case "*":
                newArr[i] = Int(numArr[i-1] ?? 0) * Int(numArr[i+1] ?? 0)
                newArr.remove(at: i-1)
                numArr.remove(at: i+1)
            case "/":
                Int(numArr[i-1] ?? 0) / Int(numArr[i+1] ?? 0)
                newArr.remove(at: i-1)
                numArr.remove(at: i+1)
//            case "+": {
//                Int(numArr[i-1] ?? 0) + Int(numArr[i+1] ?? 0)
//                newArr.remove(at: i-1)
//                numArr.remove(at: i+1)
//            }
//            case "-": {
//                Int(numArr[i-1] ?? 0) - Int(numArr[i+1] ?? 0)
//                newArr.remove(at: i-1)
//                numArr.remove(at: i+1)
//            }
//            case "%": {
//                Int(numArr[i-1] ?? 0) % Int(numArr[i+1] ?? 0)
//                newArr.remove(at: i-1)
//                numArr.remove(at: i+1)
//            }
            default:
                newArr.append(numArr[i])
            }
        }
    }
}

