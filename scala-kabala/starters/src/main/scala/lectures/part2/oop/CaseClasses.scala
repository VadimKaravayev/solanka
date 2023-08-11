package lectures.part2.oop

object CaseClasses extends App {
//  equals hashcode toString copy companion object serializable

  case class Person(name: String, age: Int)

  val bill = Person("Bill", 45)
  val john = bill.copy(name = "John")

  println(bill)
  println(john)
  println(bill == john)
}
