import Foundation

// 1
// for i in 1...100 {
//     if i % 3 == 0 && i % 5 == 0 {
//         print("FizzBuzz") 
//     } else if i % 3 == 0 {
//         print("Fizz")
//     } else if i % 5 == 0 {
//         print("Buzz")
//     } 
// }

// 2
// func isPrime(_ number: Int) -> Bool {
//     if number < 2 {
//         return false
//     }
//     var i: Int = 2
//     while i <= Int(sqrt(Double(number))) {
//         if number % i == 0 {
//             return false
//         }
//         i += 1
//     }
//     return true
// }

// for i in 1...100 {
//     if isPrime(i) {
//         print(i)
//     }
// }

// 3
// Function to convert Celsius to Fahrenheit
// func celsiusToFahrenheit(_ celsius: Double) -> Double {
//     return (celsius * 9/5) + 32
// }

// // Function to convert Celsius to Kelvin
// func celsiusToKelvin(_ celsius: Double) -> Double {
//     return celsius + 273.15
// }

// // Function to convert Fahrenheit to Celsius
// func fahrenheitToCelsius(_ fahrenheit: Double) -> Double {
//     return (fahrenheit - 32) * 5/9
// }

// // Function to convert Fahrenheit to Kelvin
// func fahrenheitToKelvin(_ fahrenheit: Double) -> Double {
//     return (fahrenheit - 32) * 5/9 + 273.15
// }

// // Function to convert Kelvin to Celsius
// func kelvinToCelsius(_ kelvin: Double) -> Double {
//     return kelvin - 273.15
// }

// // Function to convert Kelvin to Fahrenheit
// func kelvinToFahrenheit(_ kelvin: Double) -> Double {
//     return (kelvin - 273.15) * 9/5 + 32
// }

// print("Enter the temperature value:")
// if let input = readLine(), let temperature = Double(input) {
//     print("Enter the unit of the temperature (C, F, K):")
//     if let unit = readLine() {
//         switch unit.uppercased() {
//         case "C":
//             let fahrenheit = celsiusToFahrenheit(temperature)
//             let kelvin = celsiusToKelvin(temperature)
//             print("\(temperature)°C is \(fahrenheit)°F and \(kelvin)K")
//         case "F":
//             let celsius = fahrenheitToCelsius(temperature)
//             let kelvin = fahrenheitToKelvin(temperature)
//             print("\(temperature)°F is \(celsius)°C and \(kelvin)K")
//         case "K":
//             let celsius = kelvinToCelsius(temperature)
//             let fahrenheit = kelvinToFahrenheit(temperature)
//             print("\(temperature)K is \(celsius)°C and \(fahrenheit)°F")
//         default:
//             print("Invalid unit. Please enter C, F, or K.")
//         }
//     } else {
//         print("Invalid input for unit.")
//     }
// } else {
//     print("Invalid input for temperature.")
// }


// 4
// var shoppingList: [String] = []

// func displayMenu() {
//     print("""
//     Shopping List Application
//     1. Add item
//     2. Remove item
//     3. Display list
//     4. Exit
//     """)
// }

// func addItem() {
//     print("Enter the item to add:")
//     if let item = readLine() {
//         shoppingList.append(item)
//         print("\(item) added to the shopping list.")
//     } else {
//         print("Invalid input.")
//     }
// }

// func removeItem() {
//     print("Enter the item to remove:")
//     if let item = readLine() {
//         if let index = shoppingList.firstIndex(of: item) {
//             shoppingList.remove(at: index)
//             print("\(item) removed from the shopping list.")
//         } else {
//             print("Item not found in the shopping list.")
//         }
//     } else {
//         print("Invalid input.")
//     }
// }

// func displayList() {
//     print("Current shopping list:")
//     for item in shoppingList {
//         print("- \(item)")
//     }
// }

// func main() {
//     var shouldExit = false
//     while !shouldExit {
//         displayMenu()
//         if let choice = readLine(), let option = Int(choice) {
//             switch option {
//             case 1:
//                 addItem()
//             case 2:
//                 removeItem()
//             case 3:
//                 displayList()
//             case 4:
//                 shouldExit = true
//                 print("Exiting the application.")
//             default:
//                 print("Invalid option. Please choose 1, 2, 3, or 4.")
//             }
//         } else {
//             print("Invalid input. Please enter a number.")
//         }
//     }
// }

// main()

// 5
// func main() {
//     print("Enter a sentence:")
//     if let sentence = readLine() {
//         // Remove punctuation and make the sentence lowercase
//         let cleanedSentence = sentence.lowercased().components(separatedBy: CharacterSet.punctuationCharacters).joined()
        
//         // Split the sentence into words
//         let words = cleanedSentence.split(separator: " ").map { String($0) }
        
//         // Dictionary to store word-frequency pairs
//         var wordFrequency: [String: Int] = [:]
        
