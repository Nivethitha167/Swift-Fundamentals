//-------------------------Subscripts----------------------------------

//Subscripts are shortcuts for accessing the member elements of a collection, list, or sequence. These subscripts are used to store and retrieve the values with the help of index without the use of separate method.

class Week {
    var days = ["Sun", "Mon", "Tue", "Wed", "Thu", "Fri", "Sat"]
    subscript(index: Int) -> String {
    get {
        return days[index]
    }
    set(newValue) {
        days[index] = newValue
    }
    }
}
var week1 = Week()
print(week1[0])
week1[0] = "Sunday"
print(week1[0])
print(week1.days)

//-----------------Subscript Options-------------------

//Subscripts can take any number of input parameters, and these input parameters can be of any type. Subscripts can also return a value of any type.
struct TwoDimMatrix
{
    var row: Int
    var col: Int
    var arr: [Int]
    subscript(row1: Int, col1: Int = 2) -> Int{
        get{
            return arr[row1 * col + col1]
        }
        set{
            arr[row1 * col + col1] = newValue
        }
    }
    func display() -> Void
    {
        for i in 0..<row{
            for j in 0..<col{
                print(arr[i * col + j], terminator: " ")
            }
            print()
        }
    }
}
var TwoD = TwoDimMatrix(row: 2, col: 3, arr: [1, 2, 3, 4, 5, 6])  // [1 2 3
                                                                  //  4 5 6]
print(TwoD[1])
TwoD.display()
TwoD[1, 1] = 10
TwoD.display()

//------------------type subscripts--------------------
enum DayOfAWeek: Int
{
    case sun = 1, mon, tue, wed, thu, fri, sat
    static subscript(ind: Int) -> DayOfAWeek{
        return DayOfAWeek(rawValue: ind)!
    }
}

print(DayOfAWeek[5])
