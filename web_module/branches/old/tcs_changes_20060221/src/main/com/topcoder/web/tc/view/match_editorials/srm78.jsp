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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm78_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm78_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505493" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm78" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 78</span><br>April 9, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>Algorithms:<BR/>PoemCode - 250<BR/>
Like most 250's the algorithm was straightforward and there were not really any special cases to watch for.  You simply have to remove the extra characters (',','.', and ' ') and then loop 
from 'a' to 'z' and keep a counter outside the loop.  Whenever you hit the letter your loop is on, you set the corresponding spot in your return array to the value of the counter, and 
increment the counter.  Look at any solution in <A HREF="/stat?c=last_match" CLASS="bodyGeneric">Room 1</A> to see this in action.  This was one of the easier easy problems in recent 
history, with only 8 out of 215 people not submitting correct solutions.</P>
<P>Pinball - 450<BR/>
This problem was pretty straightforward, and in general unsuccessful solutions were due to oversights rather than algorithmic mistakes, of which there were many as evidenced by a 96% 
submission rate, but only a 52% success rate.  The key points to remember were to reset everything between games, to not raise the multiplier above 5, and not to clear the score after 
a game until a new game starts.  Other than that, it was just a matter of looping through all the characters in the input and performing the appropriate operations.  See <A HREF="/stat?c=last_match" CLASS="bodyGeneric">John Dethridge's</A> 
solution for a good, short implementation.</P>
<P>CleanupCrew - 1050<BR/>
No matter how many toys your opponent picks up, you can always pick up a number of toys such that there are k+1 less toys in that pile than there were in the pile before your opponents turn.  
This can easily be seen by noting that player A must first pick up k+1-n toys, for some n between 1 and k.  Player B may then pick up n toys so that a total of k+1 toys have been picked up.  
If player B does not pick up n toys, but picks up m toys instead, then player A can pick up k+1-n-m or 2k+2-n-m toys (whichever one is between 1 and k).  Thus either player can force the game 
to come down to the point where the sizes of the piles are all the input size modulo k + 1.  At this point the problem can be solved easily with dynamic programming by working backwards 
(see <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright's</A> solution) or with memoized recursion (see <A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson's</A> solution).  An even simpler but much less obvious solution is malpt's.  For a discussion of why this works go to 
<A HREF="http://www.cut-the-knot.com/nim_theory.shtml">http://www.cut-the-knot.com/nim_theory.shtml</A></P>
<P><BR/><DIV ALIGN="center"><TABLE WIDTH="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0" ALIGN="center">
<TR>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="left" BGCOLOR="#CCCCCC"><B>&#160;Problem<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Points<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Submission Rate</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Submission Succ.</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="right" BGCOLOR="#CCCCCC"><B>Avg. Pts.<BR/>&#160;</B></TD>
   <TD WIDTH="20%" CLASS="bodyText" ALIGN="center" BGCOLOR="#CCCCCC"><B>High Score<BR/>&#160;</B></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
<TR><TD COLSPAN="6" CLASS="bodyText" ALIGN="left">Division I</TD></TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 1<BR/>PoemCode</TD>
   <TD CLASS="bodyText" ALIGN="right">250</TD>
   <TD CLASS="bodyText" ALIGN="right">99.07%</TD>
   <TD CLASS="bodyText" ALIGN="right">96.28%</TD>
   <TD CLASS="bodyText" ALIGN="right">221</TD>
   <TD CLASS="bodyText" ALIGN="center"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">NDBronson<BR/>244.20</A></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 2<BR/>Pinball</TD>
   <TD CLASS="bodyText" ALIGN="right">450</TD>
   <TD CLASS="bodyText" ALIGN="right">95.81%</TD>
   <TD CLASS="bodyText" ALIGN="right">51.63%</TD>
   <TD CLASS="bodyText" ALIGN="right">326</TD>
   <TD CLASS="bodyText" ALIGN="center"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">Logan<BR/>412.42</A></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 3<BR/>CleaupCrew</TD>
   <TD CLASS="bodyText" ALIGN="right">1050</TD>
   <TD CLASS="bodyText" ALIGN="right">30.23%</TD>
   <TD CLASS="bodyText" ALIGN="right">11.16%</TD>
   <TD CLASS="bodyText" ALIGN="right">631</TD>
   <TD CLASS="bodyText" ALIGN="center"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">thekcc<BR/>981.45</A></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>

<TR><TD COLSPAN="6" BGCOLOR="#FFFFFF"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="20" BORDER="0"/></TD></TR>
<TR><TD COLSPAN="6" CLASS="bodyText" ALIGN="left">Division II</TD></TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 1<BR/>Scoreboard</TD>
   <TD CLASS="bodyText" ALIGN="right">250</TD>
   <TD CLASS="bodyText" ALIGN="right">97.65%</TD>
   <TD CLASS="bodyText" ALIGN="right">97.07%</TD>
   <TD CLASS="bodyText" ALIGN="right">240</TD>
   <TD CLASS="bodyText" ALIGN="center"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">kokon<BR/>249.16</A></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 2<BR/>PoemCode</TD>
   <TD CLASS="bodyText" ALIGN="right">500</TD>
   <TD CLASS="bodyText" ALIGN="right">91.79%</TD>
   <TD CLASS="bodyText" ALIGN="right">79.47%</TD>
   <TD CLASS="bodyText" ALIGN="right">372</TD>
   <TD CLASS="bodyText" ALIGN="center"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">WhiteShadow<BR/>478.40</A></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
<TR>
   <TD CLASS="bodyText" ALIGN="left">Level 3<BR/>ToyPatrol</TD>
   <TD CLASS="bodyText" ALIGN="right">1200</TD>
   <TD CLASS="bodyText" ALIGN="right">47.80%</TD>
   <TD CLASS="bodyText" ALIGN="right">3.23%</TD>
   <TD CLASS="bodyText" ALIGN="right">601</TD>
   <TD CLASS="bodyText" ALIGN="center"><A HREF="/stat?c=last_match" CLASS="bodyGeneric">antimatter<BR/>742.48</A></TD>
</TR>
<TR><TD COLSPAN="6" BGCOLOR="#000000"><IMG SRC="/i/clear.gif" ALT="" WIDTH="1" HEIGHT="1" BORDER="0"/></TD></TR>
</TABLE></DIV></P>

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
