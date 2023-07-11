-- lambda syntax
-- x -> x
-- calling lambda function 
-- (\x -> x) 4

sumSquareOrSquareSum x y = if sumSquare > squareSum
  then sumSquare
  else squareSum
    where sumSquare = x^2 + y^2 
          squareSum = (x + y) ^ 2


fooOrBar x y = (\foo bar -> max foo bar) (x^2 + y^2) ((x + y)^2)

fooOrBarWithLet x y = let foo = x^2 + y^2
                          bar = (x + 2) ^ 2
                        in 
                            if foo > bar then foo else bar

doubleDouble x = (\dubs -> dubs * 2) (x*2)