//         // Count the frequency of each word
//         for word in words {
//             if let count = wordFrequency[word] {
//                 wordFrequency[word] = count + 1
//             } else {
//                 wordFrequency[word] = 1
//             }
//         }
        
//         // Display the words and their corresponding frequencies
//         print("Word frequencies:")
//         for (word, frequency) in wordFrequency {
//             print("\(word): \(frequency)")
//         }
//     } else {
//         print("Invalid input.")
//     }
// }

// main()


// 6
// func fibonacci(_ n: Int) -> [Int] {
//     // Handle cases where n is less than or equal to zero
//     if n <= 0 {
//         return []
//     }
    
//     // Initialize the array with the first two Fibonacci numbers
//     var sequence = [0, 1]
    
//     // If n is 1, return the array with only the first Fibonacci number
//     if n == 1 {
//         return [0]
//     }
    
//     // Use a loop to calculate the remaining Fibonacci numbers
//     for i in 2..<n {
//         let nextNumber = sequence[i - 1] + sequence[i - 2]
//         sequence.append(nextNumber)
//     }
    
//     return sequence
// }

// let firstFibonacci = fibonacci(10)
// print(firstFibonacci) 

// 7
// Step 1: Define the dictionary to store student names and scores
// var studentScores: [String: Int] = [
//     "Alice": 85,
//     "Bob": 78,
//     "Charlie": 92,
//     "Diana": 88,
//     "Eve": 76
// ]

// Step 2: Calculate the average score
// let totalScore = studentScores.values.reduce(0, +)
// let averageScore = Double(totalScore) / Double(studentScores.count)

// Step 3: Determine the highest and lowest scores
// let highestScore = studentScores.values.max() ?? 0
// let lowestScore = studentScores.values.min() ?? 0

// Step 4: Display each student's name with their score and indicate if they are above or below the average
// for (student, score) in studentScores {
//     let status = score >= Int(averageScore) ? "above" : "below"
//     print("\(student): \(score) (\(status) average)")
// }

// Step 5: Display the average, highest, and lowest scores
// print("\nAverage Score: \(averageScore)")
// print("Highest Score: \(highestScore)")
// print("Lowest Score: \(lowestScore)")

// 8
// func isPalindrome(_ text: String) -> Bool {
//     // Normalize the string: lowercase and remove non-alphanumeric characters
//     let normalizedText = text.lowercased().filter { $0.isLetter }
    
//     // Check if the normalized string is equal to its reverse
//     return normalizedText == String(normalizedText.reversed())
// }

// print(isPalindrome("A man, a plan, a canal, Panama")) 

// 9
// // Function to perform addition
// func add(_ a: Double, _ b: Double) -> Double {
//     return a + b
// }

// // Function to perform subtraction
// func subtract(_ a: Double, _ b: Double) -> Double {
//     return a - b
// }

// // Function to perform multiplication
// func multiply(_ a: Double, _ b: Double) -> Double {
//     return a * b
// }

// // Function to perform division
// func divide(_ a: Double, _ b: Double) -> Double? {
//     if b == 0 {
//         return nil
//     }
//     return a / b
// }

// while true {
//     print("Enter the first number: ", terminator: "")
//     guard let firstInput = readLine(), let firstNumber = Double(firstInput) else {
//         print("Invalid input. Please enter a valid number.")
//         continue
//     }
    
//     print("Enter the second number: ", terminator: "")
//     guard let secondInput = readLine(), let secondNumber = Double(secondInput) else {
//         print("Invalid input. Please enter a valid number.")
//         continue
//     }
    
//     print("Choose an operation (+, -, *, /): ", terminator: "")
//     guard let operation = readLine() else {
//         print("Invalid input. Please enter a valid operation.")
//         continue
//     }
    
//     var result: Double?
    
//     switch operation {
//     case "+":
//         result = add(firstNumber, secondNumber)
//     case "-":
//         result = subtract(firstNumber, secondNumber)
//     case "*":
//         result = multiply(firstNumber, secondNumber)
//     case "/":
//         result = divide(firstNumber, secondNumber)
//         if result == nil {
//             print("Error: Division by zero is not allowed.")
//             continue
//         }
//     default:
//         print("Invalid operation. Please choose one of +, -, *, /.")
//         continue
//     }
    
//     if let result = result {
//         print("Result: \(result)")
//     }
    
//     print("Do you want to perform another calculation? (yes/no): ", terminator: "")
//     if let continueInput = readLine(), continueInput.lowercased() != "yes" {
//         break
//     }
// }

// print("Goodbye!")

// 10
// func hasUniqueCharacters(_ text: String) -> Bool {
//     var seenCharacters = Set<Character>()
    
//     for char in text {
//         if seenCharacters.contains(char) {
//             return false
//         }
//         seenCharacters.insert(char)
//     }
    
//     return true
// }

// print(hasUniqueCharacters("Hello"))