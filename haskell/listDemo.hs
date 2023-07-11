doubleNum x = (if x < 100 then x * 2 else x) + 1

concat a b = a ++ b
cons x xs = x:xs
getByIndex xs i = xs !! i
first xs = head xs
rest xs = tail xs
lastOne xs = last xs
allButLast xs = init xs
howLong xs = length xs
isEmpty xs = null xs

dayOfWeek :: (Integral a) => a -> String
dayOfWeek 1 = "Monday"
dayOfWeek 2 = "Tuesday"
dayOfWeek 3 = "Wednessday"
dayOfWeek a = "Unknow day"

whatYouDrink :: (Integral a) => a -> String
whatYouDrink age 
 | age > 50 = "You drink beer"
 | age > 40 = "You drink kognac"
 | age > 30 = "You drink whiskey"
 | otherwise = "You drink whatever you want"

responsiveDesign :: (RealFloat a) => a -> a -> String
responsiveDesign width baseFont 
 | currWidth <= mobile = "Styles for mobile"
 | currWidth <= table = "Styles for table"
 | currWidth >= desktop = "Styles for desktop"
 | otherwise =  "Unsupported screen"
 where currWidth = width / baseFont
       mobile = 50
       table = 90
       desktop = 120
