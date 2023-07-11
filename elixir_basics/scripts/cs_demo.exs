#!/opt/homebrew/bin elixir
if 4 > 3 do
  "greater"
else
  "less"
end



if not (5 > 10) do
  "not greater"
end

unless (5 > 10) do
  "not greater"
end

case {:day, "Sat"} do
  {:month, res} -> res
  {:day, res} -> res
  _ -> "Everthing else"
end

pie = 3.14

case "Cherry pie" do
  ^pie -> "Pisdets"
  pie -> "I like #{pie}"
end


case {1, 43, 23} do
  {_, x, y} when x > y  -> "Second greater than next"
  _ -> "Everthing else doesn't matter"
end


nums_map = %{a: 23, b: 89, c: 34}

Map.fetch(nums_map, :a) |> IO.inspect
