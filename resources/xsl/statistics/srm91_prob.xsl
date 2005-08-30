<?xml version="1.0"?>
<xsl:stylesheet xmlns:xsl="http://www.w3.org/1999/XSL/Transform" version="1.0">
  <xsl:import href="../top.xsl"/>
  <xsl:import href="../script.xsl"/>
  <xsl:import href="../includes/body_top.xsl"/>  
  <xsl:import href="../foot.xsl"/>
  <xsl:import href="../includes/modules/stats_intro.xsl"/>  
  <xsl:import href="../includes/global_left.xsl"/> 
  <xsl:import href="../includes/public_right_col.xsl"/>     
  <xsl:output indent="no" method="html" doctype-public="-//W3C//DTD HTML 4.0 Transitional//EN"/>
  <xsl:template match="/">
    <HTML>
      <HEAD>
        <xsl:call-template name="Preload"/>      
        <TITLE>TopCoder :: Statistics</TITLE>
        <xsl:call-template name="CSS"/>      
        <!--<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
        <LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>-->
        <META NAME="description" CONTENT="TopCoder is a programming tournament site. All members who compete attain a rating that provides a metric for coding competence and potential. These ratings, coupled with tournament performance, can lead to monetary rewards and employment opportunities."/>
        <META NAME="keywords" CONTENT="Computer Jobs, Programming, Programming Jobs, Programming Contest, Programming Competition, Online Games, Coding, Information Technology Jobs, Java, C++"/>
      </HEAD>
      <BODY BGCOLOR="#FFFFFF" TOPMARGIN="0" MARGINHEIGHT="0" LEFTMARGIN="0" MARGINWIDTH="0">
        <xsl:call-template name="Top"/>

<!-- Body Begins -->
<TABLE WIDTH="100%" HEIGHT="69%" BORDER="0" CELLPADDING="0" CELLSPACING="0" BGCOLOR="#CCCCCC">
  <TR>
    <!-- Left Column Begins -->
    <TD WIDTH="170" BGCOLOR="#CCCCCC" VALIGN="top">
<!-- Left Column Include Begins -->  
    <!-- Global Seconday Nav Begins -->        
        <xsl:call-template name="global_left"/>
  <!-- Global Seconday Nav Ends -->      
<!-- Left Column Include Ends -->              
      </TD>
  <!-- Left Column Ends -->
  <!-- Gutter Begins -->
    <TD WIDTH="4" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/table_top_fill.gif" WIDTH="4" HEIGHT="26" BORDER="0"/></TD>
    <!-- Gutter Ends -->

<!-- Body Area -->
  <!-- Center Column Begins -->  
    <TD CLASS="bodyText" WIDTH="100%" bgcolor="#FFFFFF" valign="top">
<xsl:call-template name="BodyTop">
  <xsl:with-param name="image1">white</xsl:with-param>
  <xsl:with-param name="image">statisticsw</xsl:with-param>
  <xsl:with-param name="title">&#160;Match Editorials</xsl:with-param>
</xsl:call-template>
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="0" BGCOLOR="#FFFFFF" WIDTH="100%">
  <TR>
    <TD BGCOLOR="#FFFFFF" VALIGN="top" WIDTH="11"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="1" BORDER="0"/></TD>
    <TD CLASS="bodyText" COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="240" HEIGHT="1" BORDER="0"/><BR/>
<!--body contextual links-->
<TABLE BORDER="0" CELLSPACING="0" CELLPADDING="1" VALIGN="top" WIDTH="250" ALIGN="right">
    <TR>
        <TD ROWSPAN="5" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
        <TD COLSPAN="2" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD>
    </TR> 
   <TR><TD COLSPAN="2" BGCOLOR="#999999" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="150" HEIGHT="1" BORDER="0"/></TD></TR>
   <TR>
      <TD VALIGN="top" BGCOLOR="#999999" CLASS="moduleTitle">&#160; &#160;</TD>
      <TD BGCOLOR="#999999" VALIGN="top" CLASS="moduleTitle">MATCH EDITORIAL LINKS:</TD>
   </TR>                    
   <TR>
       <TD COLSPAN="4" VALIGN="top" BGCOLOR="#999999">
      <TABLE BORDER="0" WIDTH="100%" CELLSPACING="0" CELLPADDING="2" BGCOLOR="#CCCCCC">
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&amp;d1=match_editorials&amp;d2=archive" CLASS="bodyText">Editorial Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Comments? Ideas?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_prob" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/?t=statistics&amp;c=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
         <TD VALIGN="top" CLASS="bodyText">&#160;</TD>
      </TR>      
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>
<!--end contextual links-->
<IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="48" BORDER="0"/><BR/>
<!--<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=2" CLASS="bodyGeneric">-->
<P><B>Single Round Match 91</B><BR/>
May 22, 2002</P>
<P><B>Problem Set Analysis &amp; Opinion</B></P>


