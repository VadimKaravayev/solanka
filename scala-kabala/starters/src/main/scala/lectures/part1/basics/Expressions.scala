package lectures.part1.basics

object Expressions extends App {
  val x = 1 + 3
  val aCond = true
  val aCondVal = if (aCond) 5 else 0

  var i = 1

  //Avoid looping in Scala. It produces side effects
  while (i < 10) {
    println(i)
    i += 1
  }

  //Code blocks
  val aBlock = {
    val a = 45 * 4 / 8
    val b = 34 * 7 / 3
    if (a > b) "foo" else "bar"
  }

  println(aBlock)
}
