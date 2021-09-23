protocol Getter
{
    var inti: Int{
        get
    }
    //let ini: Int   - Protocols cannot require properties to be immutable; declare read-only properties by using 'var' with a '{ get }' specifier
}

struct ComputedGetter_Get: Getter{
    var num = 10
    var inti: Int{
        get{
            return num
        }
    }
}

struct ComputedGetter_GetSet: Getter{
    var num = 10
    var inti: Int{ // computed get and set and in protocol is get only
        get{
            return num
        }
        set{
            num = newValue * 10
        }
    }
}

var struct1 = ComputedGetter_GetSet()
print(struct1.inti)
struct1.inti = 5
print(struct1.inti)


struct StoredGetter_Var: Getter
{
    var inti = 10
}

var struct2 = StoredGetter_Var()
struct2.inti
struct2.inti = 20
struct2.inti

struct StoredGetter_Let: Getter
{
    let inti = 10 // in protocol mention var but here let..coz it is in getter
}

var struct3 = StoredGetter_Let()
struct3.inti
//struct3.inti = 50 -  error - Cannot assign to property: 'inti' is a 'let' constant

//doc : ref - If the protocol only requires a property to be gettable, the requirement can be satisfied by any kind of property, and it’s valid for the property to be also settable if this is useful for your own code.

//---------------------------------------------------

protocol GetterSetter
{
    var inti: Int{
        get set
    }
}

/*struct ComputedGetterSetter_Get: GetterSetter{ // Type 'ComputedGetterSetter_Get' does not conform to protocol 'GetterSetter'
    var num = 10
    var inti: Int{
        get{
            return num
        }
    }
}
 cannot perform readonly computed prop..coz in protocol it is in get set
 
 docu : ref - If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a read-only computed property.
 
 */

struct ComputedGetterSetter_GetSet: GetterSetter{
    var num = 10
    var inti: Int{ // computed get and set and in protocol is get only
        get{
            return num
        }
        set{
            num = newValue * 10
        }
    }
}

var struct_1 = ComputedGetter_GetSet()
print(struct_1.inti)
struct_1.inti = 5
print(struct_1.inti)


struct StoredGetterSetter_Var: GetterSetter
{
    var inti = 10
}

var struct_2 = StoredGetter_Var()
struct_2.inti
struct_2.inti = 20
struct_2.inti

/*struct StoredGetterSetter_Let: GetterSetter
{
    let inti = 10
}
//Type 'StoredGetterSetter_Let' does not conform to protocol 'GetterSetter'

//Candidate is not settable, but protocol requires it - ask to change let to var - coz cannot perform constant properties to getter and setter

// docu : ref - "If a protocol requires a property to be gettable and settable, that property requirement can’t be fulfilled by a constant stored property"
 
 */

//-------------------------------------------------------------

/*
 
 Understanding
 
 1) If a protocol requires a property to be gettable , then we can use for
   - stored prop (var, let) or
   - computed prop (get - readonly , get set)
 
 2) If a protocol requires a property to be gettable and settable, then we can use for
   - stored prop(var) or
   - comp prop(get set)
 */

protocol Sample1
{
    var vari: Int{
        get
    }
}

protocol Sample2
{
    var vari: String{
        get
    }
}

/*struct Structure: Sample1, Sample2 // performing same var name and type with diff protocols
{
    var vari: String
    
    // error - Type 'Structure' does not conform to protocol 'Sample2'
}
 // cannot perform like this, if we conform to one protocol then other makes error
*/
 
protocol Sample3
{
    var vari: Int{
        get set
    }
}

struct Structure: Sample1, Sample3
{
    //let vari: Int // error - Type 'Structure' does not conform to protocol 'Sample3'
    var vari: Int
}

var new1 = Structure(vari: 5)

//--------------static property--------------

protocol Sample4
{
    static var vari: Int{
        get set
    }
}
struct Structure1: Sample4
{
    //let vari: Int // error - Type 'Structure' does not conform to protocol 'Sample4'
    static var vari: Int = 1000
}

Structure1.vari

//-------------Methods--------------variable parameters-----------

protocol Methods
{
    func display(int: Int..., str: String) -> String
    //func display(int: Int = 5, str: String) -> String - error - Default argument not permitted in a protocol method
    
}

class Class: Methods
{
    func display(int: Int..., str: String) -> String{
        print(type(of: int)) // Array<Int>
        // docu : ref - a variadic parameter with a name of int and a type of Int... is made available within the function’s body as a constant array called int of type [Int].
        return "\(int) are \(str)"
    }
}

var class1 = Class()
var disp1 = class1.display(int: 5,6,7,8, str: "Integers")
print(disp1)

// --------------------------default values and type methods--------------

protocol Methods1
{
    static func display(int: Int, str: String) -> String
    //func display(int: Int = 5, str: String) -> String - error - Default argument not permitted in a protocol method
    
}

class Class1: Methods1
{
    static func display(int: Int = 5, str: String) -> String{ // but here we can use default value
        return "\(int) is \(str)"
    }
}

/*var class2 = Class()
var disp2 = class2.display(str: "Integers")
print(disp2)
 */

print(Class1.display(str: "Int")) // for type methods









//------computed property takes temporary memory like functions - kp

print("RRR",MemoryLayout.size(ofValue: test())) // 8
withUnsafePointer(to: test()) { (address) in
            print("address = \(address)")
        }
func test() ->Int {
      return 0
    }



 



