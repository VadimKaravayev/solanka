inc :: Num a => a -> a
inc n = n + 1

double :: Num a => a -> a
double n = n + n 

square :: Num a => a -> a
square n = n * n 

bigboss :: Integral a => a -> a
bigboss n = if even n then n - 2 else 3 * n + 1