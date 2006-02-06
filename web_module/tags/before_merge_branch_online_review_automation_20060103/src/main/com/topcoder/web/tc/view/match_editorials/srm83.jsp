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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm83_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm83_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505501" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm83" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
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

<span class="bodySubtitle">SRM 83</span><br>April 27, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>Saturday's 200pt problem had a reasonable point value on it - it was
straightforward and basically laid out in the description. Nothing clever,
just do what they said. I suppose some people might have made mistakes with
floating-point, but if you read the notes it turned out that it was simple
standard integer division. Do the steps and return the answer, about as
simple as it gets. Look at basically anybody in the first room for a good
solution - <A HREF="/stat?c=last_match" CLASS="bodyGeneric">dmwright's</A> 
is perhaps better laid out than some (though slightly slower to write).</P>

<P>The 550, on the other hand, was messy and hateful. Look at five people and
you'll find five completely different totally unreadable solutions. I'm
rather proud of mine, as ugly as it is - I set up an enormous 2001x2001
array representing the entire grid, then fill in the edges using bitmasks. I
have a small array of each combination of edges between the different
bounding boxes (the first four bits are box 1, the second four are box 2)
and I simply count how many times each combination shows up. If it's more
than 1, there's a segment there. If it isn't, there isn't. I also count the
intersection points themselves - if there isn't a segment, that
distinguishes between POINT and POINTS. Finally, if none of those yield
results, I fill in the entire array that one polygon occupies, then test to
see how much overlapping area they have. If it's equal to either polygon's
total area, then they're nested.</P>

<P>Unfortunately I forgot to clear the array causing it to fail in systest, but
without that problem this is probably one of the easiest ways to
conceptualize it. Anything else will involve an enormous number of if
statements with an equally enormous number of potential typos, leading to
the dismal success ratio (there are a grand total of 12 working solutions in
the entire competition.)</P>

<P>The 1000 wasn't a lot more pleasant - in effect, it's a basic brute-force
search, but if at any point the equation ends up in a form where it can't
work, you drop it and try again. I'd recommend picking one end to start from
then just trying all the possibilities from there and moving on. Keep an
array of which digits you've used and which letters mean what, and that's
basically all. However, the problem's complexity kept most people from
completing it.</P>

<P>Note that which end you start from changes your approach slightly - if you
start from the smaller side, it's a bit easier to deal with carries, where
if you start from the larger side, you can use branch-and-bound a little
more effectively.</P>

<P>It's not possible to simply brute-force it, as that would be up to 10!
tests, which doesn't stand a chance of executing in time. In C++, a simple
permutation loop without anything in it takes 1.2 seconds at that point, and
obviously the test inside would be slow enough to completely time out.</P>
<P><BR/><FONT COLOR="#336699"><B>Comment from doeth</B><BR/>
Just wanted to note an error in Zorbathut's analysis of the SRM 83 Div 
1 1000 pt. problem.  Indeed, a brute-force search without any pruning 
of the search examines 10! possibilities; however this *does* finish in 
time.  Look at both of the room 22 solutions. I've also written up the 
pure brute-force method myself in Java and got each individual test to 
finish in less than 5 seconds.</FONT></P><BR/><BR/>


<p>
<img src="/i/m/ZorbaTHut_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="152347" context="algorithm"/><br />
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

