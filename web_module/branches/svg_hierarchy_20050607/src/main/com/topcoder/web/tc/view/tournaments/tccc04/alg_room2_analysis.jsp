<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>2004 TopCoder Collegiate Challenge - Computer Programming Tournament - Summary</title>

<jsp:include page="../../script.jsp" />

<link type="text/css" rel="stylesheet" href="/css/TCCC04style.css"/>
    
</head>

<body>

<jsp:include page="../../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="level1" value="events"/>
                <jsp:param name="level2" value="tournaments"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"/></td>
<!-- Gutter Ends -->

<!-- Center Column Begins -->
         <td class="bodyText" WIDTH="100%">

<jsp:include page="tccc04Head.jsp" />

<!-- Tab bar links-->
<jsp:include page="tccc04links.jsp" >
   <jsp:param name="tabLev1" value="algorithm"/>
   <jsp:param name="tabLev2" value="summary"/>
   <jsp:param name="tabLev3" value="room2"/>
</jsp:include>

            <img src="/i/clear.gif" width="1" height="10" border="0"/><br/>
            <div class="leadPhoto">
            <span class="bodyText" align="center"><p align="center"><a href="/tc?module=Static&d1=tournaments&d2=tccc04&d3=photos">See more photos!</a></p></span>
            <img src="/i/tournament/tccc04/onsite_photos/room2.jpg" alt="" width="200" height="350" class="photoFrameBig" /><br/>
            <span class="leadPhotoCaption">reid goes to the finals<br/><br/></span>
            </div>
            
            <h2>Local favorite reid advances</h2>

            <a href="/tc?module=MemberProfile&cr=269554"><img src="/i/m/Yarin_mug.gif" alt="" width="55" height="61" border="0" align="left" class="myStatsPhoto"/></a>
            <p>by <a href="/tc?module=MemberProfile&cr=269554">Yarin</a>, <br/>
            <em>TopCoder Member</em><br />
            Thursday, April 15, 2004<br/>
            introduction by lbackstrom<br/><br/></p>

<p>
Long time member reid, the second highest seeded competitor in the event, was 
heavily favored to win this round, with a probability of 45%.  However, he started 
Room 2 off slowly, submitting a rather involved easy problem after 20 minutes.  
Instead, antimatter took the early lead, submitting the easy after 14 minutes, 
followed by bladerunner and then aneubeck.  Two more easy problem submissions 
followed in the next few minutes, and 6 of the competitors had submitted after 25 
minutes, all of whom moved on to the medium problem.  However, despite taking a 
while on easy problem, reid was the first to submit the medium problem, and had two 
problems in after 40 minutes.  In the next 20 minutes, bladerunner, antimatter, and 
kalmakka all submitted the medium problem.  Despite some furious typing, no one was 
able to submit the hard problem, and at the end of the coding phase, everyone had 
submitted the easy problem, and six coders submitted the medium.
<br/><br/>
The challenge phase was incrementally more exciting than the first round, as Jan 
Kupiers unsuccessfully challenged kalmakka.  Going into the system tests, reid 
was in first, followed by bladerunner and antimatter.  The system testing phase was 
rough on some members, as both aneubeck and antimatter lost both of their problems, 
and kalmakka moved up to third.  Thus, reid moves on to the finals, while bladerunner 
and kalmakka have to go through it all again.
</p>

<h1>TextColumns</h1>

<p>
This is a fairly straightforward problem although it requires several steps:
</p>

<ul>
<li>Determine empty character columns.
<li>Determine where the text columns are.
<li>For each text column, determine the top and bottom non-empty line.
<li>Loop through all lines between the top and bottom line for each text column and concatenate the text to a temp string. At empty text column lines, add this temp string to an output array, and reset the temp string. Only do this if the temp string is not empty.
<li>Finally, for each string in the output array, replaces all sequences of spaces with a single space and remove leading and trailing spaces completely.
</ul>

<p>
Each step is a fairly simple task, and several of them can be done in one sweep.
It should be easier and less error prone to split them into several tasks though.
</p>

<h1>TablePartitions</h1>

<p>
Since all constraints must hold, the constraints for a partition can be specified as intervals for each column. For instance, a partition defined as "a&gt;5 b&gt;=9 a&lt;9 d=3" in
a table with 4 columns can be defined with the intervals { (6-8), (9-100), (0-100), (3-3) }
where all intervals are inclusive.
</p>

