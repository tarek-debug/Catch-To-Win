# Catch-To-Win
This MATLAB script sets up and runs a simple interactive game called "Catch to Win." Here's a detailed description of each part of the code:

1. **Setting Up Figure and Axes**: The code starts by creating a figure window and setting its properties. It turns off the menu bar, number title, toolbar, and gives the figure window a name "catch."

2. **Loading and Resizing the Background Image**: The code loads an image (`background.jpg`) and resizes it to fit the plot. The image is then displayed as the background of the plot.

3. **Axes Configuration**: The axes are scaled from 0 to 200 in the x-direction and 0 to 100 in the y-direction. The y-axis is flipped to its normal direction, and the tick labels are removed. The title "Catch To Win" is set, and a box is drawn around the figure.

4. **Instructions and Labels**: Instructions for playing the game are provided in the x-label, along with a note to use the left and right arrow keys for movement and the shift key to speed up.

5. **Initialization of Counter and Misses**: Global variables are created for keeping track of successful catches (counter) and misses. Corresponding text objects are also created to display these values on the plot.

6. **Creating Falling Circles**: Three initial white circles are created at random x positions, and timers are set up for each circle. The timers repeatedly call the `step_down` function, moving the circles downward at a fixed rate.

7. **Creating the Basket**: A rectangle representing the "basket" is created, with its position and size defined.

8. **Setting Up Key Press Callback Function**: The code sets up a key press callback function (`movePoint`) that enables the player to move the basket left and right using the arrow keys. Holding the shift key while pressing an arrow key increases the movement speed.

9. **Movement Logic**: The `movePoint` function defines the movement logic of the basket, constraining its movement within the figure boundaries.

10. **Falling Logic and Scoring**: The `step_down` function controls the downward movement of the white circles. If a circle intersects with the basket, the counter is incremented. If a circle reaches the bottom without being caught, a miss is recorded.

11. **Game Over Condition**: If the number of misses reaches zero, a "Game Over" text is displayed, and the timers are stopped, ending the game.

12. **Interactions with Falling Circles**: As the circles are caught or missed, they are repositioned to the top at a new random x position.

The overall result of this code is an interactive game where the player tries to catch falling circles with a horizontally movable basket. Instructions are provided, and the game keeps track of successful catches and misses, ending the game if too many circles are missed.