<P>
SRM 91's problems were brought to you by <A HREF="/tc?module=MemberProfile&amp;cr=266750" CLASS="bodyGeneric">axchma</A>.
In Division-II, there was a simple numeric problem, a problem involving computing TopCoder winnings, and a state machine problem.
In Division-I shared the TopCoder-based problem, as well as a simulation problem and a combinatorical problem.
</P>

<P>
In Division-I there was much less emphasis than usual on data.  The Level 2 and Level 3 problems each took only an <tt>int</tt>
as input and returned an <tt>int</tt>, and their solutions did not require any sophisticated data structures.  This is a pretty
rare occurrence in Division-I.  In retrospect, the Level 2 and Level 3 problems seem to share a lot of common themes;
I wonder if this was intentional.
</P>

<P>
Division-II had to deal with more data as input, but the solutions to Division-II problems really did not require
any sophisticated data structures at all, either, as can be seen in the individual problem analyses.
</P>

<P>
<B>Summary</B>
</P>

<table border="1" cellspacing="0" cellpadding="2" align="center">
<tr><td class="bodyText" colspan="2"><B>Problem</B></td><td class="bodyText"><B>Submissions</B></td><td class="bodyText"><B>Success Rate</B></td><td class="bodyText"><B>Average Points</B></td><td class="bodyText"><B>High Score</B></td></tr>
<tr><td class="bodyText" rowspan="3"><b>Division-I</b></td><td class="bodyText" align="center">Level 1</td><td class="bodyText" align="center">227 of 232 (97.8%)</td><td class="bodyText" align="center">204 of 227 (89.9%)</td><td class="bodyText" align="center">201.29</td><td class="bodyText" align="center">ZorbaTHut with 239.34</td></tr>
<tr><td class="bodyText" align="center">Level 2</td><td class="bodyText" align="center">142 of 232 (61.2%)</td><td class="bodyText" align="center">119 of 142 (83.8%)</td><td class="bodyText" align="center">358.25</td><td class="bodyText" align="center">eduar09 with 536.13</td></tr>
<tr><td class="bodyText" align="center">Level 3</td><td class="bodyText" align="center">18 of 232 (7.76%)</td><td class="bodyText" align="center">11 of 18 (61.1%)</td><td class="bodyText" align="center">547.00</td><td class="bodyText" align="center">kalmes with 762.35</td></tr>

<tr><td class="bodyText" rowspan="3"><b>Division-II</b></td><td class="bodyText" align="center">Level 1</td><td class="bodyText" align="center">393 of 412 (95.4%)</td><td class="bodyText" align="center">327 of 393 (83.2%)</td><td class="bodyText" align="center">228.65</td><td class="bodyText" align="center">PongsriBunny with 248.17</td></tr>
<tr><td class="bodyText" align="center">Level 2</td><td class="bodyText" align="center">343 of 412 (83.3%)</td><td class="bodyText" align="center">251 of 343 (73.2%)</td><td class="bodyText" align="center">334.10</td><td class="bodyText" align="center">ddwsdl with 473.85</td></tr>
<tr><td class="bodyText" align="center">Level 3</td><td class="bodyText" align="center">182 of 412 (44.2%)</td><td class="bodyText" align="center">58 of 182 (31.9%)</td><td class="bodyText" align="center">525.43</td><td class="bodyText" align="center">Ninjak with 822.95</td></tr>
</table>

<P>
<B>Problem Analysis</B>
</P>

<P>
The problems have been sorted by ascending difficulty, as I perceive it.
</P>


<P>
<B>Division-II, Level 1: Perfect</B>
</P>

