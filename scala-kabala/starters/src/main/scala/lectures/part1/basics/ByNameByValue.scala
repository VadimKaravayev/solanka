package lectures.part1.basics

object ByNameByValue extends App {
  def callByValue(x: Long): Unit = {
    println("Call by value: " + x)
    println("Call by value: " + x)
  }

  def callByName(x: => Long): Unit = {
    println("Call by name: " + x)
    println("Call by name: " + x)
  }



  callByValue(System.nanoTime())
  callByName(System.nanoTime())



}
