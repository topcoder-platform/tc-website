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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505518" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 101</span><br>June 26, 2002
<br/><br/>

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>
Srm 101 was the last paying Single Round Match, and as such, marked
the end of an era.  In the real world, it was in the day of the
WorldCom accounting scandal, and that Brazil won through to the Soccer
World Cup final.  The turnout of 594 was respectable.  I had anticipated
a record turnout for the last paying match, but was clearly wrong.
Another interesting stat is that there were only 21 debut coders.
</P>

<P>
The problem slate, in my opinion, was one of the easier slates we've
seen.  The level 3 problem was a calculation problem, the level 2 was
required a powerset enumeration, but was small enough to be hard
coded, and the level one required the ability of looping downwards
rather than upwards.
</P>

<P>
On challenge phase, performance was patchy.  Of failing problems,
25%, 26% and 41% were taken out in challenge phase.  As seems to be
the pattern, the grey coders took out the highest percentage of 
failing problems in challenge phase.
</P>

<P>
<B>225 (AutoMorphic):</B>
</P>

<P>
Take an integer, calculate its square, count the number of digit in
the input which are not part of the longest suffix of the input which
is also a suffix of the square.
</P>

<P>
This is a straightforward problem, solvable in a few lines of code.
Two approaches are obvious: 
<OL>
   <LI> Compare characters or digits starting with the least significant/
    end of String.</LI>
   <LI> Convert to Strings, and check for substrings.</LI>
</OL>
</P>


<P>
Problems:
<OL>
   <LI> Working with prefixes instead of suffixes.</LI>
   <LI> Counting common digits after the first difference has occurred.</LI>
   <LI> Counting common digits instead of different digits.</LI>
</OL>
</P>


<P>
<B>475 (SRM):</B>
</P>

<P>
A prescient coder knows in advance how long and how many points they'll
get for each problem.  Return the highest total which can be attained
within 75 minutes.
</P>

<P>
This problem is best tackled as an exhaustive search problem.  C++ coders
who know std_algorithm.h have a definite advantage here.
</P>

<P>
I have library code:
<pre>
   boolean makePerm(boolean[] bs) {
      int i,j,len = bs.length;
      for (i = 0; i &lt; len &amp;&amp; bs[i];i++);
      if (i == len) return false;
      for (j = 0; j &lt; i; j++) {
         bs[j] = false;
      }
      bs[i] = true;
      return true;
   }
</pre>
</P>

<P>
It's horribly inefficient (O^n in an inner loop: you can enumerate far
better by bitmasking an int between 0 and 2^n-1, but I've never had a
problem with timing.  It's used as follows:
</P>

<P>
<pre>
boolean[] bs = new boolean[3];
while (makePerm(bs)) {
   current = count(bs, problemScores, times);
   best = (best &gt;= current) ? best : current;
}
return best;
</pre>
</P>

<P>
Of course, this is overkill: it is perfectly possible to simply check 
each of the eight cases individually.
</P>

<P>
Problems:
<OL>
   <LI> Checking cases individually, but not checking all of them.</LI>
   <LI> Overly complex code.</LI>
   <LI> Fencepost errors when the total time taken is exactly 75 minutes.</LI>
</OL>
</P>


<P>
<B>1000 (Speeding):</B>
</P>

<P>
For each driving offence, penalty points are added to a driver's
licence.  For each complete year of being offence-free, 3 points
are removed.  Given a list of offence dates and penalty values,
calculate the number of points on a driver's licence at a particular
date.
</P>

<P>
This problem seems simple to me.  My approach to this was to count
days since 12/31/1900, and compare based on this.  The only challenge
of the problem is to test effectively.
</P>

<P>
Problems:
<OL>
   <LI> ArrayIndexOutOfBoundsExceptions on empty input.</LI>
   <LI> Not dealing with offences exactly a year apart correctly.</LI>
   <LI> My initial solution assumed European "dd/mm/yy" style dates.</LI>
</OL>
</P>

<!-- <P>
At the time of this writing, it was not known to ZorbaTHut that jello (the
rookie winner) was disqualified from the match and future competitions for
cheating. Jello's results will not be found in the match results.
</P> -->

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
