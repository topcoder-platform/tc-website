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
<tc-webtag:forumLink forumID="505770" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 265</span><br>Tuesday, September 27, 2005
<br><br>

<span class="bigTitle">Match summary</span>
<p>As a few of the Google Code Jam finalists were still making their way 
back to their respective homes, SRM 265 started early tuesday morning. In 
fact the top four placers were also finalists: <b>ploh</b> in fourth, 
<b>venco</b> taking third, <b>Petr</b> in second, and solving all three 
<b>misof</b> in first. They, as well as the other top three finishers in 
each room, were also awarded with a cash prize which gave further incentive 
to compete in the early match.</p>

<p>The competition in division 2 was also fierce with 12 coders solving all 
three problems and the top two finishers in each room winning a prize. 
<b>agray</b> won the division and advances to division 1 for the first time, 
<b>seliv</b> took second, and competing for the first time <b>bertas</b> 
took third.</p>

<H1>
The Problems
</H1>
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2000&amp;rd=8007" name="2000">FontSize</a></b>
</font>
<A href="Javascript:openProblemRating(2000)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      402 / 467 (86.08%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      374 / 402 (93.03%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>piyush___</b> for 249.69 points (0 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      202.42 (for 374 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p> This problem demonstrates an excellent use of a table. Typically the 
size of each character depends on which font face is used, whether the font 
is bold or italic, and the point-size of the font. Modern fonts don't 
actually keep an image of each character but rather a mathematical 
description that can be used to calculate how to draw it at different sizes. 
In cases where these calculations can be time consuming it is a good idea to 
just draw each character once into a table.  </p>
<p> For this problem the entire character isn't drawn into a table, but the 
width of each character is. Thus to determine the width of a string you 
simply need to look each character up in the table and add its width to the 
running total. The only complications are dealing with uppercase letters, 
lowercase letters, and the space character separately. Finally you can add a 
number of inter-character pixels equal to one less than the number of 
characters in the sentence.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1993&amp;rd=8007" name="1993">ScheduleStrength</a></b>
</font>
<A href="Javascript:openProblemRating(1993)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      233 / 467 (49.89%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      166 / 233 (71.24%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>leiz</b> for 438.13 points (10 mins 59 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      247.60 (for 166 correct submissions)
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
      301 / 333 (90.39%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      283 / 301 (94.02%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>Michael_Levin</b> for 233.85 points (7 mins 34 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      169.52 (for 283 correct submissions)
    </td>
  </tr>
</table></blockquote>


<p> Most sports have a way to break ties that will determine which team 
makes the play offs, but usually they are never used. Truthfully, how many 
of you know exactly how to determine who will advance to the finals of the 
TCO in case of a tie? In American football, however, since the season is 
only 16 games, ties are a common occurence allowing strength of schedule to 
come into play. </p>
<p> This problem, although somewhat complex, is straight forward. As long as 
you follow each direction in the problem statement (which may require 
reading and rereading to get the details right) you can solve the problem. 
</p>
<p>The first step is to calculate for each team their opponent's cumulative 
winning percentage. To do this simply count the number of wins and total 
number of games which a) are by a team that played the current team and b) 
are for a game that did not involve the current team. Once you have these 
two numbers then you know their opponent's cumulative winning percentage is 
wins/games. </p>
<p>Now you can sort each team first on its opponent's winning percentage and 
secondly on the team's name. Here you must be careful how you do the sort if 
you are using floating point numbers. In this problem it's not too difficult 
to avoid floating point numbers by using the standard way to compare 
rational numbers (assuming wins[i] and games[i] are those used for 
calculating team i's opponent's cumulative winning percentage):</p>
<pre>
<center>wins[i]*games[j] < wins[j]*games[i]</center>
</pre>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=2001&amp;rd=8007" name="2001">PipePuzzle</a></b>
</font>
<A href="Javascript:openProblemRating(2001)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      21 / 467 (4.50%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      16 / 21 (76.19%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>agray</b> for 714.70 points (19 mins 40 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      494.15 (for 16 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>It turns out that as you follow the flow of water you only need to make a 
decision as to how to place the 'L' pipes. If you encounter either a '-' or 
a '+' then you can always place it such that the pipe is aligned along the 
direction that the water flows. Since there can be at most 20 'L' pipes 
there are at most 2<sup>20</sup> paths. This is small enough that you can 
follow each path and count the number of pipes used. </p>
<p>First start off at the square that contains the water source and keep 
track of which direction the water is flowing. Then move to the next square 
based on what the current direction is. If you've moved off the grid or onto 
the source then you know that the path has ended. Otherwise check that you 
haven't used the current pipe and then mark it used unless it is a '+' (the 
only pipes you can use more than once are the '+' pipes). If the current 
pipe is a '+' then change it to a '-', since using one direction allows the 
other direction to be used (also note that you can never enter a pipe along 
the same direction since that would imply a cycle in the path, but there 
can't be a cycle since the source can never be entered). When the current 
pipe is '-' or '+' then the direction of the water doesn't change so the 
next pipe will be in that direction. If the current pipe is 'L' then the 
path will split; it can either change the direction to turn right or left. 
You can then add one to the current path length and recursively follow the 
path to the next pipe. Once the path has ended, retrace it backwards marking 
the pipes unused and following the other direction as you come back to each 
'L'.
</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=4708&amp;rd=8007" name="4708">Recipe</a></b>
</font>
<A href="Javascript:openProblemRating(4708)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      135 / 333 (40.54%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      82 / 135 (60.74%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 397.80 points (15 mins 14 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      270.79 (for 82 correct submissions)
    </td>
  </tr>
</table></blockquote>

<p>The first complication to this problem is that each ingredient is given 
with different units, so it becomes easier to solve if they are all 
converted into a standard unit, the teaspoon. This is quite similar to how 
in many of the problems with time in hours, minutes, and seconds it is 
almost always easier to just convert everything into seconds.</p>
<p> Now we can ask, given a recipe, what is the smallest amount that we can 
make and still keep them in proportion to each other. Let's name this 
smallest amount the <i>minimum serving</i>. Since the smallest measuring 
device we have is a teaspoon, the minimum serving will have to have an 
integral number of teaspoons of each ingredient. There is some number G>=1 
such that if we make G minimum servings then we get the same amount as the 
original recipe, but what is not so obvious is that G is an integer. If G is 
not an integer then let H be the smallest integer less than G. We can make 
the original recipe and then take out H minimum servings and have some 
amount that is a fraction of the minimum serving yet still has each 
ingredient in proportion. This contradicts the definition of minimal 
serving, so G must be an integer.</p>

<p>Since we can make G minimum servings to equal the original recipe, G must 
divide each ingredient. Conversely, if an integer d divides each ingredient 
in the original recipe then we can split each ingredient in the original 
recipe into d piles and make d batches of some serving amount with each 
ingredient still being used in the same proportion. Thus since G is a common 
divisor and each common divisor can make a serving of some size, the 
smallest serving will correspond to the largest common divisor. Therefore G 
is the greatest common divisor of all the ingredients. </p>
<p>Now that the hard part is done, the next task is to determine how much to 
make. We must make some multiple of the minimum serving, and further we must 
make at least G minimum servings. Now we can loop through each ingredient in 
the bowl and determine the smallest number of minimum servings needed to 
fully use that ingredient by division rounding up; we must make a number of 
minimum servings equal to the maximum of these numbers.</p>
<p>After knowing how much to make, it is a simple manner to loop through 
each ingredient and determine how much more to add to the bowl. Convert this 
into the most cups possible, then the most tablespoons, and keep the rest in 
teaspoons.</p>

<font size="+2">
<b><a href="/stat?c=problem_statement&amp;pm=1981&amp;rd=8007" name="1981">PokerDeck</a></b>
</font>
<A href="Javascript:openProblemRating(1981)"><img hspace="10" border="0" height="18" width="60" src="/i/rate_it.gif"/></A><br>
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
      7 / 333 (2.10%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Success Rate</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      1 / 7 (14.29%)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>High Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      <b>misof</b> for 451.71 points (45 mins 5 secs)
    </td>
  </tr>
  <tr>
    <td class="bodyText" style="background: #eee;">
      <b>Average Score</b>
    </td>
    <td class="bodyText" style="background: #eee;">
      451.71 (for 1 correct submission)
    </td>
  </tr>
</table></blockquote>

<p> One of the things that makes a good poker player is being very familiar 
with the odds of making certain hands. Changing up the composition of cards 
or rules of the game (Such as having a full house less than a flush) can 
upset their game and even the playing field.</p>
<p> Overall, this is a combinatorial problem. Instead of calculating the 
probability of each type of hand, we can count the number of hands which are 
that type. Once we know the counts, we can sort based on the count and break 
ties by the name of the type.</p>
<p> Calculating the counts is not an easy task, and it can be simplified by 
how the data is represented. One way is to keep a few arrays:</p>
<pre>

int ranks[13];         <font color=blue>// ranks[i] = number of cards in the 
deck of rank i</font>
int suits[4];          <font color=blue>// suits[i] = number of cards in the 
deck of suit i</font>
int suit_ranks[4][13]; <font color=blue>// suit_ranks[i][j] = number of 
cards in the deck of suit i and rank j</font>
</pre>
<p> By reading the input, these arrays can be filled. During the calculating 
we will also need to calculate some binomial coefficients. choose(n,k) is 
the number of ways of selecting k items from a collection of n items. This 
can be calculated as n!/(k!(n-k)!). Note that if k &gt; n then choose(n,k) = 
0.</p>
<p>Finally, the counts for each type of hand can be found as follows:</p>

<dl>
  <dt>FIVE OF A KIND</dt>
  <dd>Sum for each rank choose(rank[i],5)</dd>
  <dt>ROYAL FLUSH</dt>
  <dd>Sum for each suit, s, of the product of suit_ranks[s][i] with i from 
10 to A</dd>
  <dt>STRAIGHT FLUSH</dt>
  <dd>Sum for each suit, s, of the number of straights flushes for that 
suit. Loop over the starting rank and take the product of the 5 ranks that 
make up the straight. </dd>

  <dt>STRAIGHT</dt>
  <dd>Similar to counting the number of straight flushes but use ranks[i] 
instead of suit_ranks[s][i] and also include straights starting with 10. 
Subtract the number of royal and straight flushes.</dd>
  <dt>FLUSH</dt>
  <dd>Sum for each suit, s, of choose(suits[s],5). Subtract the number of 
royal and straight flushes.</dd>
</dl>

  <p> The idea from here is to count each type of hand once using ranks[i] 
and then to subtract all of that type hand which would be flushes by using 
suit_ranks[s][i].</p>

<dl>
  <dt>FULL HOUSE</dt>
  <dd>Sum for each pair of ranks, i and j, of 
choose(ranks[i],3)*choose(ranks[j],2). Subtract for each suit, s, 
choose(suit_ranks[s][i],3)*choose(suit_ranks[s][j],2).</dd>
  <dt>FOUR OF A KIND</dt>
  <dd>Sum for each pair of ranks, i and j, of 
choose(ranks[i],4)*choose(ranks[j],1). Subtract for each suit, s, 
choose(suit_ranks[s][i],4)*choose(suit_ranks[s][j],1).</dd>
  <dt>THREE OF A KIND</dt>

  <dd>Sum for each pair of ranks, i and j, of 
choose(ranks[i],3)*choose(deck_size-ranks[j],2). Subtract for each suit, s, 
choose(suit_ranks[s][i],3)*choose(suits[s]-suit_ranks[s][j],2). Subtract the 
number of full houses.</dd>
  <dt>TWO PAIR</dt>
  <dd>Sum for each pair of ranks, i and j, of 
choose(ranks[i],2)*choose(ranks[j],2)*(deck_size-ranks[i]-ranks[j]). 
Subtract for each suit, s, 
choose(suit_ranks[s][i],2)*choose(suit_ranks[s][j],2)*(suits[s]-suit_ranks[s][i]-suit_ranks[s][j]).</dd>
  <dt>ONE PAIR</dt>
  <dd>Sum for each quadruple of ranks, i, x, y, and z with x &lt; y &lt; z, 
of choose(ranks[i],2)*ranks[x]*ranks[y]*ranks[z]. Subtract for each suit, s, 
choose(suit_ranks[s][i],2)*suit_ranks[s][x]*suit_ranks[s][y]*suit_ranks[s][z].</dd>

  <dt>NOTHING</dt>
  <dd>choose(deck_size,5) - the counts of all other types of hands.</dd>
</dl>


<p>
<img src="/i/m/Ryan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="284007" context="algorithm"/><br />
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
