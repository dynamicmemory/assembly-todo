<h1>A TODO list in Assembly</h1>

That's right, due to the blazingly fast speed I develop at, I needed to write an 
app that could keep track of what i'm doing and keep up with just how fast I am, 
therefore I had no choice but to write a todo list cli tool in assembly, the only
language capable of keeping up with me! <br><br>

<h2>Developer log</h2>

<b><u><h3>25th of June, 2025<h3><u><b><br><br>
I have mostly written this already in gas over here:<br> 
- https://github.com/dynamicmemory/side-projects/tree/main/assembly-todo-list <br>
For my operating systems class I have to code in nasm, so I thought this would be a 
good quick project  to help me switch up the syntax in my brain. This project was so much 
fun to write the first time and this time I plan on trying to split up the code more 
and simplify the design. I don't have a great deal of time at the moment so hopefully
this doesn't take too long... but I love writting in assembly so really I don't mind
sinking all my free time in here. 

<br><br>

<b><u><h3>27th of June, 2025<h3><u><b><br><br>
Skipped a day yesterday, had some "tough" AI code to write for uni... ok it wasn't 
tough, but I was struggling so my free time went there yesterday. Anyway as for this
project, another hour put into it and its coming along nicely. Read, write, newline,
command, cleanbuffer, trying to think of what else was implemented tonight... Pretty 
simple coming from gas to nasm, nasm has some things i like for sure, mainly not having 
to throw a % every other key, but not labelling things with $ or % feels a little to 
free in the language. Getting used to different keywords and derefferencing memory. But 
its not to hard, i fucking love writting in assembly, the goated language. That's all 
I got, nothing interesting today really. When i tackle delete and write2std... that 
will be the interesting day (maybe) I remember both being a little tricky. 


<b><u><h3>28th of June, 2025<h3><u><b><br><br>
So tired, bugs galore. Wrote the add logic for a new line but now having file print 
out issues in the terminal. The way you clear the terminal in nasm from gas is a 
bit different and isnt behaving the same. Everytime i try to add a new line it adds 
the 'a' command from selecting add and it adds the new line to the file and to the 
stdout even though i clear it after adding the line and right before i write the new 
version of the file to the stdout... im sure its my own misunderstanding of some 
voodu io stuff, but I didnt have this problem in gas, my understanding was on point 
for it. Problem now is i had a huge day and im to tired to bash my head against the 
wall even though I want to solve it... a task for tomorrow!
