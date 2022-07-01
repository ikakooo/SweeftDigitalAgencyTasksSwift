import Swift


// Task 1) Palindrom
func isPalindrome(_ myWord:String) -> Bool {
    let reverseString = String(myWord.reversed())
    if(myWord != "" && myWord == reverseString) {
        return true
    } else {
        return false
    }
}

// ----------------------  შეამოწმე სიტყვა თუ არის პალინდრომი   ---------------------------
print("Task1")
print("პალინდრომია? -\(isPalindrome("ikiiki"))")
print("პალინდრომია? -\(isPalindrome("დგგ"))")
print("პალინდრომია? -\(isPalindrome("იკი"))")
print("პალინდრომია? -\(isPalindrome("(()())"))")


// Task 2) find minimum
// number of denominations
// ----------------------  ობიექტზე ორიენტირებული ლოგიკით დაწერილი კოდი  ----------------------
///  ----- ამ მეთოდს დიდ რიცხვებთან მუშაობა უჭირს(მეტ კომპიუტერულ რესურს მოითხოვს), ამიტომ მეორეს გამოყენებაა უფრო ლეგიტიმური
func moneyChangeOOP(amount:Int)-> Int{
    let nominals = [1,5,10,20,50]
    var result = [Int]()
    var amount = amount
    
    for i in stride(from: nominals.count-1, to: -1, by: -1) {
        
        while amount >= nominals[i]{
            amount -= nominals[i]
            result.append(nominals[i])
        }
    }
    return result.count
}

// ----------------------  პროცესზე ორიენტირებული ლოგიკით დაწერილი კოდი  ----------------------
///  -------------------- მუშაობს უფრო სწრაფად და კომპიუტერული რესურსის გამოყენების მხრივ უფრო ეფექტურად   ----------------------
func moneyChangePOP(amount: Int)-> Int {
    let coins50 = amount / 50
    let coins20 = (amount - coins50 * 50) / 20
    let coins10 = (amount - coins20 * 20 - coins50 * 50) / 10
    let coins5 = (amount - coins10 * 10 - coins20 * 20 - coins50 * 50) / 5
    let coins = (amount - coins5 * 5-coins10 * 10 - coins20 * 20 - coins50 * 50)
    return coins50 + coins20 + coins10 + coins10 + coins5 + coins
}

// ----------------------  Task2 - ოპტიმალური ხურდა ----------------------
print("Task2")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangeOOP(amount:52626))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangePOP(amount:52626))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangeOOP(amount:6))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangePOP(amount:6))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangeOOP(amount:26))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangePOP(amount:26))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangeOOP(amount:75))")
print("მინიმალური მონეტების რაოდენობა: \( moneyChangePOP(amount:75))")



// Task 3)   ---------------------- ოპტიმალური ხურდა  ----------------------

func notContainsAndMoreThanZero(_ A :  [Int]) -> Int {
    var counter = [Int: Bool]()
    for i in A {
        counter[i] = true
    }
    
    var i = 1
    while true {
        if counter[i] == nil {
            return i
        } else {
            i += 1
        }
    }
}
let array = [1,13,17,17,2,3,4,5,6,7,8,9,10,10,0,0,-11,12,-13,4,7,16,14,66,77,5,2,3,6,8,11,15, 10, 20, 50]


print("Task3")
print("ერეიში არ არის რიცხვი:  \( notContainsAndMoreThanZero(array))")
print("ერეიში არ არის რიცხვი:  \( notContainsAndMoreThanZero([1,3,4]))")


// Task 4)
func checkParentheses(_ s: String) -> Bool {
    let pairs: [Character: Character] = ["(": ")", "[": "]", "{": "}"]
    var stack: [Character] = []
    for char in s {
        if let match = pairs[char] {
            stack.append(match)
        } else if stack.last == char {
            stack.popLast()
        } else {
            return false
        }
    }
    return stack.isEmpty
}

print("Task4")
print("ყველა ბრჩხილი დახურულია?  \( checkParentheses("{{{}{}{{"))")
print("ყველა ბრჩხილი დახურულია?  \( checkParentheses("[[[]][]]"))")
print("ყველა ბრჩხილი დახურულია?  \( checkParentheses("())()"))")
print("ყველა ბრჩხილი დახურულია?  \( checkParentheses("(()())"))")
print("ყველა ბრჩხილი დახურულია?  \( checkParentheses("()"))")


//  Task 5)

private func fib(stearsCount: Int)-> Int {
    if (stearsCount <= 1){
        return stearsCount
    }else {
        return (fib(stearsCount: stearsCount - 1) + fib(stearsCount: stearsCount - 2))
    }
}
func countVariants(_ s: Int)-> Int {
    return fib(stearsCount: s + 1)
}
print("Task5")
print("კომბინაციების რაოდენობა: \( countVariants(6))")
print("კომბინაციების რაოდენობა: \( countVariants(4))")
print("კომბინაციების რაოდენობა: \( countVariants(7))")


//  Task 6)


/// ------ სტეკი არის მონაცემთა სტრუქტურა, რომელიც საშუალებას გვაძლევს O(1) დროში წავშალოთ ელემენტი.
struct Stack<T>{
    
    fileprivate var stackData:[T] = []
    
    var isEmpty:Bool{
        return stackData.isEmpty
    }
    
    var count:Int{
        return stackData.count
    }
    
    mutating func push(_ text:T){
        stackData.append(text)
    }
    
    mutating func pop()-> T? {
        return stackData.popLast()
    }
    
    func peek()->T?{
        return (stackData.last)
    }
    
}

print("Task 6 Stack")
var stack = Stack<String>()
stack.peek()
stack.push("Swift Arrays")
stack.push("Swift")
stack.push("Swift Stack")
print(stack)
stack.peek()
stack.pop()
stack.pop()
stack.peek()
stack.pop()
print(stack)


struct Queue<T>{
    
    var items:[T] = []
    
    mutating func enqueue(element: T)
    {
        items.append(element)
    }
    
    mutating func dequeue() -> T?
    {
        
        if items.isEmpty {
            return nil
        }
        else{
            let tempElement = items.first
            items.remove(at: 0)
            return tempElement
        }
    }
    
}


print("Task 6 Queue")

var queue = Queue<String>()

queue.enqueue(element: "Swift Arrays")
print(queue)
queue.enqueue(element: "Swift Queue")
queue.enqueue(element: "Swift Arrays")
print(queue)
queue.dequeue()
print(queue)
