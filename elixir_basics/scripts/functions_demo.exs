# Anonymous functions

sum = fn a,b -> a + b end
subtr = fn a,b -> a - b end
divide = fn a, b -> a / b end
multipl = fn a,b -> a * b end

sum.(3, 4)
#The way you can refer to the result
subtr.(12, 2) |> (&(IO.puts "Subtr: #{&1}")).()
divide.(23, 4)
multipl.(2, 9)

# shorthand
sum_v2 = &(&1 + &2)
subr_v2 = &(&1 - &2)
divide_v2 = &(&1 / &2)
multipl_v2 = &(&1 * &2)

sum_v2.(4, 6)
subr_v2.(40, 4)
divide_v2.(40, 2)
multipl_v2.(4, 3)

# Pattern matching

handle_result = fn
  {:year, year} -> "Year #{year}"
  {:day, day} -> "Day #{day}"
  _ -> "Anything else"
end

handle_result.({:day, "Monday"})

# Named function. They can be declared only in modules
# 1.Create a module
# 2. Declare a function

defmodule Calculator do
  def add(a, b) do
    a + b
  end

  def subtract(a, b) do
    a - b
  end
  # shorthand declaration: name and params comma do: logitiply(a, b), do: a * b
  def multiply(a, b), do: a * b
end

Calculator.add(4, 8)
Calculator.subtract(4, 1)
Calculator.multiply(4, 6)

# Combining pattern matching, param overloading and recursion

defmodule Length do
  def of([]), do: 0
  def of([_ | tail]), do: 1 + of(tail)
end

Length.of([]) |> IO.puts
Length.of([1,2,3]) |> IO.puts