<p>
The first step then becomes to parse the input. For each partition, we split
the constraint string at the spaces, and loop through all individual constraints, maintaining
the intervals for each column. The min and max for each column is initially
set to 0 and 100, respectively, since those are the maximum values. It's important not to just set the min or max
for each column to the value in the constraint since that would cause problems
on elements such as "a&gt;10 a&gt;3". Care needs also to be taken of the equality
operator; it's easiest to treat this as two operators, both &lt;= and &gt;=.
</p>

<p>
Once this is done, it becomes easy to check the <tt>EMPTY</tt> case:
If, for any partition, the interval for a column is such that the min
value is greater than the max value, then obviously no element can
go into this partition. Otherwise at least one element satisfies
all constraints in a partition.
</p>

<p>
Before considering the remaining cases, let's first try to visualize the partitions.
If there were only two columns, a partition can be described with two intervals
as mentioned above. Now, this is exactly how one could define a 2D rectangle in
the Cartesian coordinate system with the sides parallel to the axis. This can easily be extended to the general case: in a table with <i>n</i> columns, each partition can be
thought of as a <i>n</i>-dimensional rectangle.
</p>

<p>
Now, the second case is <tt>OVERLAP</tt>. This corresponds to when two
of the <i>n</i>-dimensional rectangles overlap. We thus check, for each
pair of partitions, whether there exist elements in each column that
could go to both partitions. This can be done with the following C++ code:
</p>

<pre>
    for(int i=0; i&lt;noPartitions; i++)
        for(int j=i+1; j&lt;noPartitions; j++) {
            // Check if partitions i and j overlap
            bool overlap = true;
            for(int col=0; col&lt;noColumns; col++) {
                int newMin = max(intervalMin[i][col], intervalMin[j][col]);
                int newMax = min(intervalMax[i][col], intervalMax[j][col]);
                if (newMin&gt;newMax)
                    overlap = false;
            }
            if (overlap)
                return "OVERLAP";
        }
</pre>

<p>
The last thing to check is completeness. This turns out to be very
easy to check with the <i>n</i>-dimensional rectangles metaphor:
since we know the rectangles don't overlap, all we have to do is
check if the sum of the "volumes" for each rectangle equals the
volume of the whole table (which is 101<sup>n</sup>).
Here we have to be a bit careful: this sum won't fit in an int
if there are 5 or more columns, so we have to use long (long long in C++).
This can be implemented like this:
</p>

<pre>
    long long sum = 0, totalVol = 1;
    for(int col=0; col&lt;noColumns; col++)
        totalVol *= 101;
    for(int i=0; i&lt;noPartitions; i++) {
        long long vol = 1;
        for(int col=0; col&lt;noColumns; col++)
            vol *= (intervalMax[i][col]-intervalMin[i][col]+1)
        sum += vol;
    }
    if (sum&lt;totalVol)
        return "INCOMPLETE";
    return "OK";
</pre>

<h1>Mhing</h1>

<p>
The first observation to make is that we can assume that all cards we pick
up will be a Mhing card, and since we always will need one card, we can just
pick up a card right away so we have 14 cards. The task at hand (pun intended)
is to determine the least number of these cards that we have to replace with
Mhing cards so that we get a Mhing hand.
</p>

<p>
Before considering what algorithm to use, let's find a suitable representation
for the cards. The honor cards can simply be thought of as individual suits,
each having value 1. That is, if bamboo, character and dots are suits
0, 1 and 2, the west wind can be suit 3, east wind suit 4 etc. Then
we don't have to treat these cards differently since they can't occur
in sequences when they all have the same value.
</p>

<p>
It's very tempting to loop over all 2<sup>14</sup> subsets of cards, and
replace those cards not in the subset with Mhing card and check whether
you can form a Mhing hand of the cards. It turns out it's not so easy to
determine whether 14 given cards (which will include Mhing cards) can be
partitioned into groups using a simple strategy. It should be possible,
but it's a very error prone method.
</p>

<p>
A much safer method is to just try all possible card groupings,
using memoization to avoid exceeding the 8 second time limit.
This can be done at the same time we're checking which cards
to replace with Mhing cards. We define a recursive function with the following head:
</p>

<pre>
int replace(int mask, int mhingCards, bool pairUsed)
</pre>

