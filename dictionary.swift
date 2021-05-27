//---------dictinary------------
//for storing key-value pairs in unordered way
var d = [Int: String]()
type(of: d)

var d1: Dictionary<Int, String> = [1: "one", 2: "two"]
type(of: d1)
print(d1)
d1 = [:]

var d2 = [1: "one", 2: "two"]
print(type(of: d2))

var d3: Dictionary<Int?, String?>
print(type(of: d3))

var d4: Dictionary<Int, String>?
print(type(of: d3))
//-----------------------------insertion and deletion-------------
d = d2
d.count
var val = d[1]
print(type(of: val))
for (i,k) in d
{
    print(i,k)
}
d[1] = "one..."
print(d)
d.updateValue("two....", forKey: 2)
print(d)

d[3] = "three..." // create new inserion if the key is not present
d.updateValue("four...", forKey:4) // create new inserion if the key is not present
print(d)

d.removeValue(forKey: 3)
print(d)
d[4] = nil
print(d)

//-----------------------------
for i in d.keys
{
    print(i)
}
for i in d.values
{
    print(i)
}
