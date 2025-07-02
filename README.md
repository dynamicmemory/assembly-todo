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


<b><u><h3>29th of June, 2025<h3><u><b><br><br>
Smooooth, spent the last hour running around the code testing and trying to isolate
where all the problems could be... I realised (finally) that I was passing the file 
descriptor to my file size function, which needs the file name... somehow it was 
working though... NASM things I guess, again, im a GAS boi till this project. So I 
changed that to filename, then the buffer started printing all sorts of weird stuff 
out and I instantly knew I had cooked the file size function... and there it was.. 
I was moving the address of where the file size was to eax and not the actual size..
somehow up until now the app had run almost seamlessly somehow... it really shouldnt 
of. Anyway, changed that, then rewound the point back to the start of the file after 
writing the new line and boom, output problems gone. Feels good, silly mistake, lost 
an hour and a half, maybe longer if you count last night too... oh well, onto the 
delete function (thats the spicest) then we just gotta append a number to the start 
of every line in the file as they are being read out to stdout and we are DONE! 
Which im happy about as I had a new idea for my next project I wanna do.. a tool for 
something I use every day. Unsure if ill write it in assembly or C, anyway im getting 
off topic.

<b><u><h3>1st of July, 2025<h3><u><b><br><br>
Im not sure if i worked on this yesterday and just didnt write here... highly likely.
Ive been so busy, onto whats happening in the project though. So I think I wrote the 
delete functionality yesterday and completely destroyed the program. Today I came in 
and fixed it. Delete works though I was stuck for about an hour and a half trying to 
figure out if my int converter was working... turns out it was and it was edi getting 
pummelled by another function that was throwing all the calculations I was trying to 
do on it off. It just took so long to keep narrowing down each piece... I wrote to much 
at once will limited testing... kinda like what i just did with the writetostdout 
function.... which I will fix tomorrow at which point this project will be finished...
I gotta say, I like GAS alot, NASM has werid quirks to it, GAS feels right, but I 
learnt on it, so thats why I feel like that I guess. I feel a little shakey on how 
im refferencing registers, GAS feels more intuitive again, but also again, im just 
used to it. Im probably just being biased, anyway, hopefully tomorrow this one gets 
put to sleep and I move onto more uni work and maybe that tool I was talking about 
building. 

<b><u><h3>2nd of July, 2025<h3><u><b><br><br>
And its done!... kinda, its fully functional, a few potential errors could occur, 
a few optimization could be made, alot of cleaning up and simplifying to go. But as 
for what it needs to do, it does it and it shouldnt break except for edgeish cases. 
Im very busy with other stuff for the moment so this will probably go on the back 
burner and I may never get back to it, but damn assembly is so much fun and this 
was such a fun learning experience. I feel like I only have scratch the surface 
with instructions and whats possible, but I think that is for future, bigger and 
more useful projects to discover. For now, uni has my full attention and the 10 
languages they got me writting in daily!
