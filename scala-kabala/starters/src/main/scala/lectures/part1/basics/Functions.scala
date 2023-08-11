package lectures.part1.basics

object Functions extends App {
  def aFunc(a: Int, b: String): String =
    a + " " + b

  def repeat(str: String, n: Int): String = {
    if (n == 1) str else str + repeat(str, n - 1)
  }

  def greet(name: String, age: Int): String = {
    "Hello " + name + ", " + age
  }

  def factorial(n: Int): Int = {
    if (n == 1) n else n * factorial(n - 1)
  }

  def fibonacci(n: Int): Int = {
    if (n == 0) 0
    else if (n <= 2) 1
    else fibonacci(n - 2) + fibonacci(n - 1)
  }

}
