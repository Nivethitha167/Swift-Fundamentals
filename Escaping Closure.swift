//--------------escaping closure----------------
// def - passed to a function as a parameter and called after the return statement - which lives outside the function - mainly used for storage purpose which is needed in future ao it is available in memory even after the function return - In order to allow a closure to escape function body we need to add @escaping keyword before the parameter type to indicate that it escaping closure.
// basically in swift closure are non escaping one in functions
func calculateSum(arr: Array<Int>, closure: (Int) -> Void){
    var sum = 0
    for i in arr{
        sum += i
    }
    closure(sum)
}
calculateSum(arr: [3, 4, 2, 7]){
    (sum: Int) -> Void in print(sum)
}// non escaping closure closure removed from memory after function returns

var originalSum: ((Int) -> Void)!
type(of: originalSum)
var sum = 0
func calculateSum1(arr: Array<Int>, closure: @escaping (Int) -> Void){
    for i in arr{
        sum += i
    }
    type(of: closure)
    originalSum = closure
    
}
calculateSum1(arr: [3, 4, 2, 7]){
    (sum: Int) -> Void in print(sum)
}
originalSum(sum)

//--------------------autoclosure--------------
// wrapping the expression when passed as argument to a function as closure
//It’s primarily used to defer execution of a expression to when it’s actually needed, rather than doing it directly when the argument is passed.
var a = 4
var isChecked: Bool?
func display(check: @escaping @autoclosure () -> Bool, _ str: String){
    if check(){
        
        print(str)
    }
    isChecked = check()
}
display(check: a % 2 == 0, "This is even Number")
print(isChecked!)
