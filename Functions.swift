//---------Functions----
func display(a: String, t: Int)-> String{
    return "Hello \(a), time is \(t) pm"
}
var name = "nivethitha"
var time = 4
print(display(a: name, t: time))


//print(display(name: "Nive", time: 4))// error - func calling and func definition paramater name should be same
func greet(_ n: String, t: Int = 4) // _ used instead of explicit argument name - t default parameter is used if not specified in function call
{
   //t = 5 error because parameters are always constant
   print("Hello \(n), time is \(t) pm")
}
name = "nive"
greet(name)// not defining argument name

//--------variadic parameters------
func add(num: Int...)
{
    var n = 0
    for i in num{
        n += i
    }
    print(n)
}
add(num: 1,2,3,4,5)

//---------------in out parameters-------------
func swap(_ a: inout Int, _ b: inout Int)
{
    let temp = a
    a = b
    b = temp
}
var a = 10
var b = 5
swap(&a, &b)
print(a, b)

//---------------function type---------
func add(a: Int, b: Int) -> Int
{
    return (a + b)
}
var operation: (Int, Int) -> Int
print(type(of: operation))
operation = add
print(operation(2, 5))

//-------------function type as parameter types-------
func result(add: (Int, Int) -> Int, a: Int, b: Int)
{
    print(add(a, b))
}
result(add: operation, a: 2, b: 3)

//--------------function type as return type-----------
func inc(_ a: Int) -> Int{
    //print(a)
    return (a + 1)
}
func dec(_ a: Int) -> Int{
    //print(1)
    return (a - 1)
}
func chooseFunc(c: Int) -> (Int) -> (Int){
    //print(c)
    return ( c > 0 ? inc : dec)
}
var a1 = 2
var val = (chooseFunc(c: a1))
print(val(5))

//----------------------nested functions-----------------------------
func inc1(_ a: Int) -> Int{
    return (a + 1)
}
func chooseFunc1(c: Int) -> (Int) -> (Int){
    func inc1(_ a: Int) -> Int{
        return (a + 1)
    }
    func dec1(_ a: Int) -> Int{
        return (a - 1)
    }
    return ( c > 0 ? inc1 : dec1)
}
var a2 = 2
var val1 = (chooseFunc1(c: a2))
print(val1(5))
