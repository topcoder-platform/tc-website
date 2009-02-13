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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505506" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm88_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 88</span><br>May 15, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>
The three hundred point problem was solved most easily by brute force.  
You simply check every possible tile, by checking all of the sub 
rectangles whose upper left corner is the same as the given input.  You 
then tile the image, and make sure that it works.  This can be done
quite easily with 4 nested loops.  The outer two are for tile size, and the 
inner two check that everything matches up by using a couple of modulus 
operators.
</P>

<P>
The 500 could be solved with simple recursion.  You are given a 2-D
array and have to find the number of groups, and the borders between the 
groups.  To do this you keep a 2-D boolean array that corresponds to the
input map.  You start with some point, and the recursively visit each of
the adjacent points that belongs to the same farmer and has not yet been
visited.  Eventually, all of the points in the group will be marked 
visited.  Then you find another unvisited point and start from it.
After every point has been visited, the number of signs needed is equal to the
number of times you had to start the recursion.  The number of units of 
fence can be easy computed by examining every pair of adjacent points, 
and if they are not equal, adding 1.  This could be done simply in the 
recursion by adding a unit of fence whenever the algorithm hits an 
adjacent point that is not the same as the point is it on.  (You have to
divide this by 2 at the end, since you count each section twice.)
</P>

<P>
The 1100 was very similar to a previous problem on TopCoder and is 
related to the game nim.  The trick to the way I solved this was to 
realize that groups of 3 periods can be removed without effecting the 
outcome.  This is because if there are three periods to the left of an
X, then either player can force that piece to be moved three spaces to the 
left.  That is, if a player moves it 1 space to the left, the other 
player can move it two spaces, and other a player moves it 2 spaces to 
the left, the other player can move it one more space.  With this 
insight, a memoized recursion should solve the problem with out to much 
difficulty.  Simply remove all groups of three periods and the try every
move.  If in of them are winning, then this position is winning
otherwise it is not.  By caching the results, we avoid recomputing boards, and run
time is not an issue.  An alternative solution uses XOR and parity to 
compute the answer without any search.  <A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
 and <A HREF="/tc?module=MemberProfile&amp;cr=157974" CLASS="bodyGeneric">bigg_nate</A> both 
implemented a form of this solution.
</P>
 
<!-- http://www.cut-the-knot.com/nim_theory.shtml contains more info about
the parity solution to nim, and give some insight into why it works with
this problem. -->

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
