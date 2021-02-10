# Post-Workshop Challenges: Part 2

Did you follow along with part 2 of the tutorial? Here are some challenges for
you to try next! Just like [the Part 1 challenges](Challenges-1.md), 
some are easy, and some will really test your knowledge.

1. Randomize the direction that the stars spin.

1. Customize the explosion effect&mdash;go crazy with it!

1. Add a sound effect that plays at the start of the game.
   For example, record yourself telling the player to get as many
   stars as they can.

1. Write some music and use it as background music for the gameplay level.

    - There are lots of tools to support this. I happen to like
      [LMMS](https://lmms.io) because I have a background in music. Another
      popular choice for quick, free loops is [Beep
      Box](https://www.beepbox.co/).

1. Use an `AnimationPlayer` to make the stars fade in or change colors.

1. When the game is over, if the player gets more than five stars, play
   a fireworks show.

     - I would start by making a single firework effect in its own scene. Then,
       look at how the stars are created in random positions in `Level.gd`. 
       Copy that function so that it instances your firework scene in random
       positions on the board.