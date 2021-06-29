enum EligibilityError: Int, Error
{
    case NotEligibleForCm = 18
    case NotEligibleForPresident = 25
    case NotEligibleForVoting = 35
}

func eligibility(age: Int) throws -> Void{
    if age < EligibilityError.NotEligibleForVoting.rawValue
    {
        throw EligibilityError.NotEligibleForVoting
    }
    else if age < EligibilityError.NotEligibleForCm.rawValue
    {
        print("eligible for voting")
        throw EligibilityError.NotEligibleForCm
    }
    else if age < EligibilityError.NotEligibleForPresident.rawValue
    {
        print("eligible for voting and cm")
        throw EligibilityError.NotEligibleForPresident
    }
    else{
        print("eligible for voting, cm and president")
    }
}

var age = 34
do
{
    try eligibility(age: age)
}
catch EligibilityError.NotEligibleForVoting{
    print("not eligible for voting, cm and president")
}

catch EligibilityError.NotEligibleForCm
{
    
    print("not eligible for cm, president")
}

catch EligibilityError.NotEligibleForPresident
{
    print("not eligible for president")
}

//Nested do - catch
enum NumberError: Error
{
    case WholeNUM
    case NaturalNUM
}
func wholeNum(num: Int) throws -> Void
{
    if num < 0
    {
        throw NumberError.WholeNUM
    }
}

func naturalNum(num: Int) throws -> Void
{
    if num <= 0
    {
        throw NumberError.NaturalNUM
    }
    
}
var num = -1
do{
    try wholeNum(num: num)
    print("It is whole Num")
    do
    {
        try naturalNum(num: num)
        print("It is natural num")
    }
    catch NumberError.NaturalNUM{
        print("It is not natural Num")
    }
}
catch NumberError.WholeNUM{
    print("It is not whole Number")
}
catch{
    print(error)
}

// runtime error
enum DivisionError: Error {
    case DivisionByZero
}
func divide(num1: Int, num2: Int) throws -> Int {
    if num2 == 0 {
        throw DivisionError.DivisionByZero
    }
    return num1 / num2
}
do
{
    try divide(num1: 10, num2: 0)
}
catch {
    print(error)// here i need error msg division by zero what the system tells if dont use try catch
}


