package lectures.part2.oop

object Exceptions extends App {
  def getFoo(flag: Boolean): Int =
    if (flag) throw new RuntimeException("Foo error")
    else 45


  val res = try {
    getFoo(false)
  } catch {
    case e: RuntimeException => 9999
  } finally {
    println("Logging foo")
  }

  println(res)
}
