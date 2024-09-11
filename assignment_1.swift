var firstName: String = "Alikhan"
var lastName: String = "Abikhas"
var age: Int = 21
var birthDate: Int = 2003
var isStudent: Bool = true
var height: Double = 1.68

let currentYear: Int = 2024
func getAge() -> Int {
    return currentYear - birthDate
}

var hobby: String = "Playing video games"
var numberOfHobbies: Int = 1
var favoriteNumber: Int = 4
var isHobbyCreative: Bool = false

let lifeStory: String = "My name is \(firstName) \(lastName). I am \(age) years old. I was born in \(birthDate). I am a currently \(isStudent ? "a student" : "not a student")."
print(lifeStory)