// ------------------operators-------------------

/* operators which are new to me------
 
 1) nil colalesing
 2) range
 3) divide returns int not float
 4) unary minus & plus
 */

//--------nil Coalescing operator----------
// def - for unwrapping optional - ??
var a: Int?
var b = 10
var c = a ?? b
print(c) // a is nil, so it assigns b value

a = 5
c = a ?? b
print(c) // a has value (non - nil) so it assigns a value - here there is no need for implicit unwrapping of optional (!)

//--------------------------------------------------------

//-------range oprators----------------
// def- for giving range values - ...
var ran = 1...5
print(ran.contains(1)) // contains return bool values if it has values within the given range
print(ran.contains(6))

for i in ran
{
    print(i)
}

// half open range operator-----------------------
for i in 1..<5 // less than 5
{
    print(i)
}
 
// one sided range operator---------------------

var arr = ["abc","cde","efg","hij"]
for i in arr[...1] // upto index values 1
{
    print(i)
}

for i in arr[0..<1] // less than index value 1
{
    print(i)
}

for i in arr[1...] // starts from index 1 to end of index values
{
    print(i)
}

//-------------------------------------------------

// Arithmetic operators - +, -, *, /, ( % - remainder operator - modulo)

var x =  10
var y = 4
var z = (x % y)
print(z)
print(type(of: z))

var l = (x / y) // divide returns int value not float value
print(l)
print(type(of: l))

//---------------------------------------------------

// unary minus operator - (-) --- (( (-) x (-) = + , (-) x (+) = - )) works on this method

var mi = 3
mi = -3
print(mi)
print(-mi)

// unary plus oprator - (+) --- retains same sign irrespectoive + or -

var pl = -3
print(+pl)

//-----------------------------------------------------
