# Post-Workshop Challenges: Part 1

Did you follow along with the tutorial? Here are some challenges for you to try next!
The first few are pretty easy and involve working with the editor, but the later ones
require you to do some programming too.

1. Modify the idle animation of the `Player.tscn` scene so that
   if he stands still, he does a funny dance or something similar.

1. Replace the star with a different image, something that you think the
   character should be collecting.

1. Come up with a better name for the game and replace the logo
   in the `MainMenu.tscn` scene.
   You can add your own images to the `assets` folder of the project,
   right alongside the ones that are already there.

1. Give the player a time bonus when they collect a star.
   That is, when you gain a star, add a value to the <code>wait_time</code>
   of the game timer.

1. To add more challenge, make the stars remove themselves after a few seconds.
    - You can add a timer to the `Star` scene and give it a default
      wait time that you think will be fun. Set the timer to auto-start.
    - Switch from the &ldquo;Inspector&rdquo; view to the &ldquo;Node&rdquo; view
      and connect to the `timeout` signal to the `Star` script.
      This will give you a function whose implementation you can change.
    - If a script calls the function `queue_free()`, the object
      will remove itself from the game.

1. Add another kind of collectible that is worth more points,
   or one that gives you negative points.
    -  One way to do this is to duplicate the `Star.tscn` scene but
       use a different image. Then, in the `Level.gd` script,
       copy the `make_star` function and have it load your new
       scene instead of `Star.tscn`.