class Student {
  var clg: College?
}

class College {
    var classes = [ClassRoom]()
  var noOfClasses: Int {
    return classes.count
  }
  subscript (i: Int) -> ClassRoom {
    get  {
      return classes[i]
    }
    set  {
      return classes[i] = newValue
    }
  }
  func printNoOfClasses() -> String? {
    if noOfClasses > 3{
        return "The no of classes is \(noOfClasses)"
    }
    else{
        return nil
    }
  }
    
}

class ClassRoom {
  var className: String
  init(className: String) { self.className = className }
}

let john = Student()
//var check1 = john.clg!.noOfClasses // runtime error

var chech2 = john.clg?.noOfClasses // no error - it assigns nil

if let classCount =  john.clg?.noOfClasses {
  print("College has a \(classCount) Classes")
}
else {
  print("Unable to Retrieve No. of Classes") //  here clg is nil
}

if let classCountDisplay =  john.clg?.printNoOfClasses() {
  classCountDisplay
}
else {
  print("Unable to call function")
}



// accessing properties



john.clg = College()

if let classCount =  john.clg?.noOfClasses {
  print("College has a \(classCount) Classes")
}
else {
  print("Unable to Retrieve No. of Classes")
}

john.clg?.classes = [ClassRoom(className: "cse"), ClassRoom(className: "ece"), ClassRoom(className: "eee")]
john.clg?.noOfClasses

// accessing methods

if let classCountDisplay =  john.clg?.printNoOfClasses() { // set noofclasses = 3
  print(classCountDisplay)
}
else {
  print("Unable to call function")
}


if let classCountDisplay =  john.clg?.printNoOfClasses()?.hasPrefix("The") {
  print(classCountDisplay)
}
else {
  print("Unable to call function")
}

// accessing subscripts

if let firstClassName = john.clg?[0].className
{
    print("The first class name is \(firstClassName)")
}

john.clg?[0].className = "Computer Science" // setting subscripts

if let firstClassName = john.clg?[0].className
{
    print("The first class name is \(firstClassName)")
}

john.clg?.classes[0].className
