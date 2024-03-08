// Initialize player obedience level
VAR obedienceLevel = 0
You wake up in a dimly lit room, with no memory of how you got there. 
"Steven woke up in a daze, unsure of where he was." a narrator intones, "He was faced with two doors, he decided to open the blue door."
-> start

// The beginning room
=== start ===
*   [Go through the blue door] -> obey
*   [Go through the red door instead] -> disobey
*   [Stay put] -> ignore
* {ignore} [Stay put] -> ignore_more
* {ignore_more} [Dilly dally] -> dilly_dally
* {dilly_dally} [Wait for the bear] -> bear

// Player ignores the narrator
=== ignore ===
"Steven pondered for a bit, chained by the shackles of choice, not knowing that they both lead to the same room. He eventually decided to go through the blue door."
-> start

=== ignore_more ===
{decrease_obedience()}
"Steven, still stunned by choice as a result of being a stupid dumb boy, was unaware that if he were to dilly dally any longer, a bear would appear and eat him."
-> start

=== dilly_dally ===
{decrease_obedience()}
"Steven. A bear will come and eat you. I'm not joking, this isn't a bluff or empty threat. Go through the blue door."
-> start

=== bear ===
{decrease_obedience()}
As you stand idly in the empty room in defiance of the narrator, the red door slowly opens, revealing a deadly grizzly bear.
Only that it's just a cutout of a grizzly bear with the number 1015 written on it.
"C'mon Steven, let's just move on.", the narrator says in defeat.
-> start

// Player obeys the narrator
=== obey ===
{increase_obedience()}
{once: "Steven arrived at a long room full of numbered drawers and a locked door at the end. He would have to check every single drawer to find the key. If only he knew that drawer number 56 had the key."}
*   [Search drawer 56] -> drawer_56
*   [Search a random drawer] -> random_drawer
*   {bear} [Look for drawer 1015] -> drawer_1015

// Player disobeys the narrator
=== disobey ===
{decrease_obedience()}
The red door leads to a dark, winding corridor. "Curious choice," the narrator whispers to himself dryly. "It seems that Steven made a mistake and went through the blue door, he turned back and returned to go through the blue door."
*   [Return to the blue door] -> obey
*   [Continue down the corridor] -> deep_corridor

// Function to increase obedience
=== function increase_obedience ===
~ obedienceLevel = obedienceLevel + 1

// Function to decrease obedience
=== function decrease_obedience ===
~ obedienceLevel = obedienceLevel - 1

// Searching the fountain
=== drawer_56 ===
{increase_obedience()}
You check drawer number 56 and find a key. "By sheer miracle Steven found the key in drawer number 56.", the narrator exclaims, "Having found the key, Steven moved through the locked door."
*   [Open the locked door] -> sad_room

// Searching the old oak tree
=== random_drawer ===
{decrease_obedience()}
You open a random drawer. Only to find nothing in it. "Steven tried opening a random drawer, to no avail. Maybe there's a chance he opens drawer 56. The one with the key."
-> obey

=== drawer_1015 ===
You walk around the massive room filled with labelled drawers until you spot drawer number 1015. You open it to find a silver key.
-> obey

-> END
// Deep into the corridor
=== deep_corridor ===
The corridor ends at a door. You go through it. "Steven had an air about him, an air of someone who was incapable of following basic instructions. If only he knew that both doors led to the same room and his defiance was utterly pathetic and useless.
-> obey

// Back to the garden with or without the key
=== sad_room ===
You arrive in a bleak and soulless room. With naught but a locked door and a sign that says "Congratulations". "Congratulations, you have won the game Steven! Now you get to sit here and relish in your achievement, reminiscing about your grand adventure.", the narrator exclaims as a pathetic amount of confetti pops out.
    {obedienceLevel < -2} -> final_straw
*   {drawer_1015} -> escape
*   [Sit here for all eternity] -> END

// Escape the garden
=== escape ===
You walk towards the locked door and try your silver key on it. "Wait Steven where are you going?", the narrator asks in confusion as you turn the key and open the door. You walk away from all the instructions, rooms, disembodied voices and towards... freedom?
-> END

=== final_straw ===
You suddenly find yourself in a completely new room, with a green door to your left and purple door to your right. "Okay Steven, I've had it with you, this is your final chance to make it up to me.", the narrator sighed, "Steven walked through the purple door."
* [Go through the green door] -> prison
* [Go through the pruple door] "Thank you Steven. Now let's just get on with it. -> sad_room

=== prison ===
You walked up to the green door and opened it, walking through into the next room. You notice the door behind you disappeared, revealing a room with nothing but 4 walls, a ceiling and a floor. 

"I tried Steven, I really did."

+ [Wait] -> prison