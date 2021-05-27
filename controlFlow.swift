//-----------Control Flow---------
// for loop
for i in stride(from: 0, to: 20, by: 5) // similar to for(i=0;i<20;i=i+5) - not includes last value
{
    print(i)
}// stride is used to get some values after particukar internal of given range

for i in stride(from: 0, through: 20, by: 5) // includes last value
{
    print(i)
}

// while loop
var a: Int; var b: Int // multiple statements are defines using semi colon
(a, b) = (10,30)
print(a,b)

loop: while a <= b{ // label
    print(a)
    if a == 25
    {
        break loop
    }
    a+=5
}

// reapeat - while
a = 25; b = 20
repeat
{
    print(a)
    a+=5
}while a<=b

// switch
var num: Int? = nil // trying optional
num = 1
switch num
{
case 0: print("Zero")
case 1: print("One")
    fallthrough
case 2: print("Two")
case 3: print("Three")
default: print("Number")
}

var tup = (0, 0)
var n = 0
switch tup
{
case (0, 1), (1, 1): print("Y axis or  diagonal to origin") //  compound values
case (0, 0) where n == 0: print("Origin") // where to check additional condition
case (1, 0): print("X axis")
default: print("graph")
}
//---------------------

// Early exit - guard statement
// similar to if - if executes if condition true - guard executes if condition false
var c = 2
var d = 10

while c <= d{
    guard c != 8 else{
        print("value is 8")
        break // must use return, break, continue or throw to exit guard
    }
    c+=2
}

//--------------- #available - to check availability of OS--------------
if #available(macOS 10.15, *)
{
    print("version 10.15")
}
