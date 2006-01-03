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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm86_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm86_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505504" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm86" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR> -->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 86</span><br>May 8, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

<P>
<B>Division 1 - 275 - Shade</B><BR/>
Everyone pretty much took the same approach to solving this problem:
create a big two-dimensional array, fill it in according to the elements
in the coordinates array, and then count all the ones filled in.  The
two most common mistakes that I saw were people getting their indices
backwards, and people making the incorrect assumption that x1 &#60; x2 and
y1 &#60; y2.
</P>

<P>
<B>Division 1 - 475 - Dial</B><BR/>
The first step to solving this problem is to parse all of the
relationships between the digits.  For each rule, there is a
relationship between two digits that says that the two digits must come,
one after the other.  Once you have this figured out you can solve the
problem using recurrence.  First, check that the first digit doesn't
have to be after some other digit and that there are no digits which
must be before or after two distinct digits.  If those conditions are
not met, return 0, otherwise, try to find valid sequences by recursively
adding one digit at time and keeping track of which digits have been
used.  If at any point the last digit in the sequence must come before
another digit, then use that digit next.  If there are not restrictions,
then recursively try to add each unused digit to the sequence.  See
malpt's solution for an examples of exactly this.  The quickest solution
to code was to use the C++ function next_permutation and then just look
at every sequence to check if it was valid.  See <A HREF="/stat?c=last_match" CLASS="bodyGeneric">DjinnKahn's</A>
 solution for an examples of this.
</P>

<P>
<B>Division 1 - 1000 - Battery</B><BR/>
Solving this problem required more intuition than knowledge of any
algorithmic technique.  With up to 50 candles, it is obviously
impossible to try every combination, or even to try some small subset of
every combination.  The key is to note that a candle contributes the
most when it is burning in conjunction with the most candles.  So, if we
ignore the restriction about minimum recharge time, then the best way to
burn them is to start them all at once.  In order to take the minimum
burn time into account, we take the longest burning candles, and start
them later than the rest, so that we can have some candle burning for
the minimum time.  We select the longest burning ones because they have
the lowest contribution to burn time ratios.  Thus, the basic algorithm
is to sort the candles by length and select enough of the candles,
starting with the longest, that the minimum will be exceeded.  Since we
don't want to exceed the minimum if possible, we will overlap two of
these candles so that the minimum is exactly reached.  Then, all of the
other candles are started at the same time as the overlap and burn for
their duration.  <A HREF="/tc?module=MemberProfile&amp;cr=128924" CLASS="bodyGeneric">thekcc's</A>
 beat everyone else by implementing this in
fourteen minutes.
</P>

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
