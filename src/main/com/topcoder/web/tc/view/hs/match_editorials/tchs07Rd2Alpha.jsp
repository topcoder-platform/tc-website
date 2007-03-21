<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>


<body>

<div id="onTop">
<jsp:include page="../../top.jsp" >
  <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
 <tr valign="top">
<!-- Left Column Begins-->
   <td width="180" id="onLeft">
      <jsp:include page="../../includes/global_left.jsp">
         <jsp:param name="node" value="hs_match_editorials"/>
      </jsp:include>
   </td>
<!-- Left Column Ends -->

<!-- Center Column Begins -->
<td class="statTableSpacer" width="100%" valign="top">
<div class="bodyText">
<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="high_school"/>
<jsp:param name="title" value="Match Editorials"/>
</jsp:include>

<div class="linkBox">
    <A href="tc?module=Static&d1=hs&d2=match_editorials&d3=archive">Archive</A><br>
    <span id="printableLink"><A href="Javascript:makeInvisible();">Printable view</A><br></span>
    <span id="navigableLink" class="invisible"><A href="Javascript:makeNavigable();">Normal view</A><br></span>
    <A href="/tc?module=HSRoundOverview&rd=10716&snid=1&er=5">Match Overview</A><br>

<tc-webtag:forumLink forumID="514494" message="Discuss this match" /></div>
<span class="bodySubtitle">TCHS07 Round 2 Alpha</span><br>Thursday, March 8, 2007
<br><br>



<h2>Match summary</h2>

As in Round 1, it was clear that any positive score would be enough to advance to the next round.
Therefore, a lot of coders played it safe and made sure they submitted a correct solution to the 
easy.
Most of them managed to qualify for the next round, with <tc-webtag:handle coderId="22658932" context="hs_algorithm"/> being lucky enough to advance
only because of his challenge points.
<br /><br />

At the top of the table, <tc-webtag:handle coderId="14848761" context="hs_algorithm"/>
won the contest by a tiny margin over 
<tc-webtag:handle coderId="15117368" context="hs_algorithm"/>. <tc-webtag:handle coderId="22663763" context="hs_algorithm"/> came in third about 100 points behind. 
<br /><br />

<H1>

The Problems

</H1>

</p>

 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7546&amp;rd=10716" name="7546">CellularPhoneTarif</a></b>

</font>

<A href="Javascript:openProblemRating(7546)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

