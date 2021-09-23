//--------------------------Ordering in Restaurant----------------
protocol Serving
{
    var serverName: [String]{
        get
    }
    func orderPickUp(guest: String, dish_name: String, quantity: Int, waiter: String, table: Int) -> Order
    func orderServe(order: Order, waiter: String, guest: String, table: Int)
}

protocol Cooking
{
    var cookName: [String]{
        get
    }
    func toCook(order: Order, waiter: String, cook: String)
    func doneCooking(order: Order, waiter: String, cook: String)
}

protocol Dining
{
    var guest_name: [String]
    {
        get
    }
    var tableNo: [Int]
    {
        get
    }
    var menu: [String]
    {
        get
    }
    func toeat(guest: String)
}



class Restaurant: Serving, Cooking, Dining
{
    
    var serverName: [String]
    var cookName: [String]
    var guest_name: [String]
    var tableNo: [Int]
    var menu: [String]
    
    init(serverName: [String], cookName: [String], guest_name: [String], tableNo: [Int], menu: [String])
    {
        self.cookName = cookName
        self.guest_name = guest_name
        self.serverName = serverName
        self.tableNo = tableNo
        self.menu = menu
    }
    
    func orderPickUp(guest: String, dish_name: String, quantity: Int, waiter: String, table: Int) -> Order {
        print("Guest \(guest) from table \(table) ordered \(quantity) \(dish_name) to waiter \(waiter)")
        return Order(dish_name: dish_name, quantity: quantity)
    }
    
    
    func toCook(order: Order, waiter: String, cook: String){
        print("waiter \(waiter) tells chef \(cook) to cook \(order.quantity) \(order.dish_name)")
    }
    
    func doneCooking(order: Order, waiter: String, cook: String){
        print("----------Food Cooked------")
        print("chef \(cook) gives the cooked dish \(order.quantity) \(order.dish_name) to waiter \(waiter)")
        
    }
    
    func orderServe(order: Order, waiter: String, guest: String, table: Int) {
        print("waiter \(waiter) served the order of \(order.quantity) \(order.dish_name) to guest \(guest) in table \(table) ")
    }
    
    func toeat(guest: String)
    {
        print("Guest \(guest) eats the served food")
    }

}

var restaurant1 = Restaurant(serverName: ["Kala", "Deepa"], cookName: ["Mala", "Kamala"], guest_name: ["Vimala", "Sheela"], tableNo: [2, 4], menu: ["Dosa", "Idly", "Curdrice", "Chapathi"])


struct Order
{
    var dish_name: String
    var quantity: Int

}

var order1: Order
var waiter1: String = restaurant1.serverName[0]
var cook1: String = restaurant1.cookName[0]
var guest1: String = restaurant1.guest_name[0]
var table1: Int = restaurant1.tableNo[1]


order1 = restaurant1.orderPickUp(guest: guest1, dish_name: restaurant1.menu[0], quantity: 3, waiter: waiter1, table: table1)

restaurant1.toCook(order: order1, waiter: waiter1, cook: cook1)

restaurant1.doneCooking(order: order1, waiter: waiter1, cook: cook1)

restaurant1.orderServe(order: order1, waiter: waiter1, guest: guest1, table: table1)

restaurant1.toeat(guest: guest1)

/* output
 
 Guest Vimala from table 4 ordered 3 Dosa to waiter Kala
 waiter Kala tells chef Mala to cook 3 Dosa
 ----------Food Cooked------
 chef Mala gives the cooked dish 3 Dosa to waiter Kala
 waiter Kala served the order of 3 Dosa to guest Vimala in table 4
 Guest Vimala eats the served food

 */

print("--------------------------------------------")


var order2: Order
var waiter2: String = restaurant1.serverName[1]
var cook2: String = restaurant1.cookName[1]
var guest2: String = restaurant1.guest_name[1]
var table2: Int = restaurant1.tableNo[0]


order2 = restaurant1.orderPickUp(guest: guest2, dish_name: restaurant1.menu[1], quantity: 3, waiter: waiter2, table: table2)

restaurant1.toCook(order: order2, waiter: waiter2, cook: cook2)

restaurant1.doneCooking(order: order2, waiter: waiter2, cook: cook2)

restaurant1.orderServe(order: order2, waiter: waiter2, guest: guest2, table: table2)

restaurant1.toeat(guest: guest2)

print("--------------------------------------------")

/* output
 
 Guest Sheela from table 2 ordered 3 Idly to waiter Deepa
 waiter Deepa tells chef Kamala to cook 3 Idly
 ----------Food Cooked------
 chef Kamala gives the cooked dish 3 Idly to waiter Deepa
 waiter Deepa served the order of 3 Idly to guest Sheela in table 2 
 Guest Sheela eats the served food

*/


