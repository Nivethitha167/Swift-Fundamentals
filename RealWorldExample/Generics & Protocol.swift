//----------------------Vending Machine----------------
protocol Vending {
    associatedtype ItemType //vending machine can give any one of these(snacks, tea, coffee, etc) so I made the type as generic
    var item: [ItemType] {
        get
    }
    func getItem(item: ItemType, quantity: Int) -> String
}


class SnacksVendingMachine<ItemType: Snacks>: Vending { // Since it is a snacks vending machine, I made Itemtype to inherit the base class "Snacks".
    var item: [ItemType]
    
    init(item: [ItemType]) {
        self.item = item
    }
    
    func displayItems() {
        print("Item \t   Flavor")
        for i in item {
            print("\(i.name) \t \(i.flavour)")
        }
        print("\n")
    }
    
    func getItem(item: ItemType, quantity: Int) -> String {
        return ("The person received \(quantity) quantity of \(item.name)(\(item.flavour) flavour) from vending machine")
    }
}


class Snacks {
    var name: String
    var flavour: String
    init(name: String, flavour: String) {
        self.name = name
        self.flavour = flavour
    }
}

class Biscuits: Snacks {
    override init(name: String, flavour: String) {
        super.init(name: name, flavour: flavour)
    }
}

class Beverages: Snacks {
    override init(name: String, flavour: String) {
        super.init(name: name, flavour: flavour)
    }
}


var vendingMachine1 = SnacksVendingMachine(item: [Biscuits(name: "MarieGold", flavour: "Orange"), Beverages(name: "Miranda", flavour: "Lemon"), Biscuits(name: "Oreo", flavour: "Chocolate"), Biscuits(name: "Sunfeast", flavour: "Chocolate"), Beverages(name: "Sprite", flavour: "Ginger Sugar")])

vendingMachine1.displayItems()

var item1 = vendingMachine1.item[2]

var person1 = vendingMachine1.getItem(item: item1, quantity: 3)
print(person1)


var item2 = vendingMachine1.item[3]

var person2 = vendingMachine1.getItem(item: item2, quantity: 1)
print(person2)

var item3 = Biscuits(name: "MarieGold", flavour: "Orange")


var person3 = vendingMachine1.getItem(item: item3, quantity: 1)
print(person3)

/* output
Item        Flavor
MarieGold      Orange
Miranda      Lemon
Oreo      Chocolate
Sunfeast      Chocolate
Sprite      Ginger Sugar


The person received 3 quantity of Oreo(Chocolate flavour) from vending machine
The person received 1 quantity of Sunfeast(Chocolate flavour) from vending machine
The person received 1 quantity of MarieGold(Orange flavour) from vending machine
 
 */

