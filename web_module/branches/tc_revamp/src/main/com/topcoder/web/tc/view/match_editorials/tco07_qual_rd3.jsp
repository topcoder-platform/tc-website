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
<!-- Left Column Begins-->
<td width="180" id="onLeft">
   <jsp:include page="/includes/global_left.jsp">
      <jsp:param name="node" value="algo_match_editorials"/>
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

<div class="linkBox">
    <A href="/tc?module=Static&d1=match_editorials&d2=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/stat?c=round_overview&er=5&rd=10735">Match Overview</A><br>
    <tc-webtag:forumLink forumID="514899" message="Discuss this match" />
</div>
<span class="bodySubtitle">2007 TopCoder Open <br> Qualification Round 3 </span><br>Tuesday, April 3, 2007
<br><br>


<h2>Match summary</h2> 

A total of 831 coders waited until the third and final qualification round for the 2007 TopCoder Open.
Of these, only 488 scored greater than zero points, so all of those will advance to the next round.
Several coders solved all 3 problems, with TopCoder member 
<tc-webtag:handle coderId="10256411" context="algorithm"/> finishing on top
thanks to two successful challenges.
Coders <tc-webtag:handle coderId="310431" context="algorithm"/> and <tc-webtag:handle coderId="261043" context="algorithm"/> were close behind,
and 
<tc-webtag:handle coderId="16121827" context="algorithm"/>, <tc-webtag:handle coderId="15760106" context="algorithm"/> and 
<tc-webtag:handle coderId="15511417" context="algorithm"/>
also finished with impressive scores. 
<br /><br />

<H1> 
The Problems 
</H1>
 

<font size="+2"> 
<b><a href="/stat?c=problem_statement&amp;pm=7642&amp;rd=10735" name="7642">PacketRepack</a></b> 
</font> 
<A href="Javascript:openProblemRating(7642)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 
<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>
<br> 
Used as: Division One - Level One: <blockquote><table cellspacing="2"> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Value</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      300 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Submission Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      532 / 783 (67.94%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Success Rate</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      470 / 532 (88.35%) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>High Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      <b>m00tz</b> for 288.85 points (5 mins 37 secs) 
    </td> 
  </tr> 
  <tr> 
    <td class="bodyText" style="background: #eee;"> 
      <b>Average Score</b> 
    </td> 
    <td class="bodyText" style="background: #eee;"> 
      171.27 (for 470 correct submissions) 
    </td> 
  </tr> 
</table></blockquote> 

This problem may have taken some time to read and understand, but implementing the solution turned
out to be quite simple.
All this problem asks is for you to move some bits around, which is something that any
programmer should be comfortable with.
<br /><br />

Many coders chose to proceed directly as the problem statement described.
First, they contatenated the input words into a string of 0's and 1's.
Then, they extracted each of the fields.
Next, they reversed their order and put them back into a long string (remembering to include the
leading zeros).
Finally, they broke this string into words.
This solution certainly works, but it is more complex and time consuming to code than necessary.
<br /><br />

A simpler approach is to consider each bit of the input, and copy it to the correct location in the output.
<tc-webtag:handle coderId="7311097" context="algorithm"/> used this approach:

<pre>
        int[] res = new int[input.length];
        for (int f=num_fields; f-->0; ) {
            for (int b=field_size; b-->0; ) {
                int ip = f*field_size + b;
                int op = (num_fields-1-f)*field_size + b;
                int bit = (input[ip / ws] >> (ip%ws)) & 1;
                res[op / ws] ^= bit &lt;&lt; (op%ws);
            }
        }
        return res;
</pre>

In this code, "ip" is the position of the current bit in the input,
"op" is the corresponding position of this bit in the output,
and "bit" is the value of the bit.
<br /><br />
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=6641&amp;rd=10735" name="6641">MemorizingPi</a></b> 

</font> 

<A href="Javascript:openProblemRating(6641)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      134 / 783 (17.11%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      60 / 134 (44.78%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>NauCoder</b> for 353.11 points (20 mins 10 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      262.09 (for 60 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


This problem consisted of three parts:
evaluating the complexity of a group of 3 or 4 digits,
finding the optimal segmentation,
and formatting the output.
The first part is a simple task of just implementing the rules in the problem statement,
altough there are 7 rules, so speed and confidence were a bit of a help here.
<br /><br />

Finding the optimal segmentation is most easily done with dynamic programming.
Starting at 3, find the optimal segmentation and complexity for the last N characters of the input.
The solution for N is either the next group of 3 digits (followed by the solution for N-3)
or the next group of 4 digits (followed by the solution for N-4).
<br /><br />
There are a few special cases that you must handle correctly to get started.
N=3 and N=4 are the base cases.
N=5 is undefined, because there is no way to segment a string of 5 digits into groups of 3 or 4.
For N=6, N=8, and N=9 the string can only be broken up in one way.
<br /><br />
 

<font size="+2"> 

<b><a href="/stat?c=problem_statement&amp;pm=7636&amp;rd=10735" name="7636">BalancingGame</a></b> 

</font> 

<A href="Javascript:openProblemRating(7636)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A> 

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514899" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      36 / 783 (4.60%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Success Rate</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      14 / 36 (38.89%) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>High Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      <b>cz.vx.bc</b> for 817.66 points (14 mins 5 secs) 

    </td> 

  </tr> 

  <tr> 

    <td class="bodyText" style="background: #eee;"> 

      <b>Average Score</b> 

    </td> 

    <td class="bodyText" style="background: #eee;"> 

      606.41 (for 14 correct submissions) 

    </td> 

  </tr> 

</table></blockquote> 


This is a simple game theory problem.
Note that with only 20 objects, there are only s<sup>2</sup> possible board configurations.
With the use of dynamic programming or memoization, you only need to analyze each configuration
once.
<br /><br />

Define each configuration as "winning" or "losing" if the next player to move can force
a win, or if he will lose regardless of what move he makes next.
First, compute the magnitude of the torque as described in the problem statement.
If the board does not balance, then the previous player must have caused the board to fall,
and this is therefore a "winning" position for the next player.
If the board does balance, then you consider all possible moves the current player could make.
If all possible moves leave the board in a winning position, then this is a losing position for
the current player.
However, if one or more moves leaves the board in a losing position, then this is a winning position
for the current player.
<br /><br />

One tricky rule is that if all objects are removed from the board, then the <i>first</i> player
loses.
This means that the final position is "winning" if there are initially an odd number of objects,
and "losing" otherwise.
<br /><br />




<div class="authorPhoto">
    <img src="/i/m/legakis_big.jpg" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="287269" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
            <jsp:include page="/public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<!-- Right Column Ends -->

<!-- Gutter -->
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>
