//
//  main.swift
//  programmers
//
//  Created by t2023-m0056 on 2023/07/24.
//

import Foundation

// 숫자 찾기
print(solution(29183, 1))
func solution(_ num:Int, _ k:Int) -> Int {
    let new = Array(String(num))
    for i in 0...new.count-1 {
        if String(new[i]) == String(k) {
            return i+1
        }
    }
    return -1
}
 
//// 배열의 유사도
//func solution(_ s1:[String], _ s2:[String]) -> Int {
//    return s1.filter { s2.contains($0) }.count
//}

//// 인덱스 바꾸기
//print(solution("hello",1,2))
//func solution(_ my_string:String, _ num1:Int, _ num2:Int) -> String {
//    var new = Array(my_string)
//    new.swapAt(num1, num2)
//    return new.map{ String($0) }.lazy.joined()
//}

//// 대문자와 소문자
//print(solution("cccCCC"))
//func solution(_ my_string:String) -> String {
//    var result = ""
//    my_string.forEach { item in
//        if item.isLowercase {
//            result += item.uppercased()
//        } else {
//            result += item.lowercased()
//        }
//    }
//    return result
//}

//// 중복된 문자 제거
//print(solution("people"))
//func solution(_ my_string:String) -> String {
//    var result = ""
//    my_string.forEach{ item in
//        if !result.contains(item) {
//            result += String(item)
//        }
//    }
//    return result
//}

//// 문자열 정렬하기 (1)
//print(solution("p2o4i8gj2"))
//func solution(_ my_string:String) -> [Int] {
//    return my_string.filter { $0.isNumber }.map{ Int(String($0))! }.sorted()
//}

//// 최댓값 만들기 (1)
//print(solution([0, 31, 24, 10, 1, 9]))
//func solution(_ numbers:[Int]) -> Int {
//    var new = numbers.sorted(by: >)
//    return new[0]*new[1]
//}

//// 점의 위치 구하기
//print(solution([-7, 9]))
//func solution(_ dot:[Int]) -> Int {
//    if dot[0] > 0 {
//        if dot[1] > 0 {
//            return 1
//        } else {
//            return 4
//        }
//    } else {
//        if dot[1] > 0 {
//            return 2
//        } else {
//            return 3
//        }
//    }
//}

//// 가위 바위 보
//print(solution("205"))
//func solution(_ rsp:String) -> String {
//    var dict = ["0":"5","2":"0","5":"2"]
//    var result = ""
//    rsp.forEach { item in
//        result += dict[String(item)]!
//    }
//    return result
//}

//// 문자열 뒤집기
//print(solution("jaron"))
//func solution(_ my_string:String) -> String {
//    return String(my_string.reversed())
//}

//// 배열 뒤집기
//print(solution([1, 2, 3, 4, 5]))
//func solution(_ num_list:[Int]) -> [Int] {
//    return num_list.reversed()
//}

//// 배열 두배 만들기
//// [2, 4, 6, 8, 10]
//print(solution([1, 2, 3, 4, 5]))
//func solution(_ numbers:[Int]) -> [Int] {
//    return numbers.map { $0*2 }
//}

//// 최빈값 구하기
//print(solution([1, 2, 3, 3, 3, 4]))
//func solution(_ array:[Int]) -> Int {
//    var max = [Int:Int]()
//    for key in Set(array) {
//        max[key] = 0
//    }
//    for item in array {
//        max[item]! += 1
//    }
//
//    if (max.filter{ $0.value == max.values.max()}.count) > 1 {
//        return -1
//    }
//
//    for item in max {
//        if item.value == max.values.max() {
//            return item.key
//        }
//    }
//    return 0
//}
//
