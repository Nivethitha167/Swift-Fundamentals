//Generics Functions

func display<T>(val1: T, val2: T, val3: T) -> T
{
    print(type(of: val1))
    print(type(of: val2))
    print(type(of: val3))
    return val2
    
}

var temp1 = display(val1: 5, val2: 6, val3: 11) // Int
print(type(of: temp1))

var ele: Int? = 5
var t1 = display(val1: 5, val2: 6, val3: ele)
print(type(of: t1)) //Optional<Int> -- "Note"-------

var temp2 = display(val1: 5.0, val2: 6.0, val3: 11.0) // Double
print(type(of: temp2))

var temp3 = display(val1: "5", val2: "6", val3: "11") // String
print(type(of: temp3))

var temp4 = display(val1: [1,2,3,4], val2: [5,6], val3: [7,8]) //Array<Int>
print(type(of: temp4))

var temp5 = display(val1: [1,2,3,4], val2: [5.0,6], val3: [7,8]) //Array<Double> -- "Note" ----
print(type(of: temp5))

var temp6 = display(val1: [1,2,"3",4], val2: [5.0,6], val3: [7,8]) //Array<Any>
print(type(of: temp6))

var temp7 = display(val1: [1,2,3,4], val2: [5.0,6.0], val3: ["7","8"]) //Array<Any>
print(type(of: temp7))

//display(val1: [1,2,3,4], val2: 5, val3: [7,8]) //error - Conflicting arguments to generic parameter 'T' ('Int' vs. '[Int]')

var temp8 = display(val1: 5, val2: 5.0, val3: 6) //Double -- "Note"--
print(type(of: temp8))

//display(val1: 5, val2: "5", val3: 5) // error - Conflicting arguments to generic parameter 'T' ('String' vs. 'Int')


var temp9 = display(val1: [1: "Int"], val2: [1.0: "Double"], val3: [3: "Int"]) //Dictionary<Double, String> -- "Note"----
print(type(of: temp9))

var temp10 = display(val1: [1: 1], val2: [1.0: "Double"], val3: [3: 3.0]) //Dictionary<Double, Any>
print(type(of: temp10))

var temp11 = display(val1: ["1": 1], val2: [1.0: "Double"], val3: [3: 3.0]) //Dictionary<AnyHashable, Any> -- "Note"-----
print(type(of: temp11))

var dict1 = ["1": 1]
var dict3 = [3: 3.0]

//var temp12 = display(val1: dict1, val2: dict1, val3: dict3) // error - Cannot convert value of type '[Int : Double]' to expected argument type '[String : Int]'

var x: Int? = 10

var t2 = display(val1: [x: "Int"], val2: [1.0: "Double"], val3: [3: "Int"])
print(type(of: t2)) //Dictionary<AnyHashable, String>

var y: [Int]? = [7,8]

var t3 = display(val1: [1,2,3,4], val2: [5,6], val3: y)
print(type(of: t3))//Optional<Array<Int>>


var a: Int = 5
var b: Double = 6.0
var c: Int = 6
var d: Int? = 7

var temp12 = display(val1: a, val2: c, val3: d)
print(type(of: temp12)) //Optional<Int>

//var temp13 = display(val1: d, val2: b, val3: c) // error - Cannot convert value of type 'Double' to expected argument type 'Optional<Int>'


//display(val1: a, val2: b, val3: a) // error - Cannot convert value of type 'Double' to expected argument type 'Int'

//--------------------------------------------------

func show1<T, U>(num1: U, num2: T, num3: U) -> U
{
    print(type(of: num1))
    print(type(of: num2))
    return num3
}

var new1 = show1(num1: 1, num2: "1", num3: 1.0)
print(type(of: new1))

func show2<T, U>(num1: U, num2: T, num3: U, num4: Int) -> U
{
    print(type(of: num1))
    print(type(of: num2))
    print(type(of: num4))
    return num3
}

var new2 = show2(num1: 1, num2: "1", num3: 1.0, num4: 6)
print(type(of: new2))

//Generic Types


class Class1<T>
{
    var arr: [T]
    var val: T
    //var dict: [T: T] //error - Type 'T' does not conform to protocol 'Hashable'
    //var set: Set<T> //error - Type 'T' does not conform to protocol 'Hashable'
    var dict: [String: T]
    func disp_type()
    {
        print(type(of: arr))
        print(type(of: val))
        print(type(of: dict))
    }
    func disp_arr(n1: T) -> T
    {
        print("The type is \(type(of: n1))")
        return n1
    }
    init(arr: [T], val: T, dict: [String: T])
    {
        self.arr = arr
        self.val = val
        self.dict = dict
    }
}

var class1 = Class1(arr: [1,2,3], val: 4, dict: ["One": 1])//Class1<Int>
class1.disp_type()

var f_val1 = class1.disp_arr(n1: 3)//The type is Int
print(type(of: f_val1)) //Int

var class2 = Class1(arr: [1,2,3], val: 4, dict: ["One": "1"])//Class1<Any>
class2.disp_type()

var f_val2 = class2.disp_arr(n1: 3.0) //The type is Any - note
print(type(of: f_val2))// Double - note

var f_val3 = class2.disp_arr(n1: [3.0,5,"5"]) //The type is Any
print(type(of: f_val3))//Array<Any>

class Strcut1<T>
{
    var arr: [T]
    var val: T
    //var dict: [T: T] //error - Type 'T' does not conform to protocol 'Hashable'
    //var set: Set<T> //error - Type 'T' does not conform to protocol 'Hashable'
    var dict: [String: T]
    func disp_type()
    {
        print(type(of: arr))
        print(type(of: val))
        print(type(of: dict))
    }
    func disp_arr(n1: T) -> T
    {
        print("The type is \(type(of: n1))")
        return n1
    }
    init(arr: [T], val: T, dict: [String: T])
    {
        self.arr = arr
        self.val = val
        self.dict = dict
    }
}

var struct1 = Strcut1(arr: [1,2,3], val: 4, dict: ["One": 1])//Strcut1<Int>
struct1.disp_type()

var s_val1 = struct1.disp_arr(n1: 3)//The type is Int
print(type(of: s_val1)) //Int

var struct2 = Strcut1(arr: [1,2,3], val: 4, dict: ["One": "1"])//Strcut1<Any>
struct2.disp_type()

var s_val2 = struct2.disp_arr(n1: 3.0) //The type is Any
print(type(of: s_val2))// Double

var s_val3 = struct2.disp_arr(n1: [3.0,5,"5"]) //The type is Any
print(type(of: s_val3))//Array<Any>






