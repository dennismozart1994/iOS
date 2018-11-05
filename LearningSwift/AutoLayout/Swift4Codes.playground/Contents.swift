import UIKit

// Like Kotlin, Name : Type
var name: String = ""
name = "Name"

// Optional variables don't need to be initialize, and starts with nill, never forget to set or check before use it
var optional: String?
//optional = " Mozart"
if let valueAfterCheck = optional
{
    name = name + String(valueAfterCheck)
}
print(name)

// Arrays needs to be initialize
var names: [String] = []
names.append("Name 1")
names.append("Name 2")
names.remove(at: 0)
print(names)


// Set variables stores non-repeated values
var lista = Set<String>()
lista.insert("item1")
lista.insert("item2")
lista.insert("item3")
lista.insert("item1")
print(lista)

// Dictionaries - basicly it's an array that you can identify the type of the index and values
// E.g an array with String indexes and Integer values
var dictionary = [String: Int]()
dictionary["valor1"] = 10
print(dictionary["valor1"]!)

// Math is the same as every language
// Logic operation is the same as every language
// if else is the same as every language

// Loops
// For
for i in 0..<45{
    print(String(i))
}
// foreach
for setlist in lista{
    print(setlist)
}
// while loop is the same as it is in every language
// Do while
var value = 0
repeat{
    print(String(value))
    value+=1
}while (value<=5)

// Functions
// func nameOfFunction(varName : varType) -> returnType
// {
//  return value
// }
// How to called
// varName = nameOfFunction(varname: value)

// Class is the same as it is in every language and instanciate as it is in Kotlin
// The constructor needs to be set into the init{}
class Item{
    var cor: String
    var peso: Double
    
    init(weight: Double, detail: String)
    {
        self.cor = detail
        self.peso = weight
    }
    
    func getDetails() -> String
    {
        return String("Cor: " + self.cor + "\n Peso: " + String(self.peso))
    }
}

// Extends is equal to Kotlin
class item2: Item{
    func example() -> String {
        return String("Example of hierarchy")
    }
}

var item = item2(weight: 3.20, detail: "Roxo")
print(item.getDetails())



