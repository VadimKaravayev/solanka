package lectures.part2.oop

object OOBasics extends App {
  val person = new Person("Bill", 40)
  println(person.name)
  println(person.doubleAge)
  println(person.greet("Andre"))
  println(person.greet())
}

class Foo

//between parenthesis go class params
//Class params are not class fields, that's why you cannot access them with getters
//To make a class param a field, add val or var before it
class Person(val name: String, age: Int = 1) {
  //field
  val doubleAge = age * 2

  //method
  def greet(name: String): Unit = {
    println(s"${this.name} greets $name")
  }

  //overloaded method
  def greet(): Unit = {
    println(s"${this.name} is greeting everyone")
  }

  //multiple constructors
  def this(name: String) = this(name, 18)
}

class Writer(firstName: String, lastName: String, val year: Int) {
  def fullName: String = s"$firstName $lastName"
}

class Novel(name: String, year: Int, author: Writer) {
  def authorAge: Int = year - author.year
  def isWrittenBy(author: Writer): Boolean = author == this.author
  def copy(newYear: Int): Novel = new Novel(name, newYear, author)
}

//class Counter(n: Int) {
//  def count: Int = n
//}
//
//// Same
//
//class Conter(val counter: Int)

// In FP you don't modify state, rather you return new instance with new state
class Counter(val count: Int = 0) {
  def inc = new Counter(count + 1)
  def int(n: Int) = new Counter(count + n)
  def dec = new Counter(count - 1)
  def dec(n: Int) = new Counter(count - n)

  def print(): Unit = println(count)

}