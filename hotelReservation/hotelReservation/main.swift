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

// money 초기화
var myMoney = 0

// account 초기화
var myAccount = [""]

// 랜덤 배열 생성
var numarr: Array<Int> = []
for i in stride(from: 100000, to: 500001, by: 10000) {
    numarr += [i]
}

// roomList [1: ["0720", "0722"], 2: ["0711", "0714"]]
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
            deleteRoom()
        case "7":
            changeRoom()
        case "8":
            getMyaccount()
        case "9":
            getMymoney()
        case "0":
            exit(0)
        default:
            print("실패")
    }
}


// 1
func provideMoney() {
    // 금액 지급
    let ranMoney = numarr.randomElement() ?? 0
    myMoney += ranMoney
    print("계좌잔액은 \(myMoney)입니다.")
    
    // 내역 저장
    myAccount += ["랜덤으로 \(ranMoney)원이 입금되었습니다. 잔액: \(myMoney)"]
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
    let roomNum = readLine() ?? ""
    print("원하시는 체크인 날짜를 입력하세요 ex)0720")
    let checkIn = readLine()
    print("원하시는 체크아웃 날짜를 입력하세요 ex)0721")
    let checkOut = readLine()
    
    // 예약 가능 여부
    if roomNum == "" {
        print("방번호가 입력되지 않았습니다")
    } else if checkIn == "" || checkOut == "" {
        print("날짜가 입력되지 않았습니다")
    } else if myMoney < Int(roomNum)!*10000 {
        print("계좌에 돈이 부족합니다")
    } else {
        // 예약 성공
        if let roomNum = Int(roomNum), let checkIn = checkIn, let checkOut = checkOut {
            roomDict.updateValue([checkIn,checkOut], forKey: Int(roomNum) )
            let charge = (Int(roomNum) )*10000*((Int(checkOut) ?? 0) - (Int(checkIn) ?? 0))
            myMoney -= charge
            // 내역 저장
            myAccount += ["예약 완료로 \(charge)원이 출금되었습니다. 잔액: \(myMoney)"]
            print("예약이 완료되었습니다.")
        }
    }
}

// 4
func checkMyroom() {
    for i in 0...5 {
        if roomDict.keys.contains(i) {
            print("방번호: \(i) 체크인 날짜: \(roomDict[i]![0]) 체크아웃 날짜: \(roomDict[i]![1]) 1박가격\(i*10000)원")
        }
    }
}

// 5
func checkSortedMyroom() {
    var sortedDict = roomDict.sorted {$0.value[0] < $1.value[0]}
    for item in sortedDict {
        print("방번호: \(item.key) 체크인 날짜: \(item.value[0]) 체크이웃 날짜: \(item.value[1]) 1박가격\(item.key*10000)원")
    }
    
//    let temp = roomDict.map{$0.value}
//    // ["체크인: 0707", "체크아웃: 0708"]
//    let sortedDict = temp.sorted{$0[0] < $1[0]}
}

// 6
func deleteRoom() {
    checkMyroom()
    print("취소를 원하는 예약의 번호를 입력하세요")
    if let num = Int(readLine() ?? "") {
        roomDict[Int(num)] = nil
        myMoney += (Int(num))*10000
        
        // 내역 저장
        myAccount += ["예약 완료로 \((Int(num) )*10000)원이 출금되었습니다. 잔액: \(myMoney)"]
    }
}

// 7
func changeRoom() {
    checkMyroom()
    print("변경을 원하는 예약의 번호를 입력하세요")
    let preNum = readLine() ?? ""
    print("어느 방으로 변경하시겠습니까?")
    let changeNum = readLine() ?? ""
    // 변경 가능 여부
    if let preNum = Int(preNum), let changeNum = Int(changeNum) {
        if roomDict.keys.contains(Int(changeNum)) {
            print("이미 예약이 되어있는 방입니다.")
        } else {
            // 방 업데이트
            roomDict[Int(changeNum)] =  roomDict[Int(preNum) ]
            
            // 기존의 예약 삭제
            roomDict[Int(preNum) ] = nil
            
            // 잔액 변경
            myMoney += ((preNum-changeNum))*10000
        }
    }
}

// 8
func getMyaccount() {
    print(myAccount.count)
    for i in 1...myAccount.count-1 {
        print("\(i). \(myAccount[i])")
    }
}

// 9
func getMymoney() {
    print("현재 잔액: \(myMoney)원")
}
