//------------------ computed properties -------------------
// don't store the values but the calculate the value using getter and optional setter to retrive and set values indirectly
struct Addition
{
    var a = 10
    var b = 5
    var sum: Int{
        get{
            a + b // if there is sibgle experession no need of return
        }
    }
} // read - only computed property
var a = Addition()
print(a.sum)
var b = Addition(a: 2, b: 3)
print(b.sum)
struct Dimension
{
    var len = 0
    var br = 0
}

struct rectangle
{
    var dim = Dimension()
    var newDim: Dimension{
        get{
            let l = dim.len
            let b = dim.br
            return Dimension(len: l, br: b)
        }
        set(Dimension1){
            if Dimension1.len < 2
            {
                dim.len = 2
            }
            else if Dimension1.br < 2
            {
                dim.br = 2
            }
        }
    }
}
var rect = rectangle(dim: Dimension())
rect.newDim = Dimension(len: 1, br: 3)
print(rect.dim.len)

//--------------property observers and property wrappers------------

@propertyWrapper struct UpperCase {
    var wrappedValue: String {
        willSet {
            print("Going to set \(wrappedValue)")
        }
        didSet {
            print("Now the String is \(wrappedValue)")
            wrappedValue = wrappedValue.uppercased() }
    }
    

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.uppercased()
    }
}
var upper = UpperCase(wrappedValue: "xyz")
print(upper)
upper.wrappedValue = "abc"
print(upper)

struct User {
    @UpperCase var firstName: String
    var lastName: String
}
var user = User(firstName: "nivethitha", lastName: "soundarrajan")
print(user.firstName)
print(user.lastName)
