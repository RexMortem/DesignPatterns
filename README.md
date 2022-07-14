# DesignPatterns

Design Patterns are intended to organise your code to make it easier to manage and more readable! 

They're called "patterns" because they are often implemented in response to a common software problem (so they appear in certain states, which could be called patterns); you would see the pattern of seeing design pattern A whenever you encounter state B and problem C. 
They're not exactly a band-aid problem to all problems, but they are designed to help cover a lot of common cases and make life easier

Think of it as the software engineer's equivalent tool-set to the competitive programmer's basic algorithms like dynamic programming, and greedy algorithms; they're not something you necessarily keep in a module but more like broad concepts or ways of solving the problems that are beneficial and so far seen as optimal (or close-to!)

However, they're not viewed as perfect and have been criticised a fair amount. For instance, some patterns are seen as unnecessary in functional languages (and modern languages with that functionality) and out-dated. See this talk for one such argument: https://www.deconstructconf.com/2017/brian-marick-patterns-failed-why-should-we-care

Not only does it present interesting views, it goes into the history of Design Patterns and where the Gang of Four (GoF) got their idea from; the seminal architectural phenomenon A Pattern Language. He then draws parallels between A Pattern Language and the inspired Design Patterns and analyses where they differ and how that led to Design Patterns being less respected in later years. 

On the patterns themselves, they're broadly split into 3 categories traditionally (however others have split them into different categories):

-Creational patterns, 

-Structural patterns

-Behaviour patterns

In this repository, if you are not familiar with metatables and OOP in Lua, I would recommend reading ClassesInLua.Lua first which provides an explanation (although maybe too wordy on my part) on the relevant mechanisms. This is because many of the patterns revolve around this
