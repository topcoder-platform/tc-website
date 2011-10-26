<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>



<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<%-- Left Column Begins--%>
   <td width="180" id="onLeft">
      <jsp:include page="/includes/global_left.jsp">
         <jsp:param name="node" value="algo_match_editorials"/>
      </jsp:include>
   </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../page_title.jsp" >
<jsp:param name="image" value="statistics_w"/>
<jsp:param name="title" value="Match Editorial"/>
</jsp:include>

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br />
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br /></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br /></span>
    <A href="/stat?c=round_overview&er=5&rd=12168">Match Overview</A><br />
    <tc-webtag:forumLink forumID="520704" message="Discuss this match" />
</div>
<span class="bodySubtitle">SRM 396</span><br />Thursday, April 3, 2008
<br /><br />



<h2>Match summary</h2> 

<p>
In division I, <tc-webtag:handle coderId="19849563" context="algorithm"/> immediatly took the lead with the fastest 250. Few minutes afterwards, 
<tc-webtag:handle coderId="15868491" context="algorithm"/> with an excellent performance on the 500 managed to reach the top. However, an extremely fast
1000 and a successful challenge granted <tc-webtag:handle coderId="19849563" context="algorithm"/> the victory. <tc-webtag:handle coderId="15868491" context="algorithm"/> taking the second place added his name 
to the target list.
</p> 
<p>
In division II, the coders faced a quite tricky 1000 pointer. Only 8 coders managed to solve it correctly.
<tc-webtag:handle coderId="22688641" context="algorithm"/> took the first place advancing to division I followed by <tc-webtag:handle coderId="22692170" context="algorithm"/> and <tc-webtag:handle coderId="22699509" context="algorithm"/>.
</p> 
 
<H1> 
The Problems 
</H1>


