<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2005 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
<link type="text/css" rel="stylesheet" href="/css/TCCC05style.css"/>
<link type="text/css" rel="stylesheet" href="/css/style.css"/>
</head>
<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp" >
<jsp:param name="tabLev1" value="algorithm"/>
<jsp:param name="tabLev2" value="summary"/>
<jsp:param name="tabLev3" value="wildcard"/>
</jsp:include>

<table width="100%" border=0 cellpadding=0 cellspacing=0>
<!-- Body-->
	<tr valign=top>
		<td valign=top align=center>
		<div class="bodySpacer">
            
        <p class="bigTitle">misof wins the WildCard Round</p>

		<div class="leadPhoto">
		<span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc05&d3=photos">See more photos!</a></p></span>
		<img src="/i/tournament/tccc05/onsite_photos/shot_wildcard.jpg" alt="" class="photoFrameBig" /><br/>
		<span class="leadPhotoCaption">misof takes WildCard, faces off with tomek again in the Finals<br/><br/></span>
		</div>

		Friday, March 11, 2005<br/>
      introduction by lbackstrom
		<br/><br/>
		</p>

		<p>
The only favorite to advance hence far was tomek, and the wildcard
would be no exception.  The number two and three seeds were both in
this round, and were heavily favored to advance.  However, Eryx got
off to a slow start on the easy problem, and in the early going ante
was ahead.  RalphFurmaniak, who promised to do a back flip if he
advanced, was the first to submit the medium problem.  John Dethridge
skipped the medium problem at first, only to give up 20 minutes later
and go back to the medium.  Eryx also gave up on the medium problem
briefly, but in the end was able to figure it out.  Eventually, both
misof and Eryx submitted all three problems, though misof led by
slightly over a challenge.<br/><br/>

The challenge phase was quite eventful, as John and Ralph each lost 50
points, while ante gained 50 at the expense of Ralph's medium problem.
When the systests rolled out, misof's solutions all passed, causing
him to jump up and down and pump his fist.  In just a few hours, we
will see if the upsets can continue as ploh, mathijs and misof try to
unseat three-time champ tomek.

<h1>RunLengthPlus</h1>
      <a href="/stat?c=member_profile&cr=269554"><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/stat?c=member_profile&cr=269554">Yarin</a>, <br/>
		<em>TopCoder Member</em><br />

<p>
This problem is an excellent example of recursion and memoization. The input to the method
is a string, for which we want to find the optimal compression. Now assume this compression
involves that the first character is <i>not</i> to be compressed - then the answer
is the first character plus the best compression of the remaining letters (a recursive call).
Otherwise the first character is part of a substring that is to be repeated at least twice.
First we need to determine the length of the substring that includes the first character - this
is done by looping over all lengths. For each such length, determine how many times the string
can be repeated. It's important to realize that if a substring can be repeated, say, five times,
the optimal solution might require it to be repeated four times (because the last repetition might
be needed for an upcoming, different repetition string). Hence we try all number of repetitions
(as many as is allowed), and do a recursive call on both the repeated substring (since it might
be compressed further) and on the remaining characters. All this is concatenated (adding parenthesis
if the length of the substring is more than one character), and compared with the smallest and lexicographically
best compression found so far. Of course, the recursive function is memoized (in a hashtable, for instance)
so we won't time out.
</p>

<h1>Indivisible</h1>
		<a href="/stat?c=member_profile&cr=299177"><img src="/i/m/vorthys_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/stat?c=member_profile&cr=299177">vorthys</a>, <br/>
		<em>TopCoder Member</em><br />
<p>
This is one of those problems that is hard to figure out, but then
easy to code once you do figure it out.  The first task is to figure
out how large to make the result set.  It's pretty easy to see that
{n/2+1,...,n} is a set of size (n+1)/2
in which no member is divisible by another
member, but is that the largest such set?  Yes.
</p>

<p>
By the Fundamental Theorem of Arithmetic, every positive integer can
be written uniquely as ODD*POW, where ODD is an odd number, and POW is a
power of 2 (possibly 1).  If two numbers have the same ODD, but
different POW's, then one is divisible by the other.  Therefore, every
number in the set we are constructing must have a different ODD.
There are only (n+1)/2 odd numbers between 1 and n, so that is the
maximum possible size.
</p>

<p>
Now that we know how large the set should be, how do we construct the
lexicographically earliest such set?  There are at least two different
approaches.  First, we can start with all the odd numbers between 1
and n, and whenever one number is divisible by another, multiply
the smaller one by two. This process will end up choosing the smallest
possible POW for each ODD, so the result must be the
lexicographically earliest. (You might worry that multiplying a number
by two will make it bigger than n, but no number greater than n/2 will ever
divide evenly into another number less than or equal to n.)
</p>

<p>
The second approach is more ad hoc.  Start with the set
{n/2+1,...,n}.  Then consider the numbers from n/2 down to 2.
Whenever the current number divides evenly into exactly one of the
members of the set, replace that member with the current number.
</p>


<h1>ConnectingPoints</h1>
      <a href="/stat?c=member_profile&cr=269554"><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
		<p>by <a href="/stat?c=member_profile&cr=269554">Yarin</a>, <br/>
		<em>TopCoder Member</em><br />
<p>
There are several ways to solve this problem, none of them particularly easy. It might be
tempting to think that you could solve if with a couple of if-statements, covering the
different cases (since there are no obstacles). Unfortunately, that's not true - there are
just too many special case. Even though there are no obstacles, just the fact that the
grid is finite makes the problem a lot harder. Other tricky cases involve when the points
lie along the same line etc.
</p>

<p>
One way to solve the problem is to shrink the coordinate space. It should be fairly obvious
that there is no need to turn a wire 90 degrees "in the middle of nowhere"; the only coordinates
that are interesting are those lying close to a point. One way to shrink the coordinate space
is to pick all x- and y-coordinates (independently) that are at most one unit away from the
mentioned inputs. This would give a new coordinate space whose maximum size is at most 12x12
(3 x- and y-coordinates for each point). Now the input is so small that we can brute force
the solution with some reasonable pruning. We do a DFS search to get from A<sub>1</sub> to A<sub>2</sub>,
trying all possible ways (<i>except</i> that we only try walking in 3 of the 4 directions), and
then we can do a plain Dijkstra search to get from B<sub>1</sub> to B</sub>2</sub>. This procedure
is then repeated so that we start to go between the B-points and do the Dijkstra on the A-points.
</p>

<p>
Another way to solve the problem is to realize that the best solution will always (well, almost...)
include a way between one pair of the points that is the shortest possible way (i.e. only going
in at most two directions). Further, this way will always be one such that we can initially
start going in one direction as far as possible, and then turn into the other direction (more or less).
For this to work, it's necessary to start from all four points and to start with different initial
directions. One special case remains however, and this was covered by the last example: When
all four points lie on a single line, overlapping (A<sub>1</sub>, B<sub>1</sub>, A<sub>2</sub>, B<sub>2</sub>),
there is no direct path between two of the points. This case can be handled with an if-statement
(you just have to be aware when the four points lie on the edge of the grid!).
</p>

        </div>
		</td>
        
         
<!-- Right Column-->
        <td width=170 align=right>
            <jsp:include page="../../public_right.jsp">
            <jsp:param name="level1" value="tccc05"/>
            </jsp:include>
         </td>
		
	</tr>
	
</table>
	
	


<jsp:include page="../../foot.jsp" />

</body>

</html>
