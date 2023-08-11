package lectures.part2.oop

import scala.annotation.targetName

abstract class MyList[+A] {
  def head: A
  def tail: MyList[A]
  def isEmpty: Boolean
  def add[B >: A](item: B): MyList[B]
  def printElements: String
  override def toString: String = s"[ $printElements ]"
  def map[B](transformer: MyTransformer[A, B]): MyList[B]
  def flatMap[B](transformer: MyTransformer[A, MyList[B]]): MyList[B]
  def filter(predicate: MyPredicate[A]): MyList[A]

  def ++[B >: A](list: MyList[B]): MyList[B]
}

object EmptyList extends MyList[Nothing] {
  override def head: Nothing = throw new NoSuchElementException
  override def tail: MyList[Nothing] = throw new NoSuchElementException
  override def isEmpty: Boolean = true
  override def add[B >: Nothing](item: B): MyList[B] = new Cons(item, EmptyList)
  def printElements: String = ""
  override def ++[B](list: MyList[B]): MyList[B] = list

  override def map[B](transformer: MyTransformer[Nothing, B]): MyList[B] = EmptyList

  override def flatMap[B](transformer: MyTransformer[Nothing, MyList[B]]): MyList[B] = EmptyList

  override def filter(predicate: MyPredicate[Nothing]): MyList[Nothing] = EmptyList
}

class Cons[+A](h: A, t: MyList[A]) extends MyList[A]:
  override def head: A = h

  override def tail: MyList[A] = t

  override def isEmpty: Boolean = false

  def printElements: String =
    if (t.isEmpty) s"$h"
    else s"$h ${t.printElements}"

  override def map[B](transformer: MyTransformer[A, B]): MyList[B] =
    new Cons(transformer.transform(h), t.map(transformer))

  override def flatMap[B](transformer: MyTransformer[A, MyList[B]]): MyList[B] =
    transformer.transform(h) ++ t.flatMap(transformer)

  override def filter(predicate: MyPredicate[A]): MyList[A] =
    if (predicate.test(h)) new Cons(h, t.filter(predicate))
    else t.filter(predicate)

  override def ++[B >: A](list: MyList[B]): MyList[B] =
    new Cons(h, t ++ list)

  override def add[B >: A](item: B): MyList[B] = new Cons(item, this)

trait MyPredicate[-T] {
  def test(elem: T): Boolean
}

trait MyTransformer[-A, B] {
  def transform(elem: A): B
}

object ListTest extends App {
  val ints: MyList[Int] = new Cons(1, new Cons(2, new Cons(3, EmptyList)))
  val strs: MyList[String] = new Cons("foo", new Cons("bar", new Cons("Baz", EmptyList)))

  println(ints.toString)
  println(strs.toString)

}