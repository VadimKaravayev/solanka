package lectures.part1.basics

import scala.annotation.tailrec

object Recursion extends App {
  //Tail recursion

  def concat(x: String, times: Int): String = {
    @tailrec
    def recur(y: String, n: Int, acc: String): String = {
      if (n == 0) acc
      else recur(y, n - 1, acc + y)
    }
    recur(x, times, "")
  }

  def isPrime(n: Int): Boolean = {
    @tailrec
    def isPrimeTailrec(t: Int, isStillPrime: Boolean): Boolean = {
      if(!isStillPrime) false
      else if (t <= 1) true
      else isPrimeTailrec(t - 1, n % t != 0 && isStillPrime)
    }
    isPrimeTailrec(n / 2, true)
  }

  def fibonacci(n: Int): Int = {
    @tailrec
    def fibTailRec(t: Int, last: Int, nexToLast: Int): Int = {
      if (t >= n) last
      else fibTailRec(t + 1, last + nexToLast, last)
    }
    if (n == 0) 0
    else if (n <= 2) 1
    else fibTailRec(2, 1, 1)
  }

  println(fibonacci(6))
}
