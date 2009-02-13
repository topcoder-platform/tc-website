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
<tc-webtag:forumLink forumID="505535" message="Discuss this match" /></div>
<span class="bodySubtitle">SRM 116</span><br>Tuesday, October 15, 2002
<br><br>

<H1> 
The Problems 
</H1> 

<font size="+2"><b>BinaryPad</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505535" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division-II, Level 1:
    <blockquote><table cellspacing="2"><tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">300 points</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">210 / 223 (94.17%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">198 / 210 (94.29%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td><td class="bodyText" style="background: #eee;">246.07 points
        </td></tr><tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>CowGame</b> for 292.27 points
                </td></tr></table></blockquote><P>
Nothing too tricky in this problem.  The most straightforward way to solve this was to look at each pair of two adjacent characters and figuring out if the second character was clockwise or counter-clockwise from the first.  It was easy enough to just use a bunch of if statements, since there were only 6 cases.  A little bit of modular arithmetic and could save some typing, but probably wasn't worth the trouble.
</P>

<p>&#160;</p>

<font size="+2"><b>BossFight</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505535" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division II - Level 2 &amp; Division I - Level 1:
    <blockquote><table cellspacing="2"><tr><td colspan="2" class="bodyText" style="background: #eee;"><b>Div-II stats</b></td></tr><tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">500 points</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">159 / 223 (69.96%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">111 / 159 (69.81%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td><td class="bodyText" style="background: #eee;">300.22 points
                </td></tr><tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>grepjava</b> for 481.65  points
                </td></tr></table><BR/><table cellspacing="2"><tr><td colspan="2" class="bodyText" style="background: #eee;"><b>Div-I stats</b></td></tr><tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">250 points</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">136 / 136 (100.00%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">119 / 136 (87.50%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td><td class="bodyText" style="background: #eee;">199.93 points
                </td></tr><tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>venco</b> for 242.55   points
                </td></tr></table></blockquote><P>
For each encounter with the boss, there are two numbers which are interesting.  The obvious one is the sum of all attacks for the encounter.  We know that this number is enough to defeat the boss, so the minimum of this number over all encounters is the second element of the return.  For example, if one encounter totaled 10 damage, and another encounter totaled 8 damage, we know that 8 damage is enough to defeat the boss.  The second number of interest is the sum of all of the attacks except the last.  We know that each time, this sum was not enough to defeat the boss, and thus the boss has at least this sum plus one health.  So, the first element must be the maximum of the sum of all numbers but the last, plus one.  The only other thing to do is map the names of the attacks to the amount of damage they do.  Java's HashMap, or it equivalent does this pretty easily.

  </P><font size="+2"><b>LongDistance</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505535" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />
    Used as: Division II - Level 3:
    <blockquote><table cellspacing="2"><tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1100 points</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">49 / 223 (21.97%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">3 / 49 (6.12%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td><td class="bodyText" style="background: #eee;">531.17 points
        </td></tr><tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>smai</b> for 536.88 points
                </td></tr></table></blockquote>
                <p>
This problem can be decomposed into two parts.  The first is finding which phone companies will given the minimum rate for each call.  The second is to determine the fewest number of phone companies that can be used to get all of the calls at the minimum rate.  For the first part we have to be able to evaluate the lowest rate that we can get for a given call, with some phone company.  There are only a few cases for this, which can be handled without too much trouble.  The first is when the per minute rate is cheaper for the extra minutes, than it is for the initial minutes.  In this case, there is no reason to call back.  In the other case, when it is cheaper per minute for the initial minutes, it makes sense to call back whenever there are more minutes left to talk then the initial minutes of that company.  For this second case, there may be a few extra minutes left over at the end, and it must be determined if those few extra minutes would be cheaper at the per minute rate, or the initial rate.  Once you figure out which companies will give you the cheapest rate on each call, you remember those companies and go on the second part of the problem.
</p><p>
In the second part, you have to figure out the fewest number of times you can switch phone companies, which is the same as the fewest companies that you can use.  The simplest way to do this is to set up a bit mask for each call, which represents which companies give you the lowest rate for each call.  So, you have an int[], whose elements correspond to the calls, and the bits of the elements correspond to the companies that will give you the lowest rate.  Then you iterate though all possible combinations of companies, and check the bit mask for each call.
</p><p><pre>
int[] callBitMasks;
for(int i = 0; i&lt;(1&lt;&lt;(numberOfCompanies)); i++){
   boolean acceptable = true;
   for(int j = 0; j&lt;callBitMasks.length; j++){
      acceptable = acceptable &amp;&amp; (i&amp;callBitMasks[j])&gt;0;
   }
   if(acceptable)ret = min(ret,cardinality(i));
}
</pre>
</p>

<font size="+2"><b>PriceIsRight</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505535" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division I - Level 2:
    <blockquote><table cellspacing="2"><tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">600 points</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">52 / 136 (38.24%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">9 / 52 (17.31%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td><td class="bodyText" style="background: #eee;">310.40 points
        </td></tr><tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>SnapDragon</b> for 403.30 points
                </td></tr></table></blockquote><p>

This problem looks very difficult at first, but turns out to have a very simple, greedy solution.  Everyone want to bid as low as they can, but no one wants to bid so low that someone else will be willing to bid more than them, but less than they value the item at.  The key two sentences in the problem statement are:
"Let V be equal to the amount that he or she believes the item to be worth. The contestant should bid an amount, B, as low as possible (definitely less than or equal to V) such that no other contestant will bid an amount between B and V, inclusive."
To solve this, lets start by looking at the two highest values, call them v<sub>1</sub> and v<sub>2</sub>, with v<sub>2</sub>>v<sub>1</sub>, and let b<sub>i</sub> be what the person valuing the item at v<sub>i</sub> bids for the item.  If the b<sub>2</sub> bid comes after b<sub>1</sub>, then b<sub>1</sub> should equal v<sub>1</sub>, and b<sub>2</sub> should be v<sub>1</sub>+1.  If b<sub>1</sub> were anything less than v<sub>1</sub> (b<sub>1</sub> can't be greater than v<sub>1</sub>), then the person bidding b<sub>2</sub> could bid b<sub>1</sub>+1, which would be between b<sub>1</sub> and v<sub>1</sub>, which is undesirable by the rules.  Now, given the bid of b<sub>1</sub>, b<sub>2</sub> should clearly be b<sub>1</sub>+1, as that is the minimum bid that is greater than b<sub>1</sub> and less than v<sub>2</sub>.  So, if values were {50,100}, the return would be {50,51}.  If the order were reversed, and the b<sub>2</sub> bid came first, then b<sub>2</sub> would be v<sub>1</sub>, as anything less would allow b<sub>1</sub> to be between b<sub>2</sub> and v<sub>2</sub>.  This leaves the b<sub>1</sub> bidder with no possible bids, and thus he has to bid -1.  So if values were {100,50} the return would be {50,-1}.
</p><p>
Once you understand the behavior of the top two people, you can then inductively determine the behavior of the next two.  Since the top two people both bid at least the minimum of the top two values, the next two people don't have to worry about them, as they will value the item lower than either of the two bids are for.  If there are an odd number of people, then the person who values the item the lowest doesn't have to worry about anyone else, and can just bid 1.
</p><p>
So, the key to solving this problem is to observe that the bids of the two people who value the item the highest will not effect the bids of anyone else, and then use this observation inductively.
</p>

<font size="+2"><b>RobotSquirrel</b></font>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505535" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

    Used as: Division I - Level 3:
    <blockquote><table cellspacing="2"><tr><td class="bodyText" style="background: #eee;"><b>Value</b></td><td class="bodyText" style="background: #eee;">1100 points</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Submission Rate</b></td><td class="bodyText" style="background: #eee;">9 / 136 (6.62%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Success Rate</b></td><td class="bodyText" style="background: #eee;">4 / 9 (44.44%) 
</td></tr><tr><td class="bodyText" style="background: #eee;"><b>Average Score</b></td><td class="bodyText" style="background: #eee;">561.60 points
        </td></tr><tr><td class="bodyText" style="background: #eee;"><b>High Score</b></td><td class="bodyText" style="background: #eee;"><b>John Dethridge</b> for 706.68 points
                </td></tr></table></blockquote><p>

This problem turned out two be a case of optimized brute force.  If you tried to enumerate all of the possible programs, you ended up with somewhere around 729,000,000 possible programs.  However, a lot of those programs do the same thing as a lot of other programs, and the trick is to try to reduce the number of programs looked at when generating them.  Here are a few optimizations that I came up with, and I imagine there are some more.
</p><p>
<ol>
<li>Never use instruction 5 anywhere but the end of sub or main.  This is done easily be generating main and sub with any length from 1 to 6.
direction, and there is no point in being able to turn around to both the left and the right.
</li><li>Only try to pick up after a move, a call to sub, or at the beginning of sub or main.
</li><li>Only turn (possibly a U-Turn) after a move, a call to sub, or at the beginning of sub or main.
</li></ol>
</p><p>
Just these three optimizations reduce the search space to less than half a million possible programs, which is quite manageable.
</p><p>
After you generate sub and main, you essentially run the program, and collect the nuts.  You have to watch out that you don't collect the same nuts more than once, but it isn't too difficult.
</p>

<p>
<img src="/i/m/lbackstrom_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="159052" context="algorithm"/><br />
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
