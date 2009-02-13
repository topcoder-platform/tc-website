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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505511" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm93_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 93</span><br>May 30, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>
SRM 93 was a Thursday night contest.  As a landmark, it was the night
before the 2002 Soccer World Cup kicked off.  There were 
653 coders for the match, with 392 coders and 42 rooms in Div-II.  
</P>

<P>
The problem slate appeared relatively simple, but each of the problems
tripped up at least 40% of submissions.  One thing that springs out is
that the problem slate was not as diverse as usual: the 250 and 500 both
required rounding calculations, and the 500 and 1050 both required looping
on r objects selected from a pool of n objects.
</P>

<P>
<B>250 (Median):</B>
</P>

<P>
This problem was to return the middle value(s) of an array of ints.
In the case of even length, return the mean of the two middle-most
values.  All rounding should be upward.
</P>

<P>
This problem appears to have been approached as a speed-typing test.
Unfortunately, the result was a car-wreck.  Of the submitted solutions,
less than 50% passed systest.  This was consistent in all three groupings
(greens, greys and rookies.)  
</P>

<P>
The solution to this problem is extremely simple: 
Sort the array, then either return the mid value if length is odd, 
or take the two inner values and combine them.  The following should 
work.
</P>


<pre>
Arrays.sort(input);
if (input.length % 2 ==1) {
   return input[input.length/2];
} else {
   int sum = input[input.length/2] + input[input.length -1];
   int av = sum/2;
   if (2*av &lt; sum) return av+1;
   return av;
}
</pre>

<P>
Problems:
<OL>
   <LI> Failing to sort the array.  Such a solution would not have passed 
       two of the examples.</LI>
   <LI> Failing to deal with negative numbers correctly.  Problem is that
        -(2n + 1)/2 = -n so any solution that relied on adding 1 failed.
        This problem appears to have been the main cause of failure.</LI>
   <LI> Incorrect calculation of the mean (by using the input[n/2] and 
        input[n/2+1] instead of input[n/2-1].</LI>
   <LI> Having two variables with similar names, and working with one in
        one loop branch, and another in a second.</LI>
   <LI> Not rounding at all.</LI>
</OL>
</P>

<P>
What I find fascinating about this problem was that only 25% of problems
which failed were actually successfully challenged.  Since most solutions
required less than 15 lines of code....
</P>

<P>
<B>500 (Hiring):</B> 
</P>

<P>
Given an array containing the exam results and salary requirements of
prospective employees, along with a salary cap, calculate the best 3
candidates whose total salaries do not exceed the cap.  Because the
average is taken of three values, rounding is to the nearest integer.
</P>

<P>
This problem is best tackled as an exhaustive search, using fixed
loops.  Notable was the fact that the pass rate varied from 58% among
the greens to 47% in the grey rooms.
</P>

<P>
Problems:
<OL>
   <LI> Not making any attempt to generate the possible solutions.</LI>
   <LI> Not checking that you aren't using the same entry/employee
        more than once</LI>
   <LI> Not rounding correctly.</LI>
   <LI> Concentrating on rounding the average, then actually returning
        the sum.</LI>
   <LI> Looping over the possible solutions correctly, but then returning
        then first one found.</LI>
</OL>
</P>

<P>
<B>1050 (Big2):</B>
</P>

<P>
This was a simulation problem based on the card game poker.
Given 13 cards, count the number of poker hands which can be made
with these cards, which contain a straight or better.
</P>

<P>
The solution requires the generation of the hands, and then their
analysis.  For hand generation, fixed loops is the easiest way to
go.  The key to the problem, of course is the hand evaluator.
</P>

<P>
The number of submissions for this problem was tiny: only 15% of 
the Div-II coders submitted.  As with most simulation problems, the
complexity of the solution was the main problem.
</P>

<P>
Problems:
<OL>
   <LI> Failing to deal with the fact that (for straights), and Ace is
        both high and low.</LI>
   <LI> Typos in lookup tables.</LI>
   <LI> Not looping over possible hands correctly.</LI>
</OL>
</P>


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

