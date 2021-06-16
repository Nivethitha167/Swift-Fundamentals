// Deinitialization - A deinitializer is called immediately before a class instance is deallocated. You write deinitializers with the deinit keyword, similar to how initializers are written with the init keyword. Deinitializers are only available on class types.



var amt = 100
class Calculate
{
    var num1 = 0
    init()
    {
        amt += 100
        num1 += 5
        print("100 rs is added and num1 in incre by 5")
    }
    deinit {
        amt -= 50
        print("50 rs is minused")
    }
}

func display() -> Void
{
    let class1 = Calculate()
    print(class1.num1)
    print(amt) // 200
}
display() // here calculate class is created in func body, after creating func ends the memory is deallocated, so before deallocation deinit executes

print(amt) // 150

print("-----------------------")

var class2: Calculate? = Calculate()
class2!.num1
amt
class2 = nil

print("------------------------")

class Subclass: Calculate
{
    var num2 = 0
    override init()
    {
        num2 += 10
        print("Num2 is incremented ny 10")
    }
    deinit {
        amt -= 100
        print("100 rs is minused")
    }
}

var subclass1: Subclass? = Subclass()
print(subclass1!.num1)
print(amt) // 300
print(subclass1!.num2)
subclass1 = nil
//100 rs is minused
//50 rs is minused ( both deinit is called here)
print(amt) // 150



