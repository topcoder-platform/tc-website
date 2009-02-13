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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505503" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm85_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 85</span><br>May 1, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P><B>Div. 1 - Easy: LarvaRace</B><BR/>
This problem was slightly more difficult than the typical easy problem, though the solution was still fairly straightforward.
Generally there are two approaches: one can either iterate through the time steps until a worm has reached the destination,
or one can determine how many time steps it will take for each worm to reach the destination.  In my opinion the former approach
was easiest, as there were no special cases to worry about.  The problem specification guaranteed that at least one worm would
eventually reach the destination, so all one had to do was move the worms in the proper manner.  For the second approach,
there was more room for error, as there may have been worms that never moved.  These worms would never reach the destination,
and this would have to be detected.  Many people that used this approach failed to note that worms that never move do reach
the destination if the destination is zero.  It was this test case in particular that broke three solutions in Room 1 during
the Challenge Phase.  Most people submitted this problem very quickly, but many of those people missed it for some reason or
another.  I think this was the trickiest problem in Div. 1 this match.</P>

<P><B>Div. 2 - Easy: Evil</B><BR/>
This problem wasn't evil at all.  It just consisted of computing the parity of each of a set of numbers. The parity of a number 
is simply the sum of its bits modulo 2, although there are many equivalent definitions. The only difficult aspect of the problem 
then is extracting the bits of a number.  While the problem statement went into great detail explaining one way of doing this, 
here are a few alternative methods that are much quicker to implement:<BR/>
<UL>
<LI>In Java: <TT>Integer.toBinaryString(v)</TT> returns a String containing the binary representation of v.  Thus the ith bit of a number v 
(where bit 0 is the least significant bit) can be obtained by<TT>String tmp = Integer.toBinaryString(v); bit = tmp.charAt(tmp.length() - i - 1);</TT></LI>
<LI>In C++ or Java: The expression <TT>(v &amp; (1 &lt;&lt; i))</TT> will be non-zero only if the ith bit of v is 1</LI>
</UL>
</P>

<P><B>Div. 1 - Medium / Div. 2 - Hard: RPSVari</B><BR/>
Like many medium problems, this was a case of reading the specification of a simulation carefully and properly implementing it. There were no 
real tricks to the problem, as long as one managed not to confuse array dimensions, etc., during implementation. Very few people missed this 
problem in Div. 1, and most people that submitted this problem in Div. 2 got it correct as well.</P>

<P><B>Div. 2 - Medium: TripleCode</B><BR/>
As with the RPSVari problem, this problem mostly consisted of following instructions.</P>

<P><B>Div. 1 - Hard: PrizeAward</B><BR/>
For those that were able to quickly formulate a combinatorical solution, this problem was nearly trivial. For others, however, it took 
a lot of time or effort to discover the solution (if at all).  Once the solution is correctly formulated, the implementation is actually quite simple.</P>

<P>The solution can be drived by expressing the problem as a recurrence relation.  Let S(p, c) be the solution to the problem for p prizes and c coders. 
First we will formulate the base cases.  We know that if there are no coders, there is only one way to distribute the prizes (that being no distribution at all), so S(0, c) = 1.
We also know that if there is no prize, then there is only one way to distribute it, so S(p, 0) = 1. With these base cases in place, we can now apply 
some basic combinatorics to solve S(p, c) for any values of p and c.</P>

<P>For i = 1 to c, we count how many ways i out of c coders can tie for a particular place. The solution to this is given by the
<A HREF="http://planetmath.org/encyclopedia/BinomialCoefficient.html" CLASS="bodyGeneric">choose function</A>, C(c, i) = c! / (i! * (c-i)!). For each value of i, we then multiply 
C(c, i) by a reduced version of the problem, where i prizes are split among i coders and the number of ways of distributing the remaining p - i prizes (if any)
among the remaining c - i coders are counted.  This is given by S(max(p - i, 0), c - i).</P>

<P>Thus our solution is S(0, c) = S(p, 0) = 1, S(p, c) = sum {1 &lt;= i &lt;= c} C(c, i) * S(max(p - i, 0), c - i). This is trivial to implement, and one can optimize by applying
<A HREF="http://www.nist.gov/dads/HTML/memoize.html" CLASS="bodyGeneric">memoization</A> techniques to both the C and S functions to avoid unnecessarily recomputing values (as done by <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">derkuci</A>).
To see how to iterate through the values of C(c, i) for some fixed c without computing factorials,
see derkuci's solution.</P>

<P>One can go even further and simply precompute all the possible answers, since the input constraints only permit 256 possible
inputs.  However, the straight-forward solution should be plenty quick enough for this problem (as evidenced by <A HREF="/stat?c=round_stats&amp;rd=4145" CLASS="bodyGeneric">ambrose's</A> solution).
Although there were few submissions for this problem, most of them were correct.</P>


<p>
<img src="/i/m/Logan_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
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
