fun main(args: Array<String>) {
    println("Hello World!")

    // Try adding program arguments via Run/Debug configuration.
    // Learn more about running applications: https://www.jetbrains.com/help/idea/running-applications.html.
    println("Program arguments: ${args.joinToString()}")

//    functions
    fun sum(a: Int, b: Int): Int {
        return a + b;
    }
//    shorthand
    fun subtr(a: Int, b: Int) = a - b

//    no return value
    fun log(a: Int): Unit = println("Logged: $a")
    fun log(a: String): Unit = println("Logged: $a")
    fun log(vararg args: Any): Unit = args.forEach {
        print("Logged: ")
        print(it)
        print(" ")
    }

    log(sum(45, 66))
    log(subtr(67, 34))

//    variable
    val name = "Johnny"
    val age = "40"

    log(name, age)

//    classes
    class Shape

    


}