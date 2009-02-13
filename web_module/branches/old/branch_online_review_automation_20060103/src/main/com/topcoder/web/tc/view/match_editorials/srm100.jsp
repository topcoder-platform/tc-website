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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm100_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm100_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505517" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm100" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 100</span><br>June 24, 2002
<br />

<H1> 
The Problems 
</H1> 

<P>
<B>Division-II Easy<BR/>
200pt - LStrings.sumLength</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505517" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
This one was simple enough to just follow the instructions to get right.
Keep a counter, set it to zero. For each character in each string, check to
see if it's a dash. If it isn't, add one to the counter. At the end, return
the counter. I haven't yet seen a single failed solution that would have
passed the example cases.
</P>


<P>
<B>Division-II Medium<BR/>
550pt - PrimeCount.howMany</B> &#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505517" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
This one is straightforward at first glance - just set up another counter
and a loop to go through each number and divide it by its factors until it
reaches 1. While this works for most of the example cases, it fails rather
dramatically when a number is a multiple of two large primes, or even worse,
when a number *is* prime. A program can do 100,000,000 simple operations in
eight seconds without much trouble, but there's no way you're ever going to
manage 5,000,000,000 modulus operations in that much time.
</P>

<P>
The solution, however, is actually quite simple. The inner loop that times
out looks like "for( factor = 0; factor &lt;= number; factor++ )". Simply
change it to "for( factor = 0; factor * factor &lt;= number; factor++ )" and it
will square-root the number of iterations you have. Once you're done, just
add one to the count, since "number" will have a factor left over, and
return that value.
</P>


<P>
<B>Division-I Easy<BR/>
250pt - BadCoding.numDecode</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505517" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
There are various ways to code this - the string size limitation of 20 makes
it quite easy. Probably the simplest way is as a recursive function. Take a
hypothetical recursive function "count". At each digit, check to see if this
digit and the next digit form a number less than 26. If they do, return
count( position + 1 ) + count( position + 2 ). It's an O( 2^n ) algorithm,
and 2^20 is only a million, so it'll run easily fast enough. If you were
worried about speed, you could store the results as you continued and refer
to the stored versions.
</P>

<P>
Another solution is to keep a small array of all the possible states it
could be in. There are only three - "ready to start another number", "right
after a one", and "right after a two". For each digit you just need to
update the various positions, and at the end, return the "ready" count.
</P>


<P>
<B>Division-II Hard/Division-I Medium<BR/>
1100pt/550pt - RangeSort.valueAt</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505517" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
It's quickly clear that simple brute-force just won't cut it. That would be
a lot of tests. My approach was to put together a list of all the locations
where the number of ranges a given number in would change. For example,
given [1,5],[3,7], it could change at 1, 3, 6, and 8 (the *first* number it
changes it, not before the number). I did this by adding 1 to the upper
bounds and putting all the numbers together into a giant set. Of course,
this could generate a few false positives - [1,1],[2,2],[3,3], for example,
would look at 1,2,3,4, but with this approach it's fast enough.
</P>

<P>
Once I'd put together this table I simply started from the lowest number and
went up one "important point" at a time. Multiplying the number of ranges
the number was in by the distance to the next number gave me how many total
array items our theoretical array would contain. Once I knew it was in the
current "section", dividing the number of array items left by the number of
ranges, and adding the start of the current section, gave me the answer.
</P>

<P>
<B>SnapDragon</B> had a rather nice solution also. While it's too slow to scan 50
integers for each of twenty million numbers, it's fast enough to prepare the
arrays intelligently and just count from the bottom on up. He doesn't bother
keeping a relationship between which array is which, and it really doesn't
matter - if it's a "lower bound" it means "add one to the number of arrays
it's currently in", and if it's a "upper bound" it means "subtract one to
the number of arrays it's currently in".
</P>

<P>
<B>John Dethridge</B>, on the other hand, used a binary search, although I have to
admit I don't understand why he didn't just use a similar algorithm counting
from the bottom.
</P>


<P>
<B>Division-I Hard<BR/>
1000pt - OneWayRoad.totalCost</B>&#160;
<A href="http://forums.topcoder.com/?module=ThreadList&forumID=505517" class="statText"><img src="/i/interface/btn_discuss_it.gif" alt="discuss it" border="0" /></A><br />

</P>

<P>
The key on this one was coming up with a working algorithm. Basically, you
only cared whether or not it was possible to make a set of roads to fulfill
the condition - you don't care *what* those roads are. The simplest way, by
far, was to remove a road and see if you could still get from one end to the
other end (basically ensuring that there are at least two ways to get from
point A to point B.) Do this for all the roads - if you can, congrats,
you're done. If you can't, once again you're done. That's really all there
is to it. For the test of "getting from point A to point B" you could use
Dijstra's or Floyd's - note, however, that there might be up to 100
locations, and 100 locations with Floyd's is slow. Although if there *are*
more than 50 locations there's no way it's possible.
</P>

<P>
<B>SnapDragon</B> and I (and possibly several others) used a much ickier algorithm
that I don't recommend, but I thought I'd record for posterity. Simply put,
find a loop and collapse all the nodes in the loop into a single node. You
can easily end up with multiple connections from this ubernode to another
node, so you'll have to keep track of this. Once you're out of loops, with
any luck you'll have a single point left - if you do, that section of the
graph works. If you don't, it's impossible.
</P>

<P>
Note that there's a flaw with this algorithm - it won't work with
disconnected graph segments. The solution, of course, is to simply feed all
the graph segments in one at a time, and if a single one doesn't work, the
whole thing is impossible.
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

