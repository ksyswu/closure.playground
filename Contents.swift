//closure는 함수인데 이름이 없는 함수임

var someValue = 100

let sum2 = {(value1:Int, value2:Int) -> Int in //in은 구분시키는 것
    var total = value1 + value2 + someValue
    return total
    
   // return value1 + value2 + someValue
} //인자->리턴밸류


sum2(2, 3)

someValue = 50

sum2(2, 3)

//클로저는 함수이며 객체이기에 let sum2를 지나는 순간 하나의 객체로 만들어줌 또한 콜바이 레퍼런스로 안의 함수들도 참조를 함 추후에 재활용을 하기 위해서




//추론

var someClosure = {() -> () in print("hmm..")}
someClosure = {(void) -> Void in print("hmm..")}
someClosure = {(void) in print("hmm..")}
someClosure = {print("hmm..")} //다 같은 값 출력


someClosure()

func sumOfSqaure(closure:((Double) -> Double), numbers:Double...) -> Double {
    var result = 0.0
    
    for number in numbers {
        result += closure(number)
    }
    return result
}

func square(src:Double)->Double{
    return src * src
}

var result = sumOfSqaure(closure: square, numbers: 1,2,3,4,5)
print(result)
/*
let c1 = {(value1:Double) -> Double in return  value1 * value1 }
let c1 = {(value1:Double) -> Double in return  value1 * value1 } //리턴밸류가 있기에 더블끼리곱하면 더블임을 알 수 있음
let c1 = {(value1:Double) -> Double in value1 * value1 } //리턴없이도 in으로 구현부 구분을 통해 추론가능

result = sumOfSqaure(closure: c1, numbers: 1,2,3,4,5)
 */

//result = sumOfSqaure(closure: {value1 in value1 * value1 }, numbers: 1,2,3,4,5)

result = sumOfSqaure(closure: {$0 * $0 }, numbers: 1,2,3,4,5)


//example. closure argument 2개, 인자가 2개일때 가능
func sumOfSqaure2(closure:((Double, Double) -> Double), numbers:Double...) -> Double {
    var result = 0.0
    
    for number in numbers {
        result += closure(number, number)
    }
    return result
}
result = sumOfSqaure2(closure: *, numbers: 1,2,3,4,5)

print(result)



//배열에서 맵과 클로저를 이용


let array = [0,1,2,3]
var arrayResult:[Int] = []

for value in array {
   arrayResult += [value * 2]
}

print(arrayResult)

//let arrayResult2 = array.map({(value1:Int) -> Int in return value1 * 2})
//let arrayResult2 = array.map({(value1:Int) -> Int in value1 * 2})
//let arrayResult2 = array.map({(value1:Int) in value1 * 2})
//let arrayResult2 = array.map({value1 in value1 * 2})
//let arrayResult2 = array.map({$0 * 2})
let arrayResult2 = array.map{$0 * 2}

print(arrayResult2)


let arrayIncPrefix = array.map{"이번 타이밍은 \($0) 입니다"}

print(arrayIncPrefix)

