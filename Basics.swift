/* ------------ Swift Basics ----------------*/
/*------ swift is type safe lang - no need to give datatype explicitly - assigns datatype using type inference
------- top down approach - no semicolon---- */

/*
 1) variables and constants
 2) datatypes
 3) optionals
 4) type casting
 5) tuples
 6) type aliases
 */
 
//--> for single line comments
// /* */ --> multiline comments


//-------------------------------------------------------------------
//------Variables and Constants---------

//---------Var----------
// Def---> uesd to declare varying values

//---------let----------
/* Def---> used to define constant values like values which cannot be changed after assigned (similar to final keyword in java, const in c */

var a = 10
let b = 5
a = 5
//b = 6 // error since b is constant
// mostly name var in lowerCamelCase -- var isDataFound: Bool

//------- Type annotations : explicitly declaring the datatype of variables -------
var x: Int // : - denotes type of
print(type(of: a)) // to know which datatype

//--------------------------------------------------------------------

//datatypes -- Int, Float, Double, String, Bool, Character

var b1: Int
var b2: String = "str"
var b3: Float = 3.0
print(b3)
//ways of initialising
var a1: Int
//print(a1) --- error - not assign default values - should be initialised
//a1 = nil  ---- error - not assign nil
var a2: String = "" // empty string
//a2 = nil ------- error - not assign nil to any datatype
var a3: Bool = true

//---------------------------------------------------------------------

//optionals - may or maynot values declared

var a4: String? // default val - nil for optional
//print(a4!) // runtime error(fatal error) - accessing nil values
a4 = "str"
a4 = nil
a4 = "abc"
print(a4!) //need ! to access value - force unwrapping
print(type(of: a4)) // optional String

//********* nil values are assigned only to optionals type - never to normal dataypes(int, string, float, double, bool)

var y = a4! // force unwrapping
print(type(of: y)) // ***** String - by force unwrapping we get type string instead of optional string ****

var z = a4
print(type(of: z)) // optional String

var a5: String! = "nive"// another way defining optional - implicitly unwrapped optional - always has value
print(type(of: a5))
var f = a5
print(type(of: a5))

// ---------------------------------------------------------------------

// Type casting -****** one datatype to another datatype - once datatype assigned var cannot be changed - so we can assign type casting to diff var *****

var dou = 3.0
type(of: dou) // assigns Double not Float
var i = Int(dou) // type casting - only explicit conversion
//var add = dou + i // error cant do implicit conversion
type(of: i)

var st = "123"
var integ = Int(st)
print(integ!)
print(type(of: integ)) // while type casting sometimes may fail so it is converting as optional string because not all string converted to int type

var st1 = "str"
var integ1 = Int(st1)
print(type(of: integ1))
//print(integ1!)// error - for printing nil values - so it should be checked whether it has nil value - to avoid fatal error
if integ1 == nil
{
    print("Integ1 has nil values")
}

var i1 = 1
var f1 = Float(i1) // Float type not optional float
print(type(of: f1)) // not every time type casting changes to optionals - int can be changed to float and vice verse and int can be changed to string but not all string can be changed to string

var i2 = 124
var s2 = String(i2)
print(type(of: s2)) // String Type

//----------------------------------------------------------------------

// Tuples - used to hold diff Datatype values
var tup = ("str", 1, 1.0) // enclosed in ()
print(type(of: tup)) // gives data types used
print(tup.0) // accessed using . operator - first values is at 0 th pos
print(tup.1)

tup.0 = "abc"
print(tup.0) // so tuples can be changed - mutable

var (min,max) = (0, 100) // tuple another way of declaration if it is not given single name
print("Min is \(min), Max is \(max)")

var (string, num, _) = tup // _ to use to ignore some parts in tuple
print(string)
print(num)

//-----------------------------------------------------------------------

// type alias - giving alternative name
typealias flo = Float // typealias keyword is used
var f6: flo
print(type(of: f6))

//------------------------------------------------------------------------

