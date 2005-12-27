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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505507" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 89</span><br>May 18, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>SRM89 was a Saturday afternoon contest, starting at 1pm.  The
unusually early start time saw a couple of people griping in the
lobby.  The entry of 500 coders (low compared to many recent
contests) may have been related to this.  In division 2, this resulted
in 33 room, of which 5 were rookies.</P>

<P>The problem slate was challenging enough to be interesting, but
doable.  For instance, in all rooms except one room of the rooky
section, someone got the level 3 problem.  Challenge phase appears
to have been pretty quiet.</P>

<P>200 (Average):<BR/><BR/>
Given 2 int arrays, count the number combined socre (score[i] = a[i] + b[i])
which are below average.</P>

<P>Some care is needed to ensure that scores equalling the average don't get returned.
Most submission for this problem were successful.</P>

<P>The easiest test for below average is:<BR/>if (total&#91;i&#93; &#42; length &#60; totalSum)</P>

<P>Problems:<BR/><BR/>
1.  Using integer division, which rounds down the average number.<BR/>
2.  Some solutions appear to fail because of lack of precision in floating
    point maths.<BR/>
3.  Counting entries which are above average instead of below.<BR/>
4.  Testing whether individual scores were less than average.<BR/>
5.  Returning the average.<BR/>
6.  Calculating the average based on math.length-1</P>

<P>I'd be surprised if some of the failing solutions could have been tested much.
I know it's often hard while others are submitting</P>

<P><B>500 (Powerful):</B><BR/><BR/>
This problem also saw service as the div1 200.  The goal of the problem was check whether the input, 
an integer (1 &#60;= n &#60;= 2,000,000,000), was an exact power, and return either an error message or an 
expression of the number as the highest possible power (ie 81=3^4 and not 9^2). Subtleties included 
the fact that 1 was not considered to be a power.</P>

<P>A simple brute force search is possible. Sqrt(2,000,000,000) is roughly 
45,000.  Since 2 billion is close to 2^31, the time complexity on linear
brute force (worst case) is way less than 1.4 million iterations.</P>

<P>At first sight, it looks like a floating point problem.  I'd actually
recommend avoiding floating point math like the plague.  Something like the
following is much more likely to work:</P>
<pre>

maxBase = maxPow = 0
// Quite important for the loop to allow square roots.
for (int base = 2; base &#60; Math.sqrt(number+1); base++) {
   int result = 1;
   for (int pow = 2; pow &#60; 32; pow++) {
      result &#42;= base;
   }
   if (pow &#62; maxPow) {
      maxPow = pow;
      maxBase = base;
   }
}
if (maxPow &#62; 0) {
   return ""+maxBase+"^"+maxPow;
} else {
   return "NOT A PERFECT POWER";
}
</pre>

<P>It is interesting that many solutions to this problem failed, but relatively 
few successful challenges were made.  In particular, the first 2 test cases,
2,000,000,000 and 1,000,000,000, seem to have tripped up many coders.</P>

<P>Problem:<BR/><BR/>

1.  Uncaught C++ exceptions felled some people (I don't understand C++ sufficiently
    to find the cause.<BR/>
2.  Failing to return the highest power.<BR/>
3.  One solution checked whether the current power was even, and returned false
    if this was the case.<BR/>
4.  Incorrect looping bounds.  Some solutions looped to j &#60; Math.sqrt(number).
    Others looped to "klimit = sqrt(number) / 1000"<BR/>
5.  Misreading the problem: one coder returned "2^1" on input of 2.<BR/>
6.  Over-complicating the algorithm.  Some coders tried to do a binary search,
    and left fence-post errors.</P>

<P>The pass rate for this problem was low, and the errors quite diverse, so I've probably
not covered quite a few problems, I'm afraid.</P>

<P><B>900 (Filter):</B><BR/>
Given a field of '1's and '0's, remove all '1's which do not form a cross pattern,
then count the number removed.</P>

<P>This problem was straightforward (there were probably more correct solutions than
for the 600.  Two basic approaches seem to have been used: one was to check all possible
crosses containing the current element.  The other was to check each possible cross, and
store the result of the check, then compare the input to the data.</P>

<P>Problems:<BR/><BR/>
1.  One technique used was to check around a particular element:<BR/>
<pre>
boolean inCross(int x, int y, char&#91;&#93;&#91;&#93; data) {
   if (centre(x+!, y, data)) return true;
   if (centre(x-1!, y, data)) return true;
   if (centre(x, y+1, data)) return true;
   if (centre(x, y+1, data)) return true;
   if (centre(x, y, data)) return true;
   return false;
}

boolean centre(int x, int y, char&#91;&#93; data) {
   if (x&#62;=0 || y>=0 || x&#60;=maxX || yx&#60;=maxY) return false;
   if (data&#91;x-1&#93;&#91;y&#93; != '1') return false;
   if (data&#91;x+1&#93;&#91;y&#93; != '1') return false;
   if (data&#91;x&#93;&#91;y-1&#93; != '1') return false;
   if (data&#91;x&#93;&#91;y+1&#93; != '1') return false;
   // Note: no check on the centre
   return true;
}
</pre></P>
<P>This would fail on:<BR/><BR/>
<pre>
111
101
111
</pre>
2.  Exceeding time limits.<BR/>
3.  ArrayIndexOutOfBoundsException thrown.<BR/>
4.  Overwriting intermediate results.  Some solutions kept arrays of previously 
    calculated results.  They didn't check the contents and lost data, ending 
    with the wrong answer.</P>

<P>Finally, a response to Pochmann's comment on my column on SRM88:
I was referring to a problem solution technique as "flood and fill", which I hadn't
found in textbooks.  He correctly pointed out that the search technique used is
depth first search, which is _every_ textbook, pretty much.</P>

<P>My comment was based on the idiom used.  I've seen the same type of problem a couple
of times in room 1.  Looking over some of the solutions, spotting the differences can
be like spotting differences between two peoples' "for" loops.  The level 3 problem in
SRM88 was generally attacked by rather adhoc and difficult-to-read code, and privately,
a couple of people have asked that I cover algorithms in a little more depth.</P>

<P>But pochmann is right :)</P>

<p>
<img src="/i/m/slowjoe_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="271917" context="algorithm"/><br />
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