<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8740&amp;rd=12168" name="8740">VerifyCreditCard</a></b> 
</font> 
<A href="Javascript:openProblemRating(8740)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520704" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      716 / 773 (92.63%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      625 / 716 (87.29%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>nitdgp</b> for 247.65 points (2 mins 46 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      198.05 (for 625 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
This problem was a simple implementation of Luhn method. Coders were asked to correctly parse the input data
and calculate the sum of the digits of odds and even positions while doubling the appropriate digits correctly
and taking care of the case where the resulting number is bigger than 9. A card number is invalid when 
the sum is not a multiple of 10. This could easily be checked by calculating the remainder modulo 10.
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8584&amp;rd=12168" name="8584">DNAString</a></b> 
</font> 
<A href="Javascript:openProblemRating(8584)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520704" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      332 / 773 (42.95%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      214 / 332 (64.46%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>faeton</b> for 467.23 points (7 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      299.72 (for 214 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      250 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      515 / 548 (93.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      439 / 515 (85.24%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 247.14 points (3 mins 4 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      201.08 (for 439 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem asked you to calculate the minimum number of changes needed to make the dna string periodic
with period less than or equal to maxPeriod.
</p>
<p>
Suppose that we want our string to be periodic with period 1. Then every character must be the same. So
what we need to do is to keep the character that appears the most times and change all the others.
</p>
<p>
In case we want it to be periodic with period 2, characters in an odd positions must be the same and so
must be characters in even positions. So we change all the characters in odd positions to the character
that appears the most times in an odd position and all the characters in even positions to the character
that appears the most times in an even position.
</p>
<p>
Following this pattern it is easy to see that to calculate the minimum number of changes needed to make a 
string periodic with period p we need to make characters with the same positions modulo p equal and this
can be done by greedily picking the character that appears the most times.
</p>
<p>
So for the actual solution we iterate through every acceptable period and calculate the minimum number of 
changes needed. See <tc-webtag:handle coderId="22692170" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269670&rd=12168&pm=8584&cr=22692170">code</a>
for a clear implementation. 
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8721&amp;rd=12168" name="8721">RemovingDigits</a></b> 
</font> 
<A href="Javascript:openProblemRating(8721)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520704" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division Two - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      188 / 773 (24.32%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      8 / 188 (4.26%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>xjtuhyh</b> for 612.36 points (26 mins 25 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      526.90 (for 8 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The tricky part about the problem was that it asked for the maximum number that can be made by removing the
given digits while in fact the correct approach was to think about which digits must stay. So the correct
algorithm to create the desired number is to start with no digits and append the maximum possible digit at
the end of the number. But how do we check if it is possible to add a certain digit? Well, that digit must 
satisfy two conditions:
</p>
<ul>
<li>The digit must appear strictly more times in number than in digits because otherwise we won't have enough digits to remove</li>
<li>It must be possible to remove all the digits that appear before that digit.</li>
</ul>

<p>
<tc-webtag:handle coderId="22688641" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269684&rd=12168&pm=8721&cr=22688641">solution</a>
follows the method described above. 
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8615&amp;rd=12168" name="8615">FixImage</a></b> 
</font> 
<A href="Javascript:openProblemRating(8615)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520704" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Two: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      500 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      342 / 548 (62.41%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      253 / 342 (73.98%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Burunduk1</b> for 442.67 points (10 mins 30 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      282.49 (for 253 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
Let's first try to find a more useful definition of a smooth block by examining several of its properties.
Notice that for any two pixels A and B in the same row of the same block the only path that has length equal 
to their manhattan distance is the path that passes through the pixels between them. So every pixel in the 
same row as A and B that lies between them must be black. The same applies for any two pixels of the same
column. So when examining a smooth block by each row or by each column, that block must consist of at most
a single part.
</p>
<p>
We will now prove that this property is enough for a block to be smooth. A block with this property is always
smooth as there exists a path equal to the manhattan distance for every 2 pixels. Suppose that we have pixels 
A and B and without loss of generality B is upper and righter than A. We can reach pixel B from A only by 
going up or right to black pixels with smaller manhattan distance from B. This will always be possible because of
the previous property. But such a path is the shortest possible path as it doesn't make any unnecessary steps
and uses only black pixels. And since this applies for any 2 pixels inside the block, the block is smooth.
</p>
<p>
Based on the above property we conclude that in order to make a block smooth we must turn to black every
pixel between the leftmost and the rightmost pixel in each row and every pixel between the topmost and the 
bottommost in each column. The pixels that need to be changed are fixed and they don't depend on the other 
changes we make so the answer that makes the minimum number of changes is always unique.
</p>
<p>
So using these ideas we can create an algorithm that makes every block smooth until all blocks are smooth.
</p>
<pre>
blocks_are_smooth = false
while blocks_are_smooth == false {
    blocks_are_smooth = true
    Find the blocks using a flood fill algorithm
    For each block {
        For each row {
            Find the leftmost and 
            the rightmost pixel of the block
            Turn every pixel in between black
            if at least one change was made
                blocks_are_smooth = false
        }
        For each column {
            Find the topmost and 
            the bottommost pixel of the block
            Turn every pixel in between black
            if at least one change was made
                blocks_are_smooth = false
        }
    }
}
return the image
</pre>
<p>
This algorithm is very unoptimized and may run a bit slow. Some optimizations that can be made is to calculate
the leftmost, rightmost, topmost and bottommost pixels when finding the blocks and avoid pointless searching
over smooth blocks already searched.
</p>
<p>
For an implementation of this approach you can look at <tc-webtag:handle coderId="15868491" context="algorithm"/>'s 
<a href="/stat?c=problem_solution&rm=269638&rd=12168&pm=8615&cr=15868491">submission</a> 
</p>

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=8587&amp;rd=12168" name="8587">MoreNim</a></b> 
</font> 
<A href="Javascript:openProblemRating(8587)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=520704" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level Three: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      1000 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      62 / 548 (11.31%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      39 / 62 (62.90%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>ACRush</b> for 976.01 points (4 mins 28 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      603.09 (for 39 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 
<p>
The problem was about a game played in two phases. The first phase was for each player to remove as many 
heaps as the player wants and the second one was a normal <a href="http://en.wikipedia.org/wiki/Nim">Nim</a> game.
</p>
<p>
The solution to the normal Nim is a very common combinatorial game theory result: The player that is presented
with a set of piles such that the xor (or the nim-sum as it is usually called) of the heap sizes is 0 will
lose the game if his opponent plays optimal.
</p>
<p>
Now for the first phase, after the first player makes his move removing several heaps, the second player
will try to remove some of the remaining heaps so that the first player will be at a losing position at the
beginning of the second phase. But since the first player doesn't want that to happen he must choose the heaps
to remove carefully so that no subset of the remaining heaps has xor of the heap sizes 0.
</p>
<p>
We can consider the heap sizes as vectors over GF(2) containing only zeros and ones as their coordinates 
according to their binary representation. For example, a heap with size 5 has binary representation 
(101)<sub>2</sub> and corresponds to the vector (1,0,1). Notice that the xor is equivalent to addition of the
vectors over GF(2). <br/>
5 xor 6 = 3 =&gt; (1,0,1)+(1,1,0)=(1+1,0+1,1+0)=(0,1,1). <br/>
Let's call our vectors a1,...,aN.
We want to find a subset of them b1,...,bK such that no subset of the bis has sum 0. So the equation:
b1*c1+..+bK*cK = 0 where cis are either 0 or 1 must have only one solution where every ci is 0. So what
we are really looking for is a linearly independent (over GF(2)) subset of our original vectors.
</p>
<p>
After these considerations all that is left is to find which vectors to remove so that the sum of their 
values is minimum. This can be done in two ways. The first way is to consider the vector space that is created
by the original vectors and remove each time the minimum possible that does not change the vector space. We
can check this by checking if removing a single vector reduces the dimension of the vector space. The other
way is to initially start with an empty set of vectors and add the largest one that maintains the linear
independence. Then remove from the rest of them.
</p>
<p>
Checking for linear independence or finding the dimension of the vector space can be done using Gaussian
Elimination. <tc-webtag:handle coderId="22014601" context="algorithm"/>'s
<a href="/stat?c=problem_solution&rm=269642&rd=12168&pm=8587&cr=22014601">solution</a>
uses the second method. 
<tc-webtag:handle coderId="19849563" context="algorithm"/>'s very fast <a href="/stat?c=problem_solution&rm=269640&rd=12168&pm=8587&cr=19849563">submission</a> picks the largest vector that maintains linear independence as well but does
that in a single Gaussian Elimination.
</p>


<br /><br />


<div class="authorPhoto">
    <img src="/i/m/nophoto.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="21052072" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
   <td width="170" id="onRight">
  <jsp:include page="../public_right.jsp">
   <jsp:param name="level1" value="default"/>
  </jsp:include>
   </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
