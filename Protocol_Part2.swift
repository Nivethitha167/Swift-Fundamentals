//-------------Mutating methods for value types---------

protocol Edible
{
    mutating func eat(name: String)
    init(name: String)
}

struct Fruits: Edible
{
    var name: String = "abc"
    mutating func eat(name: String)
    {
        self.name = name
        print("\(name) is  eatable")
    }
    // no error - doesnt ask to specify init in struct
    // required keyword is only applicable for class
    /*required init(name: String) { // error - 'required' initializer in non-class type 'Fruits'
        self.name = name
    }*/
}

var fruit1 = Fruits(name: "Apple")
fruit1.name // Apple

//----------------Initializer-------------------------
class Fruits1: Edible
{
    
    var name: String = "abc"
    func eat(name: String) { // no need to put mutating here - since intance prop can be mutable inside the class and mutating keyword is applicable for value types only
        print("\(name) is  eatable")
    }
    
    required init(name: String) { // required - have to mention for class
        self.name = name
    }
    
}

class Apple1: Fruits1//, Edible - error "Redundant conformance of 'Apple' to protocol 'Edible'"
{
    //---------doesnt ask to provide the func eat...because it is subclass, only parent class conform to protocol - "A type can adopt any number of protocols, which allows for a quasi-multiple inheritance not permitted through subclassing."
    
    required init(name: String)
    {
        super.init(name: name)
    }
}

var app1 = Apple1(name: "Apple")
app1.name

class Fruits2
{
    var name: String
    init(name: String)
    {
        self.name = name
    }
}

class Orange: Fruits2, Edible
{
    func eat(name: String) {
        print("\(name) is  eatable")
    }
    required override init(name: String) // override for class, required for protocol
    {
        super.init(name: name)
    }
    
}

//-----------------failable init-----------
protocol Eligable
{
    init?(age: Int)
}

class Candidate1: Eligable
{
    var age: Int
    required init?(age: Int)
    {
        self.age = age
        if age < 18
        {
            return nil
        }
    }
}

class Candidate2: Eligable
{
    var age: Int
    required init(age: Int)
    {
        self.age = age
    }
}

//docu : ref - A failable initializer requirement can be satisfied by a failable or nonfailable initializer on a conforming type.


protocol Eligable2
{
    init(age: Int)
}

class Candidate3: Eligable2
{
    var age: Int
    /*required init?(age: Int) // error - Non-failable initializer requirement 'init(age:)' cannot be satisfied by a failable initializer ('init?')
    {
        self.age = age
        if age < 18
        {
            return nil
        }
    }*/
    required init!(age: Int)
    {
        self.age = age
        if age < 18
        {
            return nil
        }
    }
}

// docu : ref - A nonfailable initializer requirement can be satisfied by a nonfailable initializer or an implicitly unwrapped failable initializer.

