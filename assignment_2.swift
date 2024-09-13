// 1
var fruits: [String] = ["Apple", "Orange", "Watermelon", "Banana", "Pea"]
print(fruits)

var favoriteNumbers: Set<Int> = [1, 2, 3, 4, 5]
favoriteNumbers.insert(6)
print(favoriteNumbers)

var programmingLanguages: [String: String] = ["Python": "1995", "C": "1979", "Swift": "2014"]
print(programmingLanguages["Swift"]!)

var colors: [String] = ["Red", "Green", "Blue", "Yellow"]
colors[1] = "Purple"    
print(colors)

// 2
var firstSet: Set<Int> = [1, 2, 3, 4]
var secondSet: Set<Int> = [3, 4, 5, 6]
print(firstSet.intersection(secondSet))

var students: [String: Int] = ["John": 90, "Jane": 95, "Tom": 85]
students["Tom"] = 80
print(students)

var firstArray: [String] = ["Apple", "Banana"]
var secondArray: [String] = ["Cherry", "Date"]
var combinedArray = firstArray + secondArray
print(combinedArray)

// 3
var countries: [String: String] = ["USA": "300mln", "China": "1.4bln", "Japan": "126mln"]
countries["Russia"] = "144mln"
print(countries)

var firstAnimals: Set<String> = ["Cat", "Dog"]
var secondAnimals: Set<String> = ["Dog", "Mouse"]
var combinedAnimals = firstAnimals.union(secondAnimals).subtracting(secondAnimals)
print(combinedAnimals)

var studentsScores: [String: [Int]] = ["John": [90, 87], "Jane": [95, 24], "Tom": [85, 78]]
print(studentsScores["Jane"]![1])

