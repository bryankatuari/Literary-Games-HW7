// Initialize player obedience level
VAR obedienceLevel = 0
-> start
// The beginning of the story
=== start ===
You wake up in a dimly lit room, with no memory of how you got there. 
"The way out is through the blue door," the narrator intones.
*   [Go through the blue door] -> obey
*   [Go through the red door instead] -> disobey

// Player obeys the narrator
=== obey ===
{increase_obedience()}
The blue door leads you to a serene garden. "Well done," the narrator says. "Now, find the silver key."
*   [Search the fountain] -> fountain
*   [Search the old oak tree] -> oak_tree

// Player disobeys the narrator
=== disobey ===
{decrease_obedience()}
The red door leads to a dark, winding corridor. "Curious choice," the narrator remarks dryly.
*   [Return to the blue door] -> obey
*   [Continue down the corridor] -> deep_corridor

// Function to increase obedience
=== function increase_obedience ===
~ obedienceLevel = obedienceLevel + 1

// Function to decrease obedience
=== function decrease_obedience ===
~ obedienceLevel = obedienceLevel - 1

// Searching the fountain
=== fountain ===
You find nothing but cold water. "Not everything is as it seems," the narrator muses.
*   [Return to the garden] -> garden

// Searching the old oak tree
=== oak_tree ===
Nested among the roots, you find the silver key. "Ah, clever," the narrator approves.
-> key_found

=== key_found ===
hi
-> END
// Deep into the corridor
=== deep_corridor ===
The corridor ends at a locked door. "You seem lost," the narrator observes.
*   [Search for a key] -> search_corridor
*   [Go back] -> garden

// Searching the corridor
=== search_corridor ===
You find a golden key, but it doesn't fit the lock. "Not all that glitters is gold," the narrator quips.
*   [Head back] -> garden

// Back to the garden with or without the key
=== garden ===
You're back in the garden. The silver key gleams in the moonlight, should you have it.
*   {obedienceLevel > 0} [Use the silver key] -> escape
*   [Continue exploring] -> explore_garden

// Exploring the garden further
=== explore_garden ===
You discover a hidden path leading to a secret garden. "You do enjoy going off the beaten path," the narrator comments.
*   [Follow the path] -> secret_garden
*   [Return to the main garden] -> garden

// Secret garden discovery
=== secret_garden ===
The secret garden is breathtaking, with an air of magic. "There's more to this place than meets the eye," the narrator whispers.
*   [Stay and explore] -> stay_in_secret_garden
*   [Go back] -> garden

// Staying in the secret garden
=== stay_in_secret_garden ===
As you explore, you find a mysterious, glowing orb. "You've found something truly special," the narrator says, a note of respect in their voice.
-> end_game

// Escape the garden
=== escape ===
Using the silver key, you unlock a gate hidden amongst the foliage and step through. "Freedom is yours, at last," the narrator says, a hint of sadness in their voice. "Or is it just another beginning?"
-> end_game

// The end of the game
=== end_game ===
The world fades to black. "Thank you for playing," the narrator concludes. "Until next time."
-> END

