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

// class hotel
class HotelRoom {
    var roomNum: Int
    var price: Int
    
    init(roomNum: Int, price: Int) {
        self.roomNum = roomNum
        self.price = price
    }
}

// class Reservation
class Reservation {
    var room: HotelRoom
    var checkIn: String
    var checkOut: String
    var days: Int
    
    init(room: HotelRoom, checkIn: String, checkOut: String, days: Int) {
        self.room = room
        self.checkIn = checkIn
        self.checkOut = checkOut
        self.days = days
    }
}

// roomList 초기화
var roomList = [
    HotelRoom(roomNum: 1, price: 100000),
    HotelRoom(roomNum: 2, price: 200000),
    HotelRoom(roomNum: 3, price: 300000),
    HotelRoom(roomNum: 4, price: 400000),
    HotelRoom(roomNum: 5, price: 500000)
]

// reservationList 초기화
var reservationList = [Reservation]()

// money 초기화
var myMoney = 0

// account 초기화
var myAccount = [""]

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

guard let num = readLine()

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
    for item in roomList {
        print("\(item.roomNum)번방 1박 \(item.price)원")
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
            reservationList.append(Reservation(room: HotelRoom(roomNum: roomNum, price: roomNum*10000), checkIn: checkIn, checkOut: checkOut, days: (Int(checkOut) ?? 0) - (Int(checkIn) ?? 0)))
            
            // 금액 계산
            let charge = roomNum * 10000 * ((Int(checkOut) ?? 0) - (Int(checkIn) ?? 0))
            myMoney -= charge
            // 내역 저장
            myAccount += ["예약 완료로 \(charge)원이 출금되었습니다. 잔액: \(myMoney)"]
            print("예약이 완료되었습니다.")
        }
    }
}

// 4
func checkMyroom() {
    for i in 0...reservationList.count-1 {
        print("\(i+1). 방번호: \(reservationList[i].room.roomNum) 체크인 날짜: \(reservationList[i].checkIn) 체크아웃 날짜: \(reservationList[i].checkOut) 1박가격: \(reservationList[i].room.price)원")
    }
}

// 5
func checkSortedMyroom() {
    let sortedList = reservationList.sorted{ $0.checkIn < $1.checkIn }
    for item in sortedList {
        print("방번호: \(item.room.roomNum) 체크인 날짜: \(item.checkIn) 체크아웃 날짜: \(item.checkOut) 1박가격: \(item.room.price * item.days)원")
    }
}

// 6
func deleteRoom() {
    checkMyroom()
    print("취소를 원하는 예약의 번호를 입력하세요")
    if let num = Int(readLine() ?? "") {
        myMoney += reservationList[num-1].room.price * reservationList[num-1].days
        myAccount += ["예약 취소로 \(reservationList[num-1].room.price * reservationList[num-1].days)원이 입급되었습니다. 잔액: \(myMoney)"]
        reservationList.remove(at: num-1)
        print("\(num)번 예약의 취소가 완료 되었습니다.")
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
        if (reservationList.map{ $0.room.roomNum }).contains(changeNum) {
            print("이미 예약이 되어있는 방입니다.")
        } else {
            reservationList[preNum-1].room.roomNum = changeNum
            reservationList[preNum-1].room.price = changeNum * 10000
            if (preNum - changeNum) > 0 {
                myAccount += ["예약 변경으로 \((preNum - changeNum) * 10000)원 입금되었습니다. 잔액: \(myMoney)"]
            } else {
                myAccount += ["예약 변경으로 \((preNum - changeNum) * 10000)원 출금되었습니다. 잔액: \(myMoney)"]
            }
            myMoney += (preNum - changeNum) * 10000
            print("\(preNum)번 예약이 \(changeNum)번 방 예약으로 변경되었습니다.")
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
