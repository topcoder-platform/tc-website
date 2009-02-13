<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../script.jsp" />
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>

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
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="match_editorials"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div style="float: right;" align="right"><A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
<tc-webtag:forumLink forumID="505524" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 107</span><br>Wednesday, August 7, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<P>
<B>Division-II, Level 1:</B> (250pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505524" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 92% (158/172) <BR/>
Success rate - 79% (124/158)<BR/>
High score: <B>n0vice</B>, 243.79 points<BR/>
</P>

<P>
This problem's hardest aspect was confusing wording. In essence, it's
telling you to find a string that's optimum in some way and put it at the
beginning of all the others - then write the others in series. So the
solution is pretty easy. Start at the first item in the array and see how
"good" it is. We can use a "quality" value without much trouble. For each
item, start quality at 0. Add 1000 if it's even-length (thus ensuring that
even-length strings will always be better than odd-length strings.) Now
subtract the length of the strings (giving shorter strings the advantage).
And now, if it's equal to or larger than your current "best", make it your
best.
</P>

<P>
Note that the "equal to" part is important - since we're doing this in
order, and it wants the one that appears latest, we have to replace our best
if it gets matched.
</P>

<P>
From there, it's easy. Start an empty string and add your "best" component
to it. Now iterate through the array again - if you're currently on the
"best", don't add it to your final string (since you've already got it), but
otherwise add it.
</P>

<P>
Now return that.
</P>

<P>
And that's all.
</P>


