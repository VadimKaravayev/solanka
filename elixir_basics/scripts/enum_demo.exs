#!/opt/homebrew/bin elixir


# Capture operator

defmodule Adding do
  def plus_three(num), do: num + 3
end

# W/o capture operator option1
Enum.map([1,2,3], fn(n) -> Adding.plus_three(n) end)

# W/ capure operator
Enum.map([1,3,4], &Adding.plus_three(&1))

# W/ capure operator option 2

Enum.map([1,2,3], &Adding.plus_three/1)

list = ["fo", "bo", "foo", "baa", "bar", "barr"]

list
|> Enum.filter(fn(s)-> String.contains?(s, "b") end)
|> Enum.map(fn(s) -> {String.to_atom(s), String.length(s)} end)



chunker = fn(s) -> String.length(s) end

Enum.chunk_by(list, chunker)

Enum.all?(["foo", "bar", "bazz"], fn(s) -> String.length(s) === 3 end)

Enum.any?(["foo", "bar", "february"], fn(s)-> String.length(s) > 3 end)

# View all functions from Enum
Enum.__info__(:functions)
|> Enum.map(fn({function, arity} ) -> "#{function}/#{arity}\n" end)