<p>
The <tt>replace</tt> function should return the least number of cards
that needs to be replaced to get a Mhing hand. <tt>mask</tt> is
a bitmask (essentially a subset of the original cards) telling which
cards must yet be assigned to a group (or replaced), <tt>mhingCards</tt> is the number of available Mhing cards and <tt>pairUsed</tt> tells if the pair group has yet been decided
(remember that there should be exactly one pair group).
Note that in this approach, we have to separate
the Mhing cards from the other cards. So, if 3 of the 13
cards in the input are Mhing cards, only 10 bits in the bitmask
should be used, and <tt>mhingCards</tt> should initially be 4 (since
we add an extra Mhing card right away to get 14 cards total).
The state space is small enough to use memoization.
</p>

<p>
To evaluate the function, start by looping over all cards that still
has not be assigned a group (from now on referred to "is in the mask");
let this card have index <i>i</i> in the mask (if all cards have
been assigned a group, we are done; the method then returns 0).
There are now several options for this card:
</p>

<ul>
1) The card should not belong to any group; we replace it with a Mhing card.<br>
2) The card is part of a group with 3 cards where the other two cards are in the mask.<br>
3) The card is part of a group with 3 cards where only one other card is in the mask (1 Mhing card needed).<br>
4) The card is part of a group with 3 cards where none of the other two cards are in the mask (2 Mhing cards needed).<br>
5) The card is part of the pair where the other card is in the mask.<br>
6) The card is part of the pair where the other card is not in the mask (1 Mhing card is needed).<br>
</ul>

<p>
All cases must always be considered, if they're legal (i.e. we can't use a card in a pair
if <tt>pairUsed</tt> is set etc).
For instance, the result of the first case would simply be <tt>replace(mask-(1&lt;&lt;i), mhingCards+1, pairUsed)+1</tt>. In case 3, we first check that <tt>mhingCards</tt> is at least 1. If so, loop over all remaining cards and let <i>j</i> be the index of this card. If <i>i</i> and <i>j</i> can be in the same group of 3 cards (with the help of a Mhing card), the result of this case would be <tt>replace(mask-(1&lt;&lt;i)-(1&lt;&lt;j), mhingCards-1, pairUsed)</tt>.
</p>

<p>
Of all possible options for any card <i>i</i>, we of course select the one with the minimum number of replacements. No extra pruning is needed, the recursive function with
memoization is enough to make the problem run within the time limit.
</p>

<p>The pseudo code for the recursive function can look like this: (without the memoization part).</p>

<pre>
    int replace(int mask, int mhingCards, bool pairUsed)
    begin
        if mask is empty, return 0
        best = infinity
        for each i in mask begin
            case1 = replace(mask-(1&lt;&lt;i), mhingCards+1, pairUsed)+1
            
            for each j and k in mask
                if i,j,k can form a 3-group
                    case2 = replace(mask-(1&lt;&lt;i)-(1&lt;&lt;j)-(1&lt;&lt;k), mhingCards, pairUsed)
            
            if mhingCards>0 then
                for each j in mask
                    if i,j an form a 3-group with the help of a Mhing card
                        case3 = replace(mask-(1&lt;&lt;i)-(1&lt;&lt;j), mhingCards-1, pairUsed)
            
            if mhingCards>1 then
                case4 = replace(mask-(1&lt;&lt;i), mhingCards-2, pairUsed)
    
            if not pairUsed then begin
                for each j in mask begin
                    if i,j can form a pair
                        case5 = replace(mask-(1&lt;&lt;i)-(1&lt;&lt;j), mhingCards, true)
                 
                if mhingCards>0
                    case6 = replace(mask-(1&lt;&lt;i), mhingCards-1, true)
            end
            best = min of (best, case1, case2, case3, case4, case5, case6)
        end  
        return best
    end
</pre>

<p>
The for each statements above should of course only loop over unique
indexes, i.e. <i>i</i>, <i>j</i> and <i>k</i> are always different cards.
The functions to check whether two or three cards can form a group of
cards are all fairly straightforward to implement, so I won't
discuss them here.
</p>

         <p><br/></p>
         </td>
<!-- Center Column Ends -->

<!-- Gutter -->
         <td width="15"><img src="/i/clear.gif" width="15" height="1" border="0"></td>
<!-- Gutter Ends -->

<!-- Right Column Begins -->
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>