<P>
<B>Division-II, Level 2:</B> (450pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505524" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 91% (156/172)<BR/>
Success rate - 58% (91/156)<BR/>
High score: <B>n0vice</B>, 447.23 points<BR/>
</P>

<P>
I have to be impressed by <B>derelikt</B>'s score on this one, which is quite
probably the highest percentage of possible points I've ever seen from
someone who isn't cheating. Five lines of code. This particular problem is
much easier in Java than C++, since you can use StringTokenizer to divide it
into blocks of A, and just add all those lengths into a HashSet, and return
its size.
</P>

<P>
On the other hand, it's not really hard in C++ either. Keep a counter - "how
many A's you've seen in a row" - start it at 0. Iterate through the string.
If it's D, add the current value to a set&lt; int &gt; and reset it to 0. If it's
A, increment the counter. Remember to add its current value at the end, and
then remove 0 from the set&lt; int &gt; (you might not have one, so you can't just
subtract one from its size, but myset.erase( 0 ); isn't hard to write) and
return the size.
</P>

<P>
I honestly don't know which of these would work better in C#, but if C#
doesn't have a Java stringtokenizer clone, the C++ technique will work with
whatever C#'s equivalent of set is.
</P>


<P>
<B>Division-II, Level 3:</B> (1000pt) &amp; <B>Division-I, Level 1:</B> (300pt)&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505524" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
<B>Div-II</B><BR/> 
Submission rate - 42% (73/172)<BR/>
Success rate - 41% (30/73)<BR/>
High score: <B>biomass</B>, 823.56<BR/>
</P>

<P>
<B>Div-I</B><BR/> 
Submission rate - 76% (80/105)<BR/>
Success rate - 78% (62/80)<BR/>
High score: <B>kv</B>, 284.83<BR/>
</P>


<P>
There are really two major cases you have to look at - the one where the
axis of symmetry goes straight through one column, and the one where the
axis of symmetry goes between two columns. Neither of them are really hard,
though.
</P>

<P>
In the end, the algorithm comes down to "scan the entire logo, and its
mirror image, and add one for every time the squares on both sides aren't
identical". Do that for each vertical axis - remembering both possible
kinds - and return the smallest value you can achieve.
</P>

<P>
The actual implementation could be done in quite a few ways. Some people
used arrays to write the data to, translated along some axis, so that the
"mirror point" was always, say, location 50. In this case you could just
write it in verbatim for the "axis goes through a column", and shift
everything on the left side of the mirror point one more space to the left
for "axis goes between columns".
</P>

<P>
radeye set his up to do the reading directly from the input data, with some
logic to avoid running out of bounds.
</P>

<P>
I, personally, used a map&lt; int, map&lt; int, bool &gt; &gt;, which is nice because it
mimics an infinitely-sized 2d array, defaulting to false. So I'd write the
data in, then just scan 0,0 to 50,50, along with the reflection, then clear
it for the next one.
</P>


<P>
<B>Division-I, Level 2:</B> 550pt&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505524" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 37% (39/105)<BR/>
Success rate - 77% (30/39)<BR/>
High score: <B>ZorbaTHut</B>, 452.58 points<BR/>
</P>

<P>
I honestly don't know of anyone who did this the clever way - I ended up
talking with an admin afterwards, and he explained the Good solution. So
here's the good solution.
</P>

<P>
Instead of thinking of it as a series of resistors, just think of the nodes.
Right now our task isn't to figure out which resistors are redundant, it's
to figure out which nodes are redundant. It's pretty easy to see that if a
node is redundant any resistors linking to it are likewise redundant.
</P>

<P>
First build your handy adjacency matrix. Now you've got a big loop for each
point.
</P>

<P>
First, remove given point from the adjacency matrix. Then run Floyd's on the
whole thing. Now for each point remaining, check to see if there's a path
from it to A or B. If there isn't, then it's not part of a simple path.
</P>

<P>
Repeat for the next point, accumulating the simple paths.
</P>

<P>
In the end it's O(n^4), and you have a bunch of nodes that aren't part of
simple paths. Run through your original string and if either side of a
resistor isn't part of a simple path, add it to your list. Sort and return.
</P>

<P>
Now here's a somewhat hacked kludgy way that does, in fact, work :)
</P>

<P>
The way I ended up figuring out is (of course) a recursive algorithm. Keep
an array of which nodes are in a simple path from A to B (start them all at
"false", of course) and an array of which nodes you've been through. Now
just do a depth-first search. If you find a path to B, you can set A, B, and
all the nodes in your path to "true". If you run into a path that's already
set to "true" from a different direction you can set all the nodes in the
current path to "true" also. However, if you run into a piece of the same
path you're already on, you can't take a node more than once, so don't set
anything to true.
</P>

<P>
It's a bit hard to explain - you may wish to look at my source. gd[] is the
"which nodes are in a simple path" array ("good"), and tk[] is the "which
nodes are in the path you're currently exploring" array ("taken").
</P>

<P>
A lot of people did clever things to try to embed the actual number of
connections inside the adjacency matrix. I didn't bother. I built an
adjacency matrix like normal, then just went through the connections
(snagging them out of the input string a second time) and tested them all.
Sort them as you go, then sort the final array and return it.
</P>


<P>
<B>Division-I, Level 3:</B> 800pt&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505524" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

Submission rate - 10% (10/105)<BR/>
Success rate - 40% (4/10)<BR/>
High score: <B>Yarin</B>, 491.65 points<BR/>
</P>

<P>
Oddly enough, this problem was actually brute-forcable today, and I believe
brute-force may be its only solution. In general, what you wanted to do was
generate every combinations of rules, then make a really enormous array with
the start pattern in the middle and run every combination of rules on it,
seeing which gives you the best result.
</P>

<P>
The actual implementation was a little trickier. It's easy to calculate
"lightspeed", the fastest speed at which anything in the middle can effect
anything on the edges. It's one cell per iteration, since each cell only
pays attention to the cells on either side. That means that, after 300
iterations, with a 50-cell starting pattern, your pattern will be, at most,
650 cells wide.
</P>

<P>
Of course, it's not *quite* that simple. Since you can have rules that
generate life where there is no life - say, for example, DDD - some
algorithms might start generating fringe effects on the side. My
implementation kept both cells on the very edges "dead", meaning that
invalid data could start creeping in from the sides at lightspeed also. So I
would need another 300 cells on each side to prevent that. In the end, to
keep from getting tripped up by an inevitable stupid off-by-one error, I
made my entire array 2000 cells wide and started the "initial pattern" at
location 1000. This meant that locations 0-300 were garbage, 700-1350 were
important, and 1700-2000 were garbage.
</P>

<P>
The next thing that tripped me up was another problem, this time hinging on
"infinite life" on either side. However, with the way I'd set it up,
locations 500 and 1500 would be in this "infinite" area, if there was one.
No problem! I made a loop to start at 500 and find the first dead cell, and
another loop to start at 1500 and go backwards to find the first dead cell,
and then my main "diversity finder" just went from one side to the other.
</P>

<P>
Finding diversity wasn't really hard. Keep a counter of "how many alive
cells have you found in a row". Start from the first side and go to the end.
If the cell you're on is alive, increment the counter. If the cell you're on
is dead, add the current value of the counter to a list, then set the
counter to 0. Once you've iterated all the way through just scan the list
for duplicates (and zeros) and eliminate them all, then return the size of
the list. Note that C++ STL's set class does the job quite nicely, though
you have to remove 0 manually (not hard - myset.erase( 0 ); ).
</P>

<P>
The only remaining part is "run every combination of rules". Generating
every combination of rules isn't hard either. You can think of it as an
array of the possible eight rules, with a flag for whether that condition
brings life or death - in fact, that's exactly how I implemented it. Then
it's just a matter of trying every combination of those rules one after
another - 256 tests, overall.
</P>

<P>
Of course, you need very efficient code for all of this, or it will time
out. My solution runs even the worst cases in under two seconds - look at it
if you want hints.
</P>


<p>
<img src="/i/m/ZorbaTHut_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
<span class="smallText"><em>TopCoder Member</em></span><br clear="all" />
</p>

</div>
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