<P>
This problem was a test of whether one knew how to compute factors of some number <tt>n</tt>.
As or after the factors are computed, their sum can easily be used to determine whether <tt>n</tt>
was deficient, perfect, or abundant.  The solution only requires an <tt>int</tt> for iteration
and an <tt>int</tt> for accumulation.
</P>

<P>
Factoring numbers is a hard problem, and there are many advanced factorization algorithms.
However, we are given a pretty small input constraint (<tt>2 &lt;= n &lt;= 50000</tt>),
meaning that even the most basic algorithm will be sufficient.
</P>

<P>
The most basic consists of iterating from <tt>i = 1</tt> to <tt>floor(n / 2)</tt>.
If <tt>n</tt> is divisible by <tt>i</tt> (that is, <tt>n % i == 0</tt>), add <tt>i</tt>
to our running sum of factors.  Then all that is needed are a few simple conditional
statements to compare this sum to <tt>n</tt> and return the appropriate string.
This can be made more efficient by noting that in most cases two divisors can be found
at once, and one only needs to iterate up to <tt>floor(sqrt(n))</tt>.  If
<tt>n % i = 0</tt>, then <tt>i</tt> &#160;<em>and</em> &#160;<tt>n / i</tt> are factors of <tt>n</tt>.
However, if one is using this method one must be careful not to count <tt>sqrt(n)</tt>
twice if <tt>n</tt> is a perfect square.
</P>


<P>
<B>Division-I, Level 1 / Division-II, Level 2: ChallengePhase</B>
</P>

<P>
Here we have a new entry in the line of self-referencing TopCoder problems.  However, unlike previous problems
of this nature, we are not helping TopCoder compute prizes, we are helping ourselves compute
prizes.
</P>

<P>
The solution is rather direct.  For each score of <tt>myScore - 50</tt>, <tt>myScore</tt>,
and <tt>myScore + 50</tt>, compute your expected prize winnings (we shall call them <tt>plose</tt>,
<tt>pbase</tt>, and <tt>pwin</tt>, respectively).  To do this, count the number of scores that
are greater then the score we are evaluating.  If the count is greater than three, the prize
is zero, otherwise the prize is the <tt>(2-count)</tt><sup>th</sup> entry in the prize table.
Once <tt>plose</tt>, <tt>pbase</tt>, and <tt>pwin</tt> are computed, simply return
<tt>(pwin - pbase) - (pbase - plose) = pwin - 2 * pbase + plose</tt>.
Again, no data structures are required, only some accumulators and iterators.
</P>


<P>
<B>Division-I, Level 2: StarCraft</B>
</P>

<P>
This problem presents some basic rules for turn-based warfare between a set of identical zealots
and a set of identical zerglings.  The solution requires an efficient implementation of a
simulation of these rules for a variable number of zerglings and a fixed number of zealots, locating
the smallest number of zerglings that can manage to kill off all the zealots.
</P>

<P>
This problem is one of the most deceptive problem statements I've ever seen.
It provides some very verbose rules, some of which are very similar to each other.
The rules for how zealots attack zerglings are really exactly the same as those for
how zerglings attack zealots, yet they are described quite differently.
One might note that there is a difference in that there is an upper limit to the
number of times that a zealot can be attacked in a single round.  However, one
can maintain symmetry here; the same upper limit can be thought of as applicable to
zerglings, it's just that a zergling will always die long before that upper limit
is ever reached.
</P>

<P>
The discussion of how each side picks its targets is slightly misleading as well.
The verbose rules can be reduced to the following:
<ul>
    <li>both sets of units are organized as a queue</li>
    <li>the attacking units attack one by one</li>
    <li>a defending unit is attackable if it still alive and has not been attacked 10 times this round</li>
    <li>when a unit attacks, it deals 1 or 2 damage (2 in the case of an attacking zergling)
        to the first attackable defending unit</li>
    <li>if no attackable defending units remain, the round is over</li>
</ul>
</P>

<P>
Once one clears up the rules in this manner, the implementation is simple.
</P>

