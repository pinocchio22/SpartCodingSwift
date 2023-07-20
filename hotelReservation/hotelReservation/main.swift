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

// roomList [1: ["0720", "0722"]]
var roomDict: [Int: [String]] = [:]

while true {
    print(guide)
    switch readLine() {
        case "1":
            provideMoney()
        case "2":
            showRoom()
        case "3":
            reserveRoom()
        case "4":
            checkMyroom()
        case "5":
            checkSortedMyroom()
        case "6":
            print(6)
        case "7":
            print(7)
        case "8":
            print(8)
        case "9":
            print(9)
        case "0":
            exit(0)
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
func reserveRoom() {
    // 사용자 입력
    print("원하시는 호텔방 번호를 입력하세요")
    let roomNum = readLine()
    print("원하시는 체크인 날짜를 입력하세요")
    let checkIn = readLine()
    print("원하시는 체크아웃 날짜를 입력하세요")
    let checkOut = readLine()
    
    // 예약 가능 여부
    if roomNum == "" {
        print("방번호가 입력되지 않았습니다")
    } else if checkIn == "" || checkOut == "" {
        print("날짜가 입력되지 않았습니다")
    } else if account < Int(roomNum!)!*10000 {
        print("계좌에 돈이 부족합니다")
    } else {
        // 예약 성공
        if let roomNum = roomNum, let checkIn = checkIn, let checkOut = checkOut {
            roomDict.updateValue([checkIn,checkOut], forKey: Int(roomNum) ?? 00)
            account -= Int(roomNum)!
            print(roomDict)
        }
    }
}

// 4
func checkMyroom() {
    for i in 1...5 {
        if roomDict[i] != nil {
            print(roomDict[i]!)
        }
    }
}

//func showDict() {
//    for i in 1...5 {
//        if roomDict[i] != nil {
//            print(roomDict[i]!)
//        }
//    }
//}

// 5
func checkSortedMyroom() {
//    var sortedDict = roomDict.sorted {$0.value[0] < $1.value[0]}
//        print(sortedDict)
    let temp = roomDict.map{$0.value}
    let sortedDict = temp.sorted{$0[0] < $1[0]}
    for day in sortedDict {
        print(day)
    }
}
// 6

// 7

// 8

// 9

