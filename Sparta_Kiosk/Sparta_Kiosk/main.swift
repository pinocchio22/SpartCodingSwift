//
//  main.swift
//  Sparta_Kiosk
//
//  Created by t2023-m0056 on 2023/07/24.
//

import Foundation

struct Burger {
    let name: String
    let price: Double
    let discription: String
    
    init(name: String, price: Double, discription: String) {
        self.name = name
        self.price = price
        self.discription = discription
    }
    
    func displayInfo() {
        print("\(name) | W \(price) | \(discription)")
    }
}

struct Drink {
    let name: String
    let price: Double
    let discription: String
    
    init(name: String, price: Double, discription: String) {
        self.name = name
        self.price = price
        self.discription = discription
    }
    
    func displayInfo() {
        print("\(name) | W \(price) | \(discription)")
    }
}

var intro = """
"SHAKESHACK BURGER 에 오신걸 환영합니다."
아래 메뉴판을 보시고 메뉴를 골라 입력해주세요.

[ SHAKESHACK MENU ]
1. Burgers         | 앵거스 비프 통살을 다져만든 버거
2. Frozen Custard  | 매장에서 신선하게 만드는 아이스크림
3. Drinks          | 매장에서 직접 만드는 음료
4. Beer            | 뉴욕 브루클린 브루어리에서 양조한 맥주
0. 종료             | 프로그램 종료
"""

// burger
var shackBurger = Burger(name: "ShackBurger", price: 6.9, discription: "토마토, 양상추, 쉑소스가 토핑된 치즈버거")

// drink
var coke = Drink(name: "Coca-Cola", price: 2.5, discription: "코카콜라")

// menu
while true {
    print(intro)
    switch readLine() {
    case "1":
        showBurger()
    case "2":
        print("Frozen Custard")
    case "3":
        showDrink()
    case "4":
        print("Bear")
    case "5":
        exit(0)
    default:
        print("default")
    }

}

// show buger menu
func showBurger() {
    shackBurger.displayInfo()
}

// show drink menu
func showDrink() {
    coke.displayInfo()
}