<P>
Now that we have solved the simulation problem, it's time to address efficiency.
The minimum number of zerglings will be <tt>4</tt>, and the maximum number will be <tt>2587</tt>,
as one can glean by looking at the examples provided in the problem statement.
However, iterating from <tt>4</tt> to <tt>2587</tt> and running a complete simulation with
that many zerglings will possibly take too long (depending on how efficiently one implements the solution).
</P>

<P>
What we have here is a searching problem.  We have a well-defined range
(<tt>4..2587</tt>), and we even have a function (our simulation) that can tell us if the
result we are searching for is less than or not less than any particular value.  With this
in mind, it becomes obvious that we want to use a
<a href="http://planetmath.org/encyclopedia/BinarySearch.html" target="_blank" class="bodyGeneric">binary search</a>.
</P>

<P>
The reason that a binary search is appropriate is that we have a function that can narrow our
search space by half at each step.  If we try some value <tt>z</tt> for the number of zerglings,
and find from our simulation that this value is too low, we know that <tt>z + 1</tt> must be
the new lower bound.  Otherwise, we know that <tt>z</tt> is the new upper bound.
When we get the lower bound and upper bound to meet, we have narrowed <tt>z</tt> down to the
only minimum value that passes the simulation, which is our answer.
</P>

<P>
If we had used our simple linear search, we would have had to perform up to <tt>2584</tt>
simulations, which might take on order of minutes to complete for most solutions.
If we use binary search, we halve our search space at each step, thus reducing the number
of simulations to <tt>ceil(log<sub>2</sub> 2584) = 12</tt> steps.  Binary search is a simple
but powerful tool in situations where it is appropriate.
</P>

