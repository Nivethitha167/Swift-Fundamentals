//----------------------Arrays-------------------
// def - to store same type of values in ordered form

// ------------------creating Arrays-------------
var arr = [Int]()//creating empty int arr
print(arr)

var arr1 = [1, 2, 3, 4] // giving array values directly
print(arr1)
print(type(of: arr1)) // assigns Array<Int>

var arr5 = [Int] (repeating: 5, count: 3)
print(arr5)

var arr6 = Array<String>()

var arr2 = Array(repeating: 0, count: 5) // sets initial value with range
print(arr2)

var arr3: [Int] = [4, 5, 6] // create using array literal
print(arr3)

//var arr4: [Int] = [1, nil] - cannot assign nil values inside array
var arr4: [Int]? = nil // but create optional array
print(type(of: arr4))
arr4 = [6, 7]
print(arr4!)
type(of: arr4)
//-------------------------------------------------

arr = []

print(arr.isEmpty)

arr.append(3)// to append values
print(arr)

arr += [4,5] // using addition assignment operator tp append values
print(arr)

print(arr.count) // to count no of values in arr

arr = [] // emptying the arr
print(arr)

arr = [ 1, 2, 3, 4]
print(arr[0]) // accessing val using subscript

//arr[0] = nil - acnnot assign nil values to arr

//-----------insert and delete------------------------

arr[0] = 7 // change values using index pos
print(arr)

arr.insert(5 , at: 0) // another way of inserting using insert(_:at:)
print(arr)

arr[0...2] = [8, 7, 8] // for changing range of values
print(arr)

arr.insert(7, at: 3)
print(arr)

arr.remove(at: 0)
print(arr)

//---------------traversing-------
for i in arr
{
    print(i, terminator: " ")
}
print("")
for (int, val) in arr.enumerated()
{
    print(int, terminator: " ")
    print(val)
}
