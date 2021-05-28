//-----------Closure--------
// lightweight syntax - more easy way to write a bloick of code than functions
// similar to lambda
var arr = [ "kala", "mala", "kamala", "vimala", "sheela"]
print(arr.sorted())

var arr1 = arr.sorted(by: {
    (str1: String, str2: String) -> Bool in return str1 > str2
})
print(arr1)

// oparator method - the above code is similar to below code - and mathches the method type of sorted(by:) method
var arr2 = arr.sorted(by: >)
print(arr2)

var inti = [1, 2, 3, 4]
type(of: inti)
print(inti.sorted(by: >)) // works for int also

var arr3 = arr.sorted(by: {
    (str1, str2) in return str1 > str2
})
print(arr3) // since swift is type inference no need to explicitly give types

var arr4 = arr.sorted(by: {
    str1, str2 in str1 > str2
})
print(arr4) // for single statement no need to give return

var arr5 = arr.sorted(by: {
    $0 < $1 // here is the highest number so it considers two arguments and $0 denotes the first string argument
})
print(arr5)

//------------trailing closures--------------------
func display(a: Int, clo: (Int) -> Int) -> Int
{
     return clo(a)
}
var arr6: Int = display(a: 10) { (num) in return (num * num) }
print(arr6)

//---------------------------------------------------
var a = 10
var b = {num in return num + 10}
print(b(a))
