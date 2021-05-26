//---------------------STRING-------------------


/*
 1) Multiline string
 2) string Interpolation
 3) String Indices
 4) Substring
 5) prefix and Suffix
 6) Unicode
 */
var str = "apple"

print(str.count) // to count no of chars
//to include special characters use \
str = "\"apple\""
print(str)

str = "" // emptying the string
print(str)
  
//-------MULTI LINE STRING----------
// used for including line breaks and special char in string
// -------- """ string """ - three double quotes are used
 
str = """

    This is first Line\n "this is second line"
       \"This is third line\"
    This is fourth line

    """
print(str) // here \n special character is used to print in new line and some spaces are there - it preserved the given format

print(1)


//-----------------------------------

//-----------STRING INTERPOLATION-------
// combining string, var, expressions - using forwars slash (\)
var a = 10
print(" This is the integer\(a)")
print("The square of \(a) is \(a*a)")

// string delimiter - #

var sample = "This is line 1\nThis is line2"// includes newline
print(sample)

sample = #"This is line 1\nThis is line2"#// prints \n " along with string - to print special chars
print(sample)

sample = #"This is line 1\#nThis is line2"#// prints newline not printing special char bcoz using # inside delimiters
print(sample)

//----------STRING INDICESS----------
str = "this is string"
//print(str[0]) // cannot access string value using this type []

for i in str.indices // using indices in for only we can access this type []
{
    print(str[i], terminator: "")
}
print("\n")


print(str[str.startIndex]) // for accesing first value
print(str[str.index(before: str.endIndex)]) // to access last value
print(str[str.index(str.startIndex, offsetBy : 5)])

// Inserting and removing
// for inserting insert(_:at:)
var st = "Nivethitha"
st.insert("S", at: st.startIndex) // for inserting single char
print(st)

st = "Nivethitha"
st.insert(contentsOf: "S. ", at: st.startIndex) // for inserting substring
print(st)

st.insert(contentsOf: " Welcome!", at: st.endIndex)
print(st)

st.insert(contentsOf: " Hello", at: st.index(before: st.endIndex))
print(st)
//st.insert(contentsOf: " Hello", at: st.index(after: st.startIndex, offsetBy: 2)) --cant use offsetBy for insert()  -- so we can only use -- st[st.index(st.startIndex, offsetBy : 2)] --for string indexing

// for removing remove(at:)
st.remove(at: st.startIndex) // for single char
print(st)
st.removeSubrange(st.startIndex...st.index(after: st.startIndex)) // for substring removal for specified range
print(st)
st.removeAll() // gives empty string
print(st)

//----------------------------------------------------

//-----------------SUBSTRING--------------------
st = "apple,orange"
var subStr = st[..<str.index(str.startIndex, offsetBy : 5)]
print(subStr) // this substring is another reference of st for given substring range
print(type(of: subStr)) // substring type not string

var newString = String(subStr)
print(newString)
print(type(of: newString))

//------------------------------------------------------

//---------prefix suffix-------------------------------
// hasPrefix(_:)
if st.hasPrefix("apple")
{
    print("Yes it has prefix apple")
}
// hasSuffix(_:)
if st.hasSuffix("orange")
{
    print("yes it has suffix orange")
}

//--------------Unicode Representation--------------
var dog = "Dog‼🐶"
print(dog.count)

for i in dog.utf8 // utf-8 8 bit representation
{
    print(i, terminator: " " )
}
print("\n")

for i in dog.unicodeScalars // 21 bit representation
{
    print(i.value, terminator: " " )
}
print("\n")

for i in dog
{
    print(i, terminator: " " )
}

