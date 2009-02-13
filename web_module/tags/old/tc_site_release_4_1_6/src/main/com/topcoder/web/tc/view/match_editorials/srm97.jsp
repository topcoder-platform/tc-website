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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505515" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 97</span><br>June 12, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>
The Level One problem was a bruteforcable geometry problem with a few
catches. The easiest way was to simply test all possible lines, calculate
which points lay on the lines, and return the best of those. Implementation
got tricky. I'm using my solution for reference because I understand it and
because, in the end, it's quite clean. los/loe are Line One Start and Line
One End, lts/lte are Line Two Start and Line Two End. Technically speaking
the lines don't end, but it's useful to think of them as always having to go
"through" two points. The core of my solution is a simple loop to determine
whether a given point is intersected by any line. Here's where things get a
little tricky, so I'll make a paragraph break and explain that chunk of
code.
</P>

<P>
Given three points A, B, and C, it's easy to visualize the fact that if C
would lie on an infinite line through A and B, then the slope from A to B
must equal the slope from A to C. As many know, math isn't my strong point,
so I didn't prove this, I just trusted it. Early algebra tells us that the
slope calculation is rise-over-run, so ( ABrise / ABrun ) == ( ACrise /
ACrun ). Unfortunately, this involves non-integer math, and as any TopCoder
veteran knows, floating-point is something to be avoided whenever possible.
Luckily, algebra saves us here - multiply both sides by ABrun and ACrun to
get ABrise * ACrun == ACrise * ABrun. I'll be the first to admit that this
isn't intuitive, but it works, and you'll notice two statements of that type
in that enormous if statement of mine.
</P>

<P>
Some people decided to cast to a 64-bit int of some sort. I didn't, and it's
not necessary The largest possible rise is 40,000, and the largest possible
run is 40,000 as well. 40,000*40,000 is only 1,600,000,000, and a signed
32-bit integer goes up to about 2,100,000,000. On the other hand, I spent a
few seconds thinking about it, so it might have been to my benefit if I'd
just reflexively cast to a 64-bit int.
</P>

<P>
You'll also notice a few tests for whether we're actually talking about an
endpoint. In retrospect this isn't necessary - working out the calculations
it definitely won't matter, it will return the same thing anyway - but it
made me feel better, since division by zero is generally a bad thing. Note
that, even if you trust floating-point accuracy, the potential division by
zero would have possibly caused problems.
</P>

<P>
The other thing worth mentioning is that obviously if there's only one
point, there's not going to be any way to draw a line from one point to
another. If there are zero points, there's not even anything to intersect!
This is the bug <B>venco</B> found in <B>dgarthur</B>'s code - I solved it with a simple
size test, before the main loop. Obviously if there are less than three
points we can just throw a line through all of them - in fact, any test with
less than five points can be solved with no points remaining.
</P>

<P>
The Tron Racing (Level Two) was more of a "here's the code, go implement it"
than anything else. You could either make a field with "wall" around the
outside or just check bounds. I believe checking bounds would be easier by
far - the fact that I didn't is part of what contributed to my horrible
score. Another thing worth pointing out is the racer-collision algorithm.
It's important to not remove any trails or racers until you've checked *all*
the racers for death. Removing pairs of racers causes failures if three
racers collide at once - the "third" keeps going on. And removing a racer
the instant you detect its death might cause the disappearance of its wall
that another racer had just hit.
</P>

<P>
Speed wasn't an issue - the maximum runtime of this problem was under 1250
cycles (I believe it's 49*49/2+1, but I could be off on that.) One could
potentially get an out-of-bounds error if you made a 1250-size array for
holding instructions, however, since instructions could be at the 1250
point.
</P>

<P>
I fully expect that I got one of the lowest scores on the 1100, if not *the*
lowest - in general, it was something that either you got instantly or
couldn't figure out, and I figured it out at the last minute. My solution
was, eventually, the dynamic programming solution - I don't have a clue what
the divide-and-conquer solution was.
</P>

<P>
The trick was to look at the problem sort of inside-out. If you tried to
approach it like a single car starting from the beginning, going to the end,
and back again, you were doomed. The best way to look at it is like two
cars, both starting from the beginning, both ending at the finish. Iterate
through the locations from left to right, and each location you have two
choices - either the "first" car goes there, or the "second" car goes there.
You ended up with a 2-dimensional array at each step, one dimension for the
potential positions of the first car, one dimension for the potential
positions of the second car. I decided not to attempt to prove I could do
the work in a single array and used two arrays, one for reading and one for
writing, copying the write array over the read array after each step (ready
for the next one) and resetting the write array to an appropriately chosen
"infinity" value. (I started with 1, then hit 0 a lot, and added .0 at the
end so it was floating-point - reid simply typed 1E12, which I consider
significantly classier.) Then for each position in the read array, set the
appropriate two positions in the write array to the minimum of the current
value and what it would be if that car had taken the trip. It's hard to
explain in text - I recommend looking at my solution (<B>ZorbaTHut</B>'s), since,
for obvious reasons, it's the closest to what I wrote.
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
