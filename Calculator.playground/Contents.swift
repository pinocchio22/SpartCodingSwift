let calculator = Calculator()

var addResult = 0.0 // 덧셈 연산
var subtractResult = 0.0 // 뺄셈 연산
var multiplyResult = 0.0 // 곱셈 연산
var divideResult = 0.0 // 나눗셈 연산
var remainderResult = 0 // 나머지 연산

let input = "330-7"

let regex = /[-+*%\/]/
var sign = input.matches(of: regex).map{String($0.output)}[0]
var first = Double(input.split(separator: sign)[0])!
var second = Double(input.split(separator: sign)[1])!

calculator.calculate(first,sign,second)

print("addResult : \(addResult)")
print("subtractResult : \(subtractResult)")
print("multiplyResult : \(multiplyResult)")
print("divideResult : \(divideResult)")
print("remainderResult : \(remainderResult)")

class Calculator {
    func calculate(_ firstNumber:Double, _ sign:String, _ secondNumber:Double ) -> Double {
        switch sign {
        case "+": addResult = AddOperation().operate(first: firstNumber,second: secondNumber)
        case "-": subtractResult = SubtractOperation().operate(first: firstNumber,second: secondNumber)
        case "*": multiplyResult = MultiplyOperation().operate(first: firstNumber,second: secondNumber)
        case "/": divideResult = DivideOperation().operate(first: firstNumber,second: secondNumber)
        case "%": remainderResult = RemainOperation(first: firstNumber,second: secondNumber)
        default: return -1
        }
        return -1
       }
    
    func RemainOperation(first: Double, second: Double) -> Int {
        return Int(first) % Int(second)
    }
}

class AddOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first + second
    }
}

class SubtractOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first - second
    }
}

class MultiplyOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first * second
    }
}

class DivideOperation: AbstractOperation {
    func operate(first: Double, second: Double) -> Double {
        return first / second
    }
}

protocol AbstractOperation {
    func operate(first: Double, second: Double) -> Double
}
