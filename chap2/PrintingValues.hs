--commonWords :: Int -> String -> String

cwords :: Int -> FilePath -> FilePath -> IO()
cwords n infile outfile
= do {text <- readFile infile;
writeFile outfile (commonWords n text);
putStrLn "cwords done!"}

readFile :: FilePath -> IO String
writeFile :: FilePath -> String -> IO ()

main
= do {putStrLn "Take text from where:";
infile <- getLine;
putStrLn "How many words:";
n <- getLine;
putStrLn "Put results where:";
outfile <- getLine;
text <- readFile infile;
writeFile outfile (commonWords (read n) text);
putStrLn "cwords done!" }
