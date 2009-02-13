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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505513" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 95</span><br>June 5, 2002
<br /><br />

<H1> 
The Problems 
</H1> 

<P>
<B>Level One</B>
</P>

<P>
The Division-I Level One problem seemed more complex than it was
necessarily. I don't know of any clever or elegant solution, but it works
quite nicely to just try every base dimension up to some limit. <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A> picked 40 
for the limit on both sides - I don't know where he got
the number, but it works. <A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>
 just had it go to 1000 on each side. <A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>
had it go to the number of balls, which is more elegant than mine.
</P>

<P>
In any case, it's a simple brute-force to find the best possibility. Keep
track of the "best" - set it to a ludicrous worst to begin with - then try
every possibility of base size, up to a point. If it's valid - that is, it
can hold enough balls - check if it's better than your current "best". After
all the calculations are done, return the best.
</P>

<P>
This also meant you had to calculate how many balls could be stored given a
base, but that's a simple recursive function. You can find an example of it
easily in <B>ZorbaTHut</B>'s code - it's the function named "calctb".
</P>

<P>
One thing that tripped several people up was what to do if the new base area
matched the current best. Many people didn't notice the instruction to
choose the base with the closest-matching sides. You could also achieve the
same thing by attempting to minimize the perimeter.
</P>


<P>
<B>Level Two</B>
</P>

<P>
The Level Two problem was also rather simple. The easiest way to do it was
to first find the smallest funnel that could fit the entire string. It
wasn't hard to calculate how many characters could fit in a funnel of a
given depth (once again, a recursive calculation was simple), and from
there, just make a big character array and fill it from the top. A good way
to avoid special cases was to make a 50x50 array and prefill it with spaces.
Since x
and y were both guaranteed to be between 0 and 49 inclusive, this meant you
could just pull the character at that point out and return it - no
bounds-checking necessary. I don't know about you, but bounds-checking on
diagonal lines isn't my idea of fun.
</P>

<P>
Some of the calculations are a bit messy, but for the 50x50 array technique
I suggest mine, <B>ZorbaTHut</B>'s. <A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>'s solution is also interesting because
it's so different from anything I just mentioned.
</P>


<P>
<B>Level Three</B>
</P>

<P>
The Level Three was, in the end, just a simple dynamic programming problem.
You took an array of 2^14 items. Each position could be broken down into a
bitmask - the bits that are on represent constraints that are not currently
satisfied, while the bits that are off represent constraints that are
satisfied. Set the entire array to infinity (or a value close enough to it -
I used 128) then set the start position - how satisfied each constraint is -
to 0. From there, you're just traversing through for each letter. If the
letter is in a given constraint, you set the equivalent bit to 1 (since
removing it will toggle the correctness of that constraint). Then each
position in the array becomes min( current_position, array[ current_position
^ constraint ] + 1 ). At the end you look at position 0, and if it's got a
number in it, that's your solution. <A HREF="/tc?module=MemberProfile&amp;cr=154754" CLASS="bodyGeneric">kv</A>'s solution is the cleanest
implementation I can find.
</P>

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

