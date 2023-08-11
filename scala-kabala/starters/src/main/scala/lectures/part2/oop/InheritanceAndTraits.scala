package lectures.part2.oop

object InheritanceAndTraits extends App {
  class Foo(a: Int)
  class Bar(a: Int, b: Int) extends  Foo(a: Int)


  abstract class Feature {
    val code: String
  }
  abstract class Dimension {
    val width: Double
    val height: Double
    val depth: Double
  }

  trait Measurable {
    def measure: Double
  }

}
