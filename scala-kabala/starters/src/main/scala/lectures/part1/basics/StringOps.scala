package lectures.part1.basics

object StringOps extends App {
  val str: String = "Lorem ipsum dolor simet"
  println(str.charAt(1))
  println(str.substring(1, 5))
  println(str.split(" ").toList)
  println(str.startsWith("Lorem"))
  println(str.replace(" ", "*"))
  println(str.length)

  val x = 10
  val y = 4
  val exp = s"x: $x + y: $y = ${x + y}"
  println(exp)

}
