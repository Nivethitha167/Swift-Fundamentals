//Contextual where clauses

protocol Money
{
    associatedtype type
    var currency: type {
        get
    } 
    var amount: Int{
        get
    }
    //func DollarConverter() where type == Rupee // error - Instance method requirement 'DollarConverter()' cannot add constraint 'Self.type == Rupee' on 'Self'
}
struct Rupee
{
    var country: String
}

struct Dollar
{
    var country: String
}

extension Money
{
    //associatedtype type2 // error - Associated types can only be defined in a protocol;
    func DollarConverter() where type == Rupee
    {
        print("1 dollar is 70 rs")
        print("Amount in Dollars equivalent is \(amount / 70)")
    }
    
    func RupeeConverter() where type == Dollar
    {
        print("1 Dollar is 70 rs")
        print("Amount in Rupess equivalent is \(amount * 70)")
    }
}

class Stock<type>: Money
{
    var currency: type
    
    var amount: Int
    
    init(currency: type, amount: Int)
    {
        self.currency = currency
        self.amount = amount
    }
    
}

var stock1 = Stock(currency: Rupee(country: "India"), amount: 700)
stock1.DollarConverter()
//stock1.RupeeConverter() // error - Instance method 'RupeeConverter()' requires the types 'Rupee' and 'Dollar' be equivalent

var stock2 = Stock(currency: Dollar(country: "US"), amount: 10)
stock2.RupeeConverter()

//-----------------------------------

struct Converter<T> // it works same for class
{
    func rupeeConverter() where T == Rupee
    {
        print("Rupee Converter")
    }
    
    func dollarConverter() where T == Dollar
    {
        print("Dollar converter")
    }
}

var converter1 = Converter<Rupee>()
converter1.rupeeConverter()
//converter1.dollarConverter() // error - Instance method 'dollarConverter()' requires the types 'Rupee' and 'Dollar' be equivalent


var converter2 = Converter<Dollar>()
converter2.dollarConverter()
//converter2.rupeeConverter() // error - Instance method 'rupeeConverter()' requires the types 'Dollar' and 'Rupee' be equivalent


//Associated Types with a Generic Where Clause

protocol Edible
{
    var name: String
    {
        get
    }
}
protocol Store
{
    associatedtype type where type == Edible
    var item: type{
        get
    }
}

struct Fruits: Store
{
    var item: Edible
}

struct Apple: Edible
{
    var name: String
}

struct Seed
{
    var name: String
}

var temp = Fruits(item: Apple(name: "GreenApple"))
//var temp1 = Fruits(item: Seed(name: "AppleSeed")) // error - Argument type 'Seed' does not conform to expected type 'Edible'


//---------------------------------------------

protocol Person
{
    associatedtype type
    var id: type{
        get
    }
}

protocol Employee: Person where type == Int{ // adding constraint to a inherited associated type  using generic where clause in protocol declaration
    var name: String{
        get
    }
}

struct Teacher: Employee
{
    //var id: type or
    var id: Int
    var name: String
    
    var subject: String
}


var teacher1 = Teacher(id: 100, name: "Kala", subject: "CSE")