<P>
In summary, the only two difficulties of this problem are implementing an efficient search,
and reading and understanding the problem statement.  Not that I am faulting the problem
writer on this count; the obfuscation was most likely intentional, to make the problem
more challenging (and it's fun to write problems like that).  Problem statements like this
are a pretty common occurrence in ACM contests (although StarCraft references may be few and far between).
</P>

<P>
<B>Division-II, Level 3: Rumba</B>
</P>

<P>
The <tt>Rumba</tt> problem basically provides a set of rules, describing a sort of state machine.
All that is necessary to solve this problem is to correctly construct this state machine and
evaluate it.  The construction can actually be implicit.  The state machine can be represented
as a "dance graph" of reachable states.  We simply need to traverse this graph, using either a
depth-first or breadth-first traversal.
</P>

<P>
The dance graph does not ever need to be explicitly constructed;
the structure of this graph can be implicit in how we call our functions.
Each vertex of the dance graph consists of a combination of our location in the move sequence
and our position (open, close, or fan).  Directed edges between vertices represent a valid
transition from one state to another.  We also have four initial vertices, representing the
initial states (undefined location in the move sequence, as the dance has yet to begin, and
one of each of the possible positions, since we can start in any position).
</P>

<P>
We can represent the current state by our position in the move sequence and by the set of positions
that we can possibly be in at the current point in the routine.  That is, we can have three boolean
variables, representing open, close, and fan.  Since initially the position doesn't matter, any
position is possible, so all three variables are initialized to true.
</P>

<P>
We then iterate through the sequence of moves.  For each move, we first determine whether or not
a position is possible which makes the move valid.  For instance, if the fan variable is false,
it means a move if <tt>"HOCKEY STICK"</tt> is invalid.  If the next move is valid, we then modify
our three variables based on what the possible outcomes are.  This information is all conveniently
provided at the beginning of the problem statement, where the list of valid positions for commencing
and ending each move is given.
</P>

<P>
This solution is equivalent to a breadth-first search through the dance graph.  The representation
of the graph is implicit, but the frontier is represented by the three boolean variables.  The
computation of new values for these variables at each step is equivalent to enumerating all the
vertices that are reachable in one step from vertices in the frontier.  A depth-first traversal
could also be done in a similar manner, most likely involving a recursive function operating on
a single value representing an actual position rather than a set of variables giving a set of possible positions.
</P>

<P>
<B>Division-I, Level 3: DVD</B>
</P>

<P>
The Level 3 problem is the sort of problem that few people can solve in a contest situation, but in retrospect
turns out to be not quite as difficult as it seemed before.  Only 18 out of 232 even submitted a solution for
this problem, and unfortunately I was not one of them.  However, Room 1 submissions tend to be quite edifying,
and this match proved to be no exception.
</P>

<P>
<B>Algorithm</B>
</P>

<P>
NDBronson's solution is an elegant combination of a binary search with a
<a href="http://planetmath.org/encyclopedia/RecurrenceRelation.html" target="_blank" class="bodyGeneric">recurrence relation</a> (and it happens
to be commented as well, for some strange reason).
The binary search uses a predicate (call it <tt>isPossible</tt>), which takes as input a number <tt>n</tt>
and the number of sheets and returns true if it is possible to form all the numbers from <tt>1</tt> through
<tt>n</tt> with those sheets.  The binary search is basically the same as that we might have used for the
<tt>StarCraft</tt> problem, with <tt>isPossible</tt> as the predicate rather than the simulation.
</P>

<P>
The problem is now reduced to solving <tt>isPossible</tt>.
To do this we iterate through each digit (<tt>0..9</tt>) and count how many times it appears in the numbers
(<tt>1..n</tt>).  If this number is greater than twice the number of sheets for any digit, we return false.
Otherwise, if all the digits pass, we return true.  The problem is now reduced to a new problem: counting
the number of occurrences of a digit in a sequence of numbers.
</P>

<P>
This is where our recurrence relation comes in.  As <A HREF="/tc?module=MemberProfile&amp;cr=152073" CLASS="bodyGeneric">NDBronson</A> 
did, we will call the function that implements
the recurrence relation <tt>occurrences</tt>, and it will take as input a digit (which we will simply call <tt>digit</tt>)
and the upper bound of the
sequence (which we will call <tt>max</tt>).  It will return the number of times <tt>digit</tt> appears in the numbers between <tt>1</tt> and
<tt>max</tt>, inclusive.
</P>

<P>
The first step is to count the number of times the digit occurs in the ones place.  This is obtained by
integer division of <tt>max</tt> by <tt>10</tt>.  However, if the ones digit of <tt>max</tt> itself is greater than
or equal to the digit we are counting, we need to add an additional one to the count.
</P>

<P>
Next we count the number of times the digit occurs in any location but the ones place.  This is where the recurrence
occurs.  There is a slight trick here, however.  Intuitively we will want to count the occurrences of <tt>digit</tt>
in <tt>1..(max / 10)</tt> and multiply by <tt>10</tt>, because there our <tt>10</tt> digits we can append to each of
the numbers in the smaller sequence to get numbers in our current sequence.
However, for <tt>max / 10</tt> itself, there may be fewer than <tt>10</tt> such numbers.
Therefore we call <tt>occurrences</tt> with the same value for the digit, but with <tt>max / 10 - 1</tt> (integer division)
as the new upper bound.  We multiply this by <tt>10</tt> and add it to our previous result.
</P>

<P>
We then count the number of times <tt>digit</tt> occurs in <tt>(10 * (max / 10))..max</tt>.
We do this by counting how many times it occurs in <tt>max / 10</tt> (a simple iteration over the digits,
counting the ones that match) and multiplying this count by one plus the ones digit of <tt>max</tt> (e.g. <tt>max % 10 + 1</tt>).
The reason we add the <tt>1</tt> is that we are counting digits in <tt>0..d</tt>, not <tt>1..d</tt>.
</P>

<P>
We then add all these values we've accumulated and return the sum.  This sum is the number of occurrences of <tt>digit</tt>
in <tt>1..max</tt>.
</P>

<P>
<B>Analysis</B>
</P>

<P>
We will presume that the answer to our solution is between <tt>0</tt> and <tt>MAX_INT</tt>, which is <tt>2<sup>31</sup>-1</tt>.
Since with each iteration of the binary search we reduce the search space by half, there will be at most <tt>31</tt> or so calls
to <tt>isPossible</tt>.  This means that the runtime of <tt>isPossible</tt> (that is, <tt>occurrences</tt>) is the overwhelming
factor in runtime here.
</P>

<P>
The recurrence in <tt>occurrences</tt> consists of iterating through <tt>10</tt> possible digit values, reducing the input number by <tt>1 / 10</tt>.
So we know the depth of the recursion is at most <tt>log<sub>10</sub> max</tt>, and there is no branching as <tt>occurrences</tt> only calls itself once
during its lifetime.  Therefore <tt>occurrences</tt> is <tt>O(log n)</tt>.
</P>

<P>
I think it's reasonable to state that the upper bound of the search space is <tt>O(n)</tt>.
Therefore, by combining binary search, which is <tt>O(log n)</tt>, with <tt>occurrences</tt>, which is also <tt>O(log n)</tt>,
the overall runtime complexity of this algorithm is the product, which is <tt>O(log<sup>2</sup> n)</tt>.  That's pretty fast.
</P>

<IMG SRC="/i/m/Logan_mug.gif" ALT="" WIDTH="55" HEIGHT="61" BORDER="0" HSPACE="6" VSPACE="1" ALIGN="left"/>
By&#160;Logan<BR/><DIV CLASS="smallText"><I>TopCoder Member</I><BR/><A HREF="/tc?module=MemberProfile&amp;cr=112902" CLASS="smallText">Author Profile</A></DIV><BR CLEAR="all"/>
          <P><BR/></P>
          
<P><B>Member Comments</B></P> 
<P>
Logan,
</P>

<P>
I think you do a *very* good job in analyzing the problems in such a way
that even I can understand them.  However, I think you over-analyzed the
Rumba problem.  There is no need to build a state machine nor walk any
graphs.  All you need to do is step through the steps and evaluate
whether the opening position is a possible outcome of the prior step's
closing position (or recursively prior on the backward step).
</P>

<P><A HREF="/tc?module=MemberProfile&amp;cr=119676" CLASS="bodyGeneric">Pops</A></P>
<HR/>

<P>
Another very nice analysis, thanks a lot. However, some comments:
</P>

<P>
Div-II easy problem: I'd say the real most basic iteration is for ( i=1;
i&#60;n; ++i ), not to the floor of n/2.
</P>

<P>
One thing that should be mentioned for the binary search is that the
functions are monotone, otherwise we couldn't apply it.
</P>

<P>
Div-I hard problem: It suffices to check the 1-digit, since this is
always the first we run out of. No need to check the other digits.
</P>

<P><A HREF="/tc?module=MemberProfile&amp;cr=263379" CLASS="bodyGeneric">pochmann</A></P>
<HR/>

<P>
Hi Logan,
</P>

<P>
Once again, a very nice problem set analysis.  I'm a little confused on
how your state machine implementation of the div. 2 hard would look though 
(codewise).  If you have time, could you possibly post a solution using
this state machine idea?
</P>

<P><A HREF="/tc?module=MemberProfile&amp;cr=101459" CLASS="bodyGeneric">Steven</A></P>

          <P><BR/></P>
               </TD>
               <TD VALIGN="top" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
            </TR>
            <TR>
               <TD COLSPAN="4" VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="10" BORDER="0"/></TD>
            </TR>      
            <TR>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="11" ALIGN="right"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" WIDTH="75"><IMG SRC="/i/table_mid_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>   
            <TR>
               <TD VALIGN="top" WIDTH="11" ALIGN="right" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="11" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="14"><IMG SRC="/i/table_btm_left2.gif" ALT="" WIDTH="14" HEIGHT="8" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="100%"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
               <TD VALIGN="top" BGCOLOR="#FFFFFF" WIDTH="10"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD>
            </TR>
         </TABLE>
      </TD>
  <!-- Center Column Ends -->
<!-- Body Area Ends -->

   <!-- Gutter -->
      <TD WIDTH="4" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="4" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   <!-- Right Column Begins -->
      <TD WIDTH="170" BGCOLOR="#FFFFFF" VALIGN="top"><IMG SRC="/i/clear.gif" WIDTH="170" HEIGHT="1" BORDER="0"/><br/>
<!-- Right Column Include Begins --> 
        <xsl:call-template name="public_right_col"/>       
<!-- Right Column Include Ends -->        
        </TD>
   <!-- Right Column Ends -->
   <!-- Gutter -->
      <TD WIDTH="10" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" WIDTH="10" HEIGHT="1" BORDER="0"/></TD>
    <!-- Gutter Ends -->
   </TR>
</TABLE>
<!-- Body Ends -->
        <xsl:call-template name="Foot"/>
      </BODY>
    </HTML>
  </xsl:template>
</xsl:stylesheet>


