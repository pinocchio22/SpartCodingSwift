//
//  main.swift
//  hotelReservation
//
//  Created by t2023-m0056 on 2023/07/20.
//

import Foundation

var guide = """
------------------------------\n
* 호텔 예약 관리 프로그램입니다 *
1. 랜덤 금액 지급
2. 호텔 객실 정보 보기
3. 호텔 객실 예약하기
4. 나의 예약 목록 보기
5. 나의 예약 목록 체크인 날짜 순으로 보기
6. 예약 삭제하기
7. 예약 수정하기
8. 나의 입출급 내역 출력하기
9. 나의 잔액 보기
0. 프로그램 종료하기
------------------------------

원하시는 기능의 번호를 입력해 주세요
"""

// account 초기화
var account = 0

// 랜덤 배열 생성
var numarr: Array<Int> = []
for i in stride(from: 100000, to: 500001, by: 10000) {
    numarr += [i]
}

while true {
    print(guide)
    switch readLine() {
        case "1":
            provideMoney()
        case "2":
            showRoom()
        case "3":
            print(3)
        case "4":
            print(4)
        case "5":
            print(5)
        case "6":
            print(6)
        case "7":
            print(7)
        case "8":
            print(8)
        case "9":
            print(9)
        default:
            print("실패")
    }
}


// 1
func provideMoney() {
    account += numarr.randomElement() ?? 0
    print("계좌잔액은 \(account)입니다.")
}

// 2
func showRoom() {
    for i in 1...5 {
        print("\(i)번방 1박 \(i)0000원 ")
    }
}

// 3

// 4

// 5

// 6

// 7

// 8

// 9
