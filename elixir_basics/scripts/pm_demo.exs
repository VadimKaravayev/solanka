#!/opt/homebrew/bin elixir

# = oprator is actually a match operator

x = 1
1 = x

list = [111,2,3,4,5]

[111 | tail] = list



[_,_,foo | _] = [1,2,3,4,5]

IO.inspect foo
