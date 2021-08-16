# Tutorial Notes

These are my personal notes, outlining the steps that comprise
the tutorial. These are not linked from [the main README file](README.md).

This is just an outline. There are a lot of things to explain
on the way through these points.

## Part 1

1. Drag and drop the logo into the game.
1. Change the label on the HUD from "Time remaining" to "Seconds left".
1. Add a `Timer` to spawn stars each second, connecting a signal
   and using `make_star()`.
1. Stop the star spawn timer when the game is over.
1. Add "yay" animation to main character when the game is over. Play this
   in the player script when it is not `active`.
1. Add "Play Again" button using `reload()`.
1. Only show the "Play Again" button when the game is over.

## Part 2

1. Add a script to the star to make it spin at a fixed rate.
1. Make stars spin at different speeds via local variable randomly initialized.
1. Star explosion scene with `CpuParticles2D`
    1. Disable gravity (gravity `y` => 0)
    1. Direction spread => 180
    1. Amount => 50
    1. Time.Explosiveness => 0.8
1. Spawn explosion when star is touched
1. Revise particle system to be one-shot (in script is best)
1. Play pickup sound when touching star
1. Play theme on the main menu
1. Fly in logo using `AnimationPlayer` 
