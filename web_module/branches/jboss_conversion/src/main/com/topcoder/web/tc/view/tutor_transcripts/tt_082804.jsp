<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>Tutor Transcripts</title>

<jsp:include page="../script.jsp" />

</head>

<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="education"/>
                <jsp:param name="level2" value="tutor_transcripts"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
         <td width="100%" align="center">

         <div class="tutorBody">

            <h2>SRM 208 Tutor Transcript</h2>

			<table width="100%" border="0" cellspacing="0" class=bodyText>
				<tr><td class=tutorHeader>Handle</td><td width="100%" class=tutorHeader>Comment</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>Hello</td></tr>
<tr><td class=tutorEven><b>Bbazzarrakk</b></td><td class=tutorEven>Howdy.</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>anyones cares to explain a solution for the Div 1 - 1000 ?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>I already tried</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>I could give it a shot.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>I can try to explain my solution again</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>let's let kalmakka start</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>from the beginning</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>kalmakka: OK, your try</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>nicka81: you solved it during contest ;-)</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>It is a DP solution. You fill out columns one at a time</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>kalmakka: and I'm not</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>hopefully there's more to it than that</td></tr>
<tr><td class=tutorEven><b>Wernie</b></td><td class=tutorEven>Wernie: hey, you can talk to yourself (sorry for spamming *g*)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>hehe</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>When you are done with a column you have already filled out some squares in the next column. Use a bitmask to represent these and fill out the missing ones (thus beginning to fill out the third column as well)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>kalmakka: ok, how exactly do you go about "filling a column"?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>kalmakka: how many data do you need to index DP array ?</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>Keep an array of number of ways to solve the remainder given width/mask.</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>To fill out a column I use a straight DFS.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>kalmakka: mask for one column only ?</td></tr>
<tr><td class=tutorEven><b>Dan[Popovici]</b></td><td class=tutorEven>can you tell us exactlywhat data structure you keep for your DP ?</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>The array contains masks for one column only</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>kalmakka: mask - current row, amask - next row ?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>kalmakka: am I right ?</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>I use a plain array double[w][2^h]</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>kalmakka: ok, when I hear DFS, I think "graph" ... but this is a problem about blocks and rectangles and such... where's the graph?</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>Does anyone know who wrote the problem set?  (It felt like a Rustyoldman set, but I didn't stick around after the match to find out for sure.)</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>When you find an empy position in a column, you try all four ways of positioning a piece to cover in. Then do recursive calls.</td></tr>
<tr><td class=tutorEven><b>FatClimber</b></td><td class=tutorEven>What is the maximum value the function can return? Why choose the return type as a double???</td></tr>
<tr><td class=tutorOdd><b>monsoon</b></td><td class=tutorOdd>ok, so I have a question: why snewman's solution fits in 64MB?</td></tr>
<tr><td class=tutorEven><b>Wernie</b></td><td class=tutorEven>BradAustin: i wrote it</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>This is basicly the same as DFS.</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>Thanks.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>kalmakka: OK, I understand you solution</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>kalmakka: ah, ok, I see... so in the DFS you need to keep track of two rows, but for the DP you only need one</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: not fully correct</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: he remembers only intermediate results</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>monsoon: were you there when lars was talking about that?</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>Yes. The DFS (go routine) uses masks for this column and the next column.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: when DFS is made, results are not memorized</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>neato</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>so that's how it's part brute force</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Dan[Popovici]: you understanding at all?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: that's why I had some problems</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: I tried to memorize all results</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: using 2 rows as index in hash table</td></tr>
<tr><td class=tutorEven><b>monsoon</b></td><td class=tutorEven>Ryan: yes, but I don't remember any conclusions...</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>I wasn't sure if my solution would time out on the larger sets, but I figures I could hardcode in those solutions. I didn't have to though.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: it exceeds memory limit without hacking</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>monsoon: we think that it's something C# specific, but don't know it enough</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>any C#er's in the room?</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>kalmakka: how long did it take to run?</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>4.6 seconds on 18x15</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>So, the yellows and blues have been pretty silent</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>looking over the code? totally confused?</td></tr>
<tr><td class=tutorOdd><b>lordbogy</b></td><td class=tutorOdd>could someone explain the solution for the 500?(the short one):)</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>kalmakka: mine one takes the same time - 4.630 secs ;-)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>Ok, the 500</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>How do you like my new 500 submission? It doesn't even use PI :)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>Basically all "maximal cylinders" have the same proportion</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>kalmakka: See mine in the practice room - similar but even simpler.</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>because it's the shape that makes it have that quality, so it doesn't matter what the particular volume is</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>what do you mean?</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>BradAustin: That was pretty compact.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: I don't how other coders got the solution</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: but I think this problem is more of math than programming</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>kalmakka: I did it the same way in the match.</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>ok, lets say you had the same question, except it was "given an area of a rectangle, what is the minimal perimeter"</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Well, the best such rectangle will always be a square</td></tr>
<tr><td class=tutorOdd><b>Wernie</b></td><td class=tutorOdd>its an optimization problem (500), so you can use dervition to find the extremal valuv</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Wernie: yes, you have fixed volume</td></tr>
<tr><td class=tutorOdd><b>monsoon</b></td><td class=tutorOdd>kalmakka: pow(10.0,2.0) scares me</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Wernie: so you can substitute one variable through another</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Wernie: like this h = Const/(r*r)</td></tr>
<tr><td class=tutorEven><b>Wernie</b></td><td class=tutorEven>yeah, but you still need that const</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>So, to find the perimeter you just take the square root of the area (one side) and multiply by 4</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>monsoon: It's the number from the test case :)</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>then you just get Surface = Func(r)</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>you get derivated F'(r)==0</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>to determine minimum point</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>i.e. radius value for minimal surface</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>that's it</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>h = vol/(pi*r*r)</td></tr>
<tr><td class=tutorOdd><b>Wernie</b></td><td class=tutorOdd>actually i was surprised that almost all coder got that quickly</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>But in this problem, you have a cylinder. So instead of the side/side ratio being 1 (as in the rectangle case), your radius/height ratio will the same</td></tr>
<tr><td class=tutorOdd><b>Wernie</b></td><td class=tutorOdd>i thought quite some would  have forgotten</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>s = 2*pi*r*(r+h)</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>#NAME?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>sorry</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>2*pi*r(r+vol/(pi*r*r))</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>Ryan: why does side/side ratio=1 imply that the permiter will be min?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>=2*pi*r^2+2*vol/r</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>lordbogy: just take derivative of this function</td></tr>
<tr><td class=tutorOdd><b>BradAustin</b></td><td class=tutorOdd>All you have to know to solve the 500 is that the can is the same shape regardless of size, that the volume squared is proportional to the surface area cubed, and the result for one input (and there are two examples given).</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lordbogy: Ok, lets say that you are given an area of say 10</td></tr>
<tr><td class=tutorOdd><b>BradAustin</b></td><td class=tutorOdd>You just scale the first example.</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>Ryan: ok</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: ...well, just to make it easy, say the area is 9</td></tr>
<tr><td class=tutorEven><b>Im2Good</b></td><td class=tutorEven>volume?</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: and since it's an example, they say "the best solution is square of side 3"</td></tr>
<tr><td class=tutorEven><b>Im2Good</b></td><td class=tutorEven>or surface?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: unfortunately you may lose precision</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>Why?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: if input parameters may differ significantly</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BradAustin: because answer for example test cases</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: is not precise</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Im2Good: we're talking about "minimizing perimeter of a rectangle of given area"</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: it has some deviation</td></tr>
<tr><td class=tutorEven><b>Im2Good</b></td><td class=tutorEven>oh</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: if you get much larger input value</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BradAustin: you will increase deviation appropriately</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: well, if the area was 25</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lordbogy: we could just change the units of measure</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: and result will not fit to 1e-9 error</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BradAustin: so, this solution is not clean</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: and say 25 square feet is the same as 9 square centimeters (not using actual conversion factors)</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>I'm not really sure what you mean.  That's the way I did it in the match, and it was precise enough by a wide margin.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: yes, you did</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BradAustin: because input values were sufficiently small</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: so all we did was change the way we measured it, but the end result will still be a square</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>nicka81: Here it is of course good enough. But I've seen some ACM problems where the solution is obviously proportianal to the square fo the input or something like that and the only testcases you are given have solutions like 0.002</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin:</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lordbogy: Of course this depends on us knowing that the solution to the example was a square (which we only know because they told us)</td></tr>
<tr><td class=tutorOdd><b>BradAustin</b></td><td class=tutorOdd>Okay, so you're talking about the n^(2/3)?</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>That's where you lose the preciesion?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: if volume can be, for example, greater then 1e20</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lordbogy: still lost?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: you solution will not make it</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>Ryan: oh. so assuming that for an example the solution is a square.. then any area we have could be the same just that in other unit measure, right?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: I mean that answer given in the example test case</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>Hmmm.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: is not precise</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>Ryan: it is sort of an analogy,,</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: exactly</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BradAustin: it have some epsilon - difference from real answer</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BradAustin: this difference is smaller than 1e-9</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lordbogy: Yeah, the key idea is that the proportions are the same, even if actual measurements differ</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>nicka81: As long as that epsilon is considerably less then 1e-9 it doesn't matter.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BradAustin: but it may grow if you just extrapolate it</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: And this is an idea that gets used (overused?) in the physics world a lot</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>Ryan: ok.</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>kalmakka: that trick, BradAustin did, usually doesn't work for ACM problems</td></tr>
<tr><td class=tutorEven><b>lordbogy</b></td><td class=tutorEven>Ryan: thanks</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: so, if you know this and looked at their example , then you see that h=2r</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>How about the 300 point problem.  Did everyone decide to write a helper class for this or did some sort right on the values?</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>lordbogy: and you can plug that into the equations to get an answer</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BEHiker57W: no additional classes needed</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>nicka81: Yeah. That was what I meant. But in those they usually demands an absolute precission instead of relative precission. With relative precission it is a lot easier.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lordbogy: (or you can follow the other discussion and use calculus to get the actual answer the "right" way)</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>BEHiker57W: if you are C++ coder</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BEHiker57W: you can use STL pair</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>nicka81: Or, actually, more likely too succeed.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BEHiker57W: to store command information</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>nicka81: Nice for the C++'ers.  It really needs a new class in Java.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>BEHiker57W: and then use sort() to arrange commands appropriately</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>sry, bit late.  what was the question about snewman's 1k with the memory in C#?  I'll have a look and see if I can explain.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>I suggest using classes on problems like the 300</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>The calculus solutions is as folows:  = pi*r^2*h -&gt; h = v/(pi*r2).   S = 2*pi*(r^2 + rh) = 2*pi*(r^2+V/(pi*r)).  dS/dr = 2*pi(2*r-v/(pi*r^2)) = 0  -&gt; r^3 = V/(2*pi) . Then substiture for r in formula for surface area.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>a) it makes the code cleaner</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: it will take a little more time to code</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>b) it's easier to think about</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Ryan: at least in C++</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: you will have to define class operators</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>nicka81: true, but if you goof up (which I do) it's easier to debug</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>classes are definately the way to think about it</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>even if you use a lower level solution</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>I agree with Ryan on that.  I used to do it without making classes, but I made too many mistakes.  now I always uses classes for those sorts of problems.</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>But here the pair template class will not do the operators correctly either.</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>even if it does take a bit longer.</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>I have a question about the div 1- 1000, is there a way to use the fact that putting our figures, is equivalent to putting a a pigger rectange of 2x3 or 3x2 ?</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>There are a lot of people who say "I never use OO design in programming contests"</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>bigger*</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>I like when I hear that... it means one less person to consider a threat</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>hehe</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Dan, it's not equivalent.</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>equivalent in the sense that you need to multiply by a number</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>There are patterns much bigger than 3x2 and 2x3</td></tr>
<tr><td class=tutorOdd><b>bamse</b></td><td class=tutorOdd>Dan[Popovici]: it doesn't work</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>kalmakka: why won't pair work?</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>any counter example ?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>bamse: I tried this approach during contest</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>bamse: but I failed</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lars: did you ever find out about the C# thing?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>Dan[Popovici]: because 2*3 and even 5*9 are not enough</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>Because G S and B should be sorted descending and 'name' ascending.</td></tr>
<tr><td class=tutorOdd><b>bamse</b></td><td class=tutorOdd>nicka81: me too</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Dan[Popovici]: though I don't know counterexample</td></tr>
<tr><td class=tutorOdd><b>bamse</b></td><td class=tutorOdd>nicka81: :(</td></tr>
<tr><td class=tutorEven><b>lars</b></td><td class=tutorEven>Ryan: no, I forgot.  Maybe google can tell me something.</td></tr>
<tr><td class=tutorOdd><b>monsoon</b></td><td class=tutorOdd>aussie: the question was why snewman's solution fits in 64MB</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>Unless you do some tricks (such as storing -medals) it won't work.</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>is there a complex pattern that can not be splitted in such rectangles ?</td></tr>
<tr><td class=tutorEven><b>bamse</b></td><td class=tutorEven>nicka81: the last test case could show the problem, but I didn't read carefully enough</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>Dan[Popovici]: There is a simple 5x6 pattern that won't be divided into 2x3's</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Dan[Popovici]: Larry and snewman were talking about this after the contest</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>BEHiker57W: there's a 4*6 pattern that won't divide</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Dan[Popovici]: Larry said something about a uva problem which made him more familar, and that such a thing is possible, but complex</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>Dan[Popovici]: and snewman said "you're crazy dude"</td></tr>
<tr><td class=tutorEven><b>bamse</b></td><td class=tutorEven>Dan[Popovici]: if you could find sol only with 2x3, 3x2, all w*h not multiple of 6 will fail</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>Dan[Popovici]: Top row: ACCBB Second Row: AACDB continue from there...</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>leadhyena_inran: true</td></tr>
<tr><td class=tutorOdd><b>bamse</b></td><td class=tutorOdd>Dan[Popovici]: last test case was 5*9</td></tr>
<tr><td class=tutorEven><b>lars</b></td><td class=tutorEven>Ryan: I think the compiler/VM probably just notices from the loops that that only two rows are relevant at a time and deallocates the memory for earlier rows.</td></tr>
<tr><td class=tutorOdd><b>lars</b></td><td class=tutorOdd>Ryan: I'm still impressed though.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>it makes sense</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>DPing, and reusing space</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>lucky it didn't time out though, hehe</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>It's rather nice done of the VM. Soon DP will be done automatically as well, I guess.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>kalmakka: AI participating in TC ? ;-)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>anymore questions about the 300, the 500&gt;</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Parsing the problem statement is going to be hard for AI.  Epecially for those really wordy problems.</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>Anyone think it should have been 250 instead?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: perhaps</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>Ryan: you mean the 500?</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>Ryan:  :D</td></tr>
<tr><td class=tutorOdd><b>DAle</b></td><td class=tutorOdd>:)</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>haha</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>leadhyena_inran: Well spoken</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: I thought 300 is 250 with tricky inputs</td></tr>
<tr><td class=tutorOdd><b>lordbogy</b></td><td class=tutorOdd>Ryan: i don't think it was 300 based on difficulty,but rather based on length of code</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>kalmakka: why allow a formula solution?</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>What were the tricky inputs?</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>Ryan: there was no tricky inputs for this 300</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>nicka81: there SHOULD have been.</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>nicka81: allow more than 50 countries</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>hmm.  don't understand how snewman's 1k works.  looks to me like it should be allocating &gt; 300MB on the worst case.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Well, it did seem kinda long for an easy</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>nicka81: and I would have killed many Java solutions with a test case that failed</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>nicka81: because I didn'</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>nicka81: t read the constraints correctly</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>nicka81: UGH</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>aussie: We think C# does some automatical deallocation.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>aussie: we think it's a C# thing... but aren't sure</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>maybe their's a higher memory limit for C#?</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>there's</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>and it just gets swapped</td></tr>
<tr><td class=tutorEven><b>BradAustin</b></td><td class=tutorEven>http://members.cruzio.com/~artax/4x6</td></tr>
<tr><td class=tutorOdd><b>brogers</b></td><td class=tutorOdd>leadhyena_inran: why do you say that greater than 50 countries would have killed Java solutions?</td></tr>
<tr><td class=tutorEven><b>lars</b></td><td class=tutorEven>Ryan: Or maybe TC's limits are broken.  Someone (not me ;) could easily test that.</td></tr>
<tr><td class=tutorOdd><b>BradAustin</b></td><td class=tutorOdd>(Example of arrangement not consisting of 2x3 rectangles)</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>brogers: because some coders</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>brogers: a large number of Java coders allocated space to store 50 country names</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>brogers: allocated space only for 50 countries</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>brogers: because, duh, 50 country names for 50 lines</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>brogers: though its possible to have 150 of them</td></tr>
<tr><td class=tutorOdd><b>brogers</b></td><td class=tutorOdd>ah, fixed lenght arrays</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>brogers: saw it ALL over</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>brogers: but its forbidden by constraint</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>When the array is created, it should be allocating the full amount straight away.  even if the runtime does some optimsation to free up memory that it knows is not going to be used again, it's still using more than 64MB at one point.</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>...Java... allocating space?</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>nicka81: and that shouldn't be encouraged by topcoder, IMHO</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>aussie: do you really know how C# array work?</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>wild</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>There are some nice aspects to C-octothorpe.  Too bad there isn't any implementation for my platform.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>aussie: internally ?</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>Ryan's Rule #15 about programming contests: Don't make solutions that depend on constants, if you can avoid it</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>aussie: it may use some kind of lazy allocation</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>nicka81: hmm, possibly.  I'll have a look around and see if I can find out for sure.</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>aussie: growing dynamically + sliding window for accessed indices</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>BEHiker57W: octothorpe?</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>aussie: #</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>aussie: c-pound sign?</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>aussie: octothorpe is proper name</td></tr>
<tr><td class=tutorOdd><b>Krzysan</b></td><td class=tutorOdd>I have a question: I have seen a win32 app that launched the TopCoder applet</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>leadhyena_inran: depends on the context.  in music and C# programming, it's "sharp"</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>C# isn't proper</td></tr>
<tr><td class=tutorEven><b>Krzysan</b></td><td class=tutorEven>do you know what i am talking about?</td></tr>
<tr><td class=tutorOdd><b>Krzysan</b></td><td class=tutorOdd>can't find it now</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>Krzysan: where'd you see it?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>OK, everybody I have to go to bed, because just after 5 hours I have to go to office ;-(</td></tr>
<tr><td class=tutorEven><b>Krzysan</b></td><td class=tutorEven>on my friends laptop</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>BEHiker57W: so what's you're platform then?</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>night nick</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>did anybody fully understand snap's 1000 solution, it doesn't seem to be quite the same as ka</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>see you on next SRM</td></tr>
<tr><td class=tutorOdd><b>ghost_riter_8_</b></td><td class=tutorOdd>can somebody help me with div2's 900 problem</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Ryan, how do you propose to remove the constraints?  Allow an unlimited list of medals?</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>kalmakka's*</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>just one SRM before qualification ;-)</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>nicka81: there'll be a lot of people there, they're giving away a laptop</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>aussie: Mandrake 9.2</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>nicka81: regardless of qualification</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>nicka81: :D</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>TCO starts soon, we all should have a good sleep I think</td></tr>
<tr><td class=tutorEven><b>nicka81</b></td><td class=tutorEven>that's more important than laptop ;-)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>BEHiker57W: yes</td></tr>
<tr><td class=tutorEven><b>Krzysan</b></td><td class=tutorEven>is there a win32 topcoder client that would work without java?</td></tr>
<tr><td class=tutorOdd><b>nicka81</b></td><td class=tutorOdd>so, bye ;-)</td></tr>
<tr><td class=tutorEven><b>ghost_riter_8_</b></td><td class=tutorEven>how can i formulate div2's 900 problem using dp</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>nicka81: not for those who don't have a laptop :D</td></tr>
<tr><td class=tutorEven><b>bamse</b></td><td class=tutorEven>nicka81: I just woke up;)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>BEHiker57W: keep a container of countries, and append to it when you see a new one</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Ryan: wouldn't you write a different solution for 10000000 medals?</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>BEHiker57W: so what's wrong with Mono then?  I use it on Mandrake 10, surely it works on 9.2.</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>For many medals you would have to keep countries in a set sorted (or hashed) by name.</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>BEHiker57W: What I mean is, the validity of your program shouldn't depend on the inputs... the performance/coding time should be tuned to the problem at hand</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>aussie: Is mono compatible enough to be used for TC?  It has to be exact so you don't get hit in a  75 minute contest.  I use Jikes, but it's really reliable.</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>BEHiker57W: Although sometimes having a static array you fill up can save you coding speed</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>BEHiker57W: but you have to be REALLY careful with it</td></tr>
<tr><td class=tutorOdd><b>lars</b></td><td class=tutorOdd>Dan[Popovici]: I think snap's 1000 is similar to snewman's, but using memoization</td></tr>
<tr><td class=tutorEven><b>monsoon</b></td><td class=tutorEven>admins: is memory for C# coders limited to 64MB too?</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>what's the 300 in snap's code?</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Ryan: If there is any limit, I can write a static array.  If there is no limit, I can challenge with 100,000,000 medals.  What is the happy medium?</td></tr>
<tr><td class=tutorOdd><b>lars</b></td><td class=tutorOdd>Ryan: 15*18 &lt; 300</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>BEHiker57W: well, mono is exact enough to the specification, weather it's exact enough compared to the MS framework that TC uses I'm not so sure about.  MS made a couple of mistakes implementing their own spec.</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>lars: yep</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>BEHiker57W: but you don't really gain anything with a static array</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>BEHiker57W: But I think the current version of Mono is close enough in everything used in TC.  I've had a couple of problems with it with threading, but we don't use that here anyway.</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>BEHiker57W: and there have been many times when I (and others) have been hit with overflow when using one</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>BEHiker57W: The only thing you'd need to watch would be the % operator for integer types.  Mono does it properly, MS framework doesn't.</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>Ryan: I disagree</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>Ryan: sometimes a static array can really improve speed</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Ryan, _I_ wouldn't use one.  I don't even like getting my problem arguments in them (C++'ers get theirs in vectors so they always save one parsing step!)But you wanted to discourage them for everyone.</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>Ryan: expecially in Java</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>leadhyena_inran: yeah, static arrays can improve speed, and sometimes they are necessary for a solution to pass. but if you can avoid them you should</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>Ryan: right</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>by "can" I mean, always do</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>the first can</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>Ryan: and Collections are more useul if time is not as much a factor</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>not the second</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>hehe</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>Ryan: lol</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>it's part of the "progams shouldn't use magic numbers"</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>aussie:  Sounds like it isn't quite ready.  Have you tried it in competition?</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>So, if you do make a static array, you should declare it's size to be a symbolic constant</td></tr>
<tr><td class=tutorOdd><b>aussie</b></td><td class=tutorOdd>BEHiker57W: nah, I do my coding in the applet using Popsedit anyway.</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>Ryan: or in Java case static final</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>aussie: Popsedit is nice, but isn't that really slow to compile and test</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>example: int dx[directions]={0,0,1,-1}; int dy[directions]={1,-1,0,0};</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>BEHiker57W: you have to warm Popsedit up</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>BEHiker57W: I've tried doing everything locally in practice rooms, and I find that slower for me.</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>...so if you realize half way through that diagonally adjacent are considered relevant to this problem, you don't have to go look for where you looked at adjacent squares</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>BEHiker57W: compile in a practice room before competition</td></tr>
<tr><td class=tutorOdd><b>DAle</b></td><td class=tutorOdd>duner: don't look at it ;)</td></tr>
<tr><td class=tutorEven><b>aussie</b></td><td class=tutorEven>Just wrote a little test program that creates an array of the same dimensions and size as the worst case for snewmans 1k and then did nothing with it.  uses &gt; 300MB of memory...</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>Ryan: in Java that's just int[] dx={0,0,1,-1}</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>And, of course, it could really use a vi mode...</td></tr>
<tr><td class=tutorOdd><b>kalmakka</b></td><td class=tutorOdd>leadhyena_inran: You can do the same in C++</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>kalmakka: really?</td></tr>
<tr><td class=tutorOdd><b>DAle</b></td><td class=tutorOdd>really</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>kalmakka: I need to refresh my C++ knowledge</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>kalmakka: it's still back in '99</td></tr>
<tr><td class=tutorEven><b>DAle</b></td><td class=tutorEven>in 99 this was possible too ;)</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>yeah... the real savings is not using for(int dir=0;dir&lt;4;dir++)</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>leadhyena_inran: However, only the final dimension is allowed to be unspecified. Don't know how this compares with java..</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>kalmakka: doesn't</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>kalmakka: int[][] d={{0,1},{0,-1},{1,0},{-1,0}};</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>kalmakka: is totally legal</td></tr>
<tr><td class=tutorEven><b>Ryan</b></td><td class=tutorEven>coolie</td></tr>
<tr><td class=tutorOdd><b>Dan[Popovici]</b></td><td class=tutorOdd>Does anybody know if a polynomial solution to the 1000 problem is possible, or can someone prove there is no such thing ?</td></tr>
<tr><td class=tutorEven><b>BEHiker57W</b></td><td class=tutorEven>Back in '97 when I used C++ a lot M'sft hadn't heard of STL yet.  And had just started imagining templates.  Only eight years later, we will get them in Jave, too!</td></tr>
<tr><td class=tutorOdd><b>Ryan</b></td><td class=tutorOdd>pair&lt;int,int&gt; ds={{0,1},{0,-1},{1,0},{-1,0}};</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>BEHiker57W: can't wait until I can use tiger here</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>Dan[Popovici]: I can prove that a polynomial solution to Div I 1000 is possible, with the constraints</td></tr>
<tr><td class=tutorEven><b>kalmakka</b></td><td class=tutorEven>leadhyena_inran: To be precise (i.e. correct) only the first dimension is allowed to be unspecified. (duh)</td></tr>
<tr><td class=tutorOdd><b>lars</b></td><td class=tutorOdd>BEHiker57W: with the constraints all TC problems are O(1) :)</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>BEHiker57W: I can prove an O(1) solution exists given the constraints :P</td></tr>
<tr><td class=tutorOdd><b>BEHiker57W</b></td><td class=tutorOdd>leadhyena_inran: Java coders will all rise about 50 to 100 rating points overnight (just form the time savings typing casts).</td></tr>
<tr><td class=tutorEven><b>leadhyena_inran</b></td><td class=tutorEven>BEHiker57W: not just that... there are some really neat tricks with generics</td></tr>
<tr><td class=tutorOdd><b>leadhyena_inran</b></td><td class=tutorOdd>BEHiker57W: and * templates</td></tr>
<tr><td class=tutorEven><b>lars</b></td><td class=tutorEven>leadhyena_inran: great minds.</td></tr>



			</table>

        </div>
        <p><br/></p>
        </td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>
