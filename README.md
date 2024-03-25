Your challenge this time can be easy or hard depending on how far you want to take it, but at its core the project is simple: you need to build an app that helps users roll dice then store the results they had.

At the very least you should lets users roll dice, and also let them see results from previous rolls. However, if you want to push yourself further you can try one or more of the following:

1. Let the user customize the dice that are rolled: how many of them, and what type: 4-sided, 6-sided, 8-sided, 10-sided, 12-sided, 20-sided, and even 100-sided.
1. Show the total rolled on the dice.
1. Store the results using JSON or SwiftData – anywhere they are persistent.
1. Add haptic feedback when dice are rolled.
1. For a real challenge, make the value rolled by the dice flick through various possible values before settling on the final figure.
1. When I say “roll dice” you don’t need to create fancy 3D effects – just showing the numbers that were “rolled” is fine.

The only thing that might cause you some work is step 5: making the results flick through various values before settling on the final figure. The easiest way to tackle this is through a Timer that gets cancelled after a certain number of calls.
