# Palindrome.java

This is a simple palindrome web app written in Java.

A palindrome is defined as "A word, line, verse, number, sentence, etc.,. reading the same backward as forward"

The player will be able to submit an English string as well as their
name to the server. 
  - If the sentence is a palindrome the palindrome score is hald fhte
    lenght of the palindrome, rouned up.
  - The player's total score must be increased by palindrome score.
  - If it is a new player, create a record storign: player name, total
    score, highest palindrome score.
  - If it is an existing player, update the total score in teh player
    record and score of the highest scoring palindrome if appropriate.
  - Details are held in memory while the application is running and do
    not need to be persisted to a file or database.

The app must be thread safe, as multiple users may be access it at once.
The player also has the possibility of getting into the "Hall of Fame",
which is displayed on a web page and list: 
  - The 5 best players ranked by total score
  - The 5 best players ranked by highest palindrome score

## Example Palindromes

  - "Level"
  - "Never odd or even"
  - "Too bad - I hid a boot"
  - "A man, a plan, a cat, a ham, a yak, a yam, a hat, a canal - Panama!"

More here: http://www.derf.net/palindromes/old.palindrome.html


## Dependencies
  Google GSON http://code.google.com/p/google-gson/
  
```
  $ wget http://google-gson.googlecode.com/files/google-gson-2.1-release.zip
  $ unzip google-gson-2.1-release.zip
  $ cp google-gson-2.1/gson-2.1.jar war/WEB-INF/lib/
```
