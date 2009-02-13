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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505509" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 91</span><br>May 22, 2002
<br /><br />

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>
SRM 91 was a wednesday night contest.  As a landmark, it was the 
first contest sponsored by Citrix.  In all, 654 coders took part.
There were 43 rooms in Division-II, of which 4 rooms were in the 
rookie section.
</P>

<P>
The first two problems appear to have been quite easy: both had
solution rates above 70%.  In contrast, the level 3 problem caused a
lot of problems: the solution rate was 31.9%, and approximately 14% of
the coders solved it successfully.
</P>

<P>
<B>250 (Perfect):</B>
</P>

<P>
Take an integer, sum its divisors (not including the number, and check
whether the result is equal to, less than, or greater than the initial
number.
</P>

<P>
The solution is quite simple.  Code based on the following should be
quite sufficient:
</P>

<P>
<pre>
sum = 1;
for (i=2; i&#60;sqrt(n+1); i++) {
    if (n % i == 0) {
   sum+= i;
   if (i &#60; n/i) {
       sum+= n/i;
        }
    }
}
</pre>
</P>

<P>
Problems:
<OL>
   <LI>Only checking up to sqrt(n), without adding the second of a pair of 
   divisors.</LI>    
   <LI>Using (sum &#60; n) as a loop guard.</LI>
   <LI>Including sqrt of n twice when counting factors.</LI>
</OL>
</P>


<P>
<B>500 (ChallengePhase):</B>
</P>

<P>
In challenge phase of an SRM, a problem is submitted which uses a
random number generator.  The result is that it is likely to be
correct 50% of the time.  Given the scores within the room, the prize
for the first three places, and the assumption that all submissions
are correct, return the difference between the gain from a successful
challenge (ie ev(success) - ev(current) and the loss from an unsuccessful
challenge.
</P>

<P>
Problems:
<OL>
   <LI>Assuming that the scores table was sorted.  (All the examples were
   sorted)</LI>    
   <LI>In a solution which created three ArrayLists to contain the scores
in each case, adding the "success" score, to the "fail" List.</LI>
   <LI>Divide by zero exception.</LI>
   <LI>Errors in indexing into the array.  This cropped up in a solution
which counted how many results were less than a particular score. Had the coder counted the number greater, it is likely the error 
would not have occurred.</LI>
</OL>
</P>


<P>
<B>1000 (Rumba):</B>
</P>

<P>
The task is to simulate a Rumba dance, and check that each of 5 steps
are included.  There are 3 different positions allowed, and some steps
are not allowed to begin from some positions.  Each step ends in a
particular position.  The return is an int array, the first element of
which is the number of steps not included in the dance steps list.
The second element is either -1 if the dance is legal, or else the
index of the first step which cannot be danced.
</P>

<P>
The problem is might effectively tackled as a State Transition Machine.
Internal to the program, the coder needs to write a function which
takes the current state and next step, and returns the new state or
invalid.  The submission would then loop over the steps input.
</P>

<P>
As an additional complication, the "BASIC" step could have more than one
output, and the BACKWARD WALK step output depended on its input to determine
its output.
</P>

<P>
Problems:
<OL>
   <LI>Trying to use if-then-else to handle the logic.  Since some steps
           output state depended on their input state, this could not work.</LI>    
   <LI>Mis-understanding the problem description.  This was definitely a 
   problem worth reading more than once.  Some people simply coded the
   wrong rules.</LI>
   <LI>Not realising that input state was inportant for some steps.</LI>
</OL>
</P>


<P>
As in most simulation problems, it's hard to point to a general problem.
The difficulty is in translating the problem into code, and that's where
the errors crop up.
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
