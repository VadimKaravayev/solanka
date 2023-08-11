package lectures.part1.basics

object DefaultArgs extends App {

  def foo(x: String, y: String = "bar"): Unit = {
    println("x: " + x + ", y: " + y)
  }

  foo("quz")

  def bar(x: String = "qoox", y: String = "piqs"): Unit = {
    println("x: " + x + ", y:" + y)
  }

  bar()
  bar(x = "foo")
  bar(y = "baz")
  bar("foo", "bar")

}
