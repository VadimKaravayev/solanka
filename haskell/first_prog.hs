main :: IO()
main = do
    print "Who is the email for?"
    recipient <- getLine
    print "What is the title?"
    title <- getLine
    print "Who is the author?"
    author <- getLine
    print (createEmail recipient title author)

toPart :: [Char] -> [Char]
toPart recipient = "Dear " ++ recipient ++ ", \\n"

bodyPart :: [Char] -> [Char]
bodyPart title = "Thanks for buying " ++ title

fromPart :: [Char] -> [Char]
fromPart author = "\nthanks,\n" ++ author

createEmail :: [Char] -> [Char] -> [Char] -> [Char]
createEmail recipient title author = toPart recipient ++
                                     bodyPart title ++
                                     fromPart author