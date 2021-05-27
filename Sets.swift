//---------------sets-----------
// for storing unique values in unordered way
var arr = Set<Int>()
arr = [3, 7, 8]
print(arr)

arr = []
print(arr)

var arr1: Set<Int> = [1, 2, 3]
print(arr1)

var arr2: Set<Character> = ["a", "b"]
print(type(of: arr2))

var arr3: Set = ["abc", "def"]
print(type(of: arr3))

var arr4: Set<Int>?
print(type(of: arr4))

//-------------------------

arr1.count
arr1.insert(7)
print(arr1)

arr1.insert(1)
print(arr1)

arr1.insert(6)
print(arr1)

arr1.remove(7)
print(arr1)

arr1.sorted() // it does not change original set value - so it needs another set to hold the values
print(arr1)

var arr5 = arr1.sorted()
print(arr5)

//there is no sort() for sets - only sorted()
// for array we have both sort() and sorted()
//sort() - sort the array itself
//sorted() - needs another array to place sorted values or temporarily sorts the value

//--------------------------traversing---------
for (i,v) in arr1.enumerated()
{
    print(i,terminator: " ")
    print(v)
}

//--------operations-------------
arr = [ 5, 2, 4, 8]
arr1 = [ 8, 4, 1, 3]
arr.union(arr1)
print(arr)
print(arr1)

arr.intersection(arr1)
arr.subtracting(arr1)

arr = [ 1, 2, 3, 4]
arr1 = [ 3, 2]

arr == arr1
arr1.isSubset(of: arr)
arr.isSuperset(of: arr1)
arr.isDisjoint(with: arr1)
