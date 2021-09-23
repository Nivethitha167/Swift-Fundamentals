//Differences Between Opaque Types and Protocol Types

protocol Colorable {
    associatedtype type
    var color: type {
        get
    }
}

struct Apple1: Colorable {
    var color: String = "Red"
}

struct Apple2: Colorable {
    var color: Int = 164 // Assume light red color code
}

// 1)  For using return types as protocol - which has Associated types - use opaque types instead of protocol types

/*func getColour() -> Colorable { // error - Protocol 'Colorable' can only be used as a generic constraint because it has Self or associated type requirements
    return Apple1()
}*/

func getColour() -> some Colorable { // no error
    return Apple1()
}

// 2) For preserving type identity use - opaque types


protocol Identifiable{
    var name: String {
        get
    }
}


struct Person: Identifiable {
    var name = "Kala"
}

struct Animal: Identifiable {
    var name = "Dog"
}


/*func toIdentify(get: String) -> some Identifiable { // error - Function declares an opaque return type, but the return statements in its body do not have matching underlying types
    if get == "Person" {
        return Person()
    }
    else {
        return Animal()
    }
}
 
 // Using opaque types as return type everytime will return the same type(specific type) - it cannot change the return type everytime according to user input(the only thing is user does not know what type it returns) but protocol as return type can return any type which conforms to that protocol

 
 */

func toIdentify(get: String) -> Identifiable { // no error - it can return any type as long as the type conforms to Identifiable protocol
    if get == "Person" {
        return Person()
    }
    else {
        return Animal()
    }
}

var temp1 = toIdentify(get: "Person")
var temp2 = toIdentify(get: "Animal")
 // Here we cant equate these two - because they will be diff types


func toShow(name: String) -> some Identifiable {
    return Person(name: name)// it always return the same type(person) - but the user doesnt know which type it will return
}


var temp3 = toShow(name: "Kala")
var temp4 = toShow(name: "Mala")
 // Here we can equate these two - because they are always same type








