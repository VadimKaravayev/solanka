package lectures.part2.oop

object Enums extends App{
  enum Permissions {
    case READ, WRITE, EXECUTE, NONE
  }

  val permission: Permissions = Permissions.READ


  enum Foo(a: Int) {
    case QUX extends Foo(1)
    case BAZ extends Foo(2)
    case QOOQ extends Foo(3)
  }
}