<br>

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

      45 / 45 (100.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      42 / 45 (93.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>tloinuy</b> for 249.32 points (1 mins 29 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      230.85 (for 42 correct submissions)

    </td>

  </tr>

</table></blockquote>

The main thing you needed to solve this problem was caution. 
To find the solution, you had to perform the following action:

<ul>
<li>Compute the number of minutes you'll be charged for.
The fact that you are charged 1 minute momentarily after the end of the previous minute means the number of minutes you are charged
is the number of complete minutes you've talked plus one.</li>
<li>Compute the amount you are charged, adding up the following numbers:
<ul>
<li>5 cents for starting a call.</li>
<li>10 cents per minute if you've talked less than 5 minutes, or 50 cents if you've talked more than 5 minutes.</li>
<li>If you've talked more than 5 minutes, add 3 cents for each such minute.</li>
</ul>
</li>
</ul>

By carefully implementing this you get the problem's solution. A short of it version can look like:

<pre>
public int calculatePrice(int seconds) {
    int mins = 1 + seconds  / 60;
    return 5 + 10 * Math.min(mins, 5) + Math.max(0, (mins - 5) * 3);
}
</pre>


 

<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7547&amp;rd=10716" name="7547">PulseDial</a></b>

</font>

<A href="Javascript:openProblemRating(7547)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      42 / 45 (93.33%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      31 / 42 (73.81%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>Penguincode</b> for 492.49 points (3 mins 31 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      430.73 (for 31 correct submissions)

    </td>

  </tr>

</table></blockquote>


A solution to this problem consists of two parts. First, we need to determine the digits of the number. Second, we need to 
format the number according to the requirements. If you have the number as a string of digits, the second part becomes trivial:

<pre>
if (ans.length() == 7)
    return ans.substring(0, 3) + "-" + ans.substring(3, 5) + "-" + ans.substring(5);
else 
    return "+" + ans;
</pre>

Now lets move to the first part of the problem.
Depending on the previous second, the phone can be in one of 2 possible states.
If we had a pause during the previous second, the phone is in pause mode and is waiting for new pulses.
Otherwise, the phone is "listening" and counting pulses. If we have a counter for consecutive pulses before this one, we increment it by one.
The following table shows how the phone changes its state. Rows represent the state we had after the previous second, 
columns represent the signal we get during the current second. Count is the number of previous consecutive '-'s.
<br /><br />

<table border="1">
<tr>
<td>State / Signal</td>
<td>Pause ('*')</td>
<td>Pulse ('-')</td>
</tr>
<tr>
<td>Pause (count = 0)</td>
<td>The phone is still in pause, do nothing.</td>
<td>The phone starts receiving a digit. Set count to 1.</td>
</tr><tr>
<td>Digit (count > 0)</td>
<td>Digit is completely received. Append it to the phone number.</td>
<td>The phone is still in process of receiving the digit. Increase count by 1.</td>
</tr>
</table>

<br />
The only problem with this scheme is that it doesn't deal with the last digit if the raw number doesn't end with a pause.
To avoid this bug, we just append a '*' to the end of the raw number representation.
Java implementation of the scheme follows:

<pre>
String number = "";
raw += '*';
int count = 0;
for (int i = 0; i < raw.length(); i++) {
    if (count == 0) {
        if (raw.charAt(i) == '-')
            count = 1;
    } else {
        if (raw.charAt(i) == '-')
            count++;
        else {
            count = 0;
            number += (count % 10); // Remember that 10 '-'s represent a '0'.
        }
        
    }
}
</pre>


<font size="+2">

<b><a href="/stat?c=problem_statement&amp;pm=7549&amp;rd=10716" name="7549">FireSimulation</a></b>

</font>

<A href="Javascript:openProblemRating(7549)"><img src="/i/rate_it.gif" hspace="10" border="0" alt="rate it" /></A>

<A HREF="http://forums.topcoder.com/?module=ThreadList&forumID=514494" CLASS="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A>

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

      32 / 45 (71.11%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Success Rate</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      24 / 32 (75.00%)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>High Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      <b>fhoward</b> for 952.60 points (6 mins 24 secs)

    </td>

  </tr>

  <tr>

    <td class="bodyText" style="background: #eee;">

      <b>Average Score</b>

    </td>

    <td class="bodyText" style="background: #eee;">

      771.93 (for 24 correct submissions)

    </td>

  </tr>

</table></blockquote>

This was a classical example of a simulation problem.
To simulate the process you need to store the states of the cells.
For each cell there are three possible states - it can be as clean as it was at the beginning, 
it can be on fire, or it can be completely burned.
At the moment when the cell becomes completely burned, it spreads the fire to all neighboring cells (unless they were on fire before).
So, we can represent the state of the cell in the following way:

<ul>
<li>0, if the cell never was on fire.</li>
<li>x, if the cell caught the fire x minutes ago.</li>
<li>-1, if the cell is completely burned.</li>
</ul>

At the moment 0, only (0, 0) cell has state equal to 1, and all other cells have state equal to 0.
Then, for <b>minute</b> times we must simulate the process, which happens at the end of the minute.
<br /><br />

This can be done in 2 steps. First, we increment by 1 the state of all cells which are already on fire.
Then, for each cell which is completely burned (i.e., has the state greater than the corresponding number in the input),
we spread the fire to all its neighbours (in other words, for all neighboring cells we set the state to 1 unless they were positive already).
Repeating this process <b>minute</b> times we get the state of the field after <b>minute</b> minutes.
<br /><br />

The only thing left now is to construct the final output. 
To do this, take the input array and go through it cell by cell. 
For each cell which has the state of -1, replace the corresponding character by '.'.
If a cell has a positive state, replace the character in the output by '*'.
<br /><br />



<div class="authorPhoto">
    <img src="/i/m/Olexiy_big2.jpg" alt="Author" />
</div>
<div class="authorText">
    By&#160;<tc-webtag:handle coderId="303644" context="algorithm"/><br />    <em>TopCoder Member</em>
</div>
</div>


</td>
<!-- Center Column Ends -->

<!-- Right Column Begins -->
   <td width="170" id="onRight">
  <jsp:include page="../../public_right.jsp">
   <jsp:param name="level1" value="tchs"/>
  </jsp:include>
   </td>
<!-- Right Column Ends -->

<!-- Gutter -->
   <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<!-- Gutter Ends -->
  </tr>
</table>

<div id="onBottom">
<jsp:include page="../../foot.jsp" />
</div>


</body>

</html>
