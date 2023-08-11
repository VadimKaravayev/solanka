package lectures.part2.oop

object Generics extends App {

  class MyList[A]:
    def add[B >: A](element: B): MyList[B] = ???

  class MyMap[Key, Value]

  object MyList {
    def empty[A]: MyList[A] = ???
  }

  class Animal
  class Dog extends Animal
  class Cat extends Animal

  class CovariantList[+A]
  val covariantList: CovariantList[Animal] = new CovariantList[Cat]



  class InvariantList[A]
  val invariantList: InvariantList[Animal] = new InvariantList[Animal]

  class CounterVariantList[-A]
  val counterVariantList: CounterVariantList[Cat] = new CounterVariantList[Animal]

  //bounded types. A must be any subclass of Animal
  class Cage[A <: Animal](animal: A)


}
