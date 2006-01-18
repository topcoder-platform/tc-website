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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505505" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm87_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 87</span><br>May 9, 2002
<br /><br />

<span class="bigTitle">Match summary</span>

 <P>
The Division-II Easy problem wasn't hard, though perhaps somewhat easier in
 Java. You simply had to count the words (with StringTokenizer), then modulus
 with the number of items. Note that if you got 0, you had to return the
 number of items, *not* 0. C++ made it a little more difficult due to no
 really easy way to count the number of words - however, you could count the
 number of spaces instead and add one, since you were guaranteed only one
 space distance between words and no leading/trailing spaces.
</P>
 
<P>
 The Division-II Medium problem was mostly simple. You simply had to add up
 the scores for each player. There was some vagueness on the precise scores
 for each place, and it took a little math to come up with an array of { 6,
 3, 2 } for this (many people hardcoded it). After that was done, one could
 simply add up the totals, then choose the lowest score, put all the people
 with those names together, and sort, and you're
 done. The only tricky bit was figuring out a way to hold all the players,
 but as they limited it to 100 player names total, you could use a static
 array, a map&lt; string, string &gt;, or a HashMap.
</P>
 
<P>
 The Division-I Easy/Division-II Hard problem started off the Div-I problem set
 with a rather easy brute-force problem, the type of which many of us have
 seen before. Whenever you see an item set that goes from 1 to 20 elements,
 this algorithm is a good bet. Basically, you try every combination, and keep
 track of the best answer. That's it. 
 <A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A> (me) did it recursively,
 while <A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A>
 counted from 0 to 2^20 and turned each number into a
 possible solution using its binary representation. Basically all the
 solutions fell into one category or another.
</P>
 
<P>
 The Division-I Medium problem was also a brute-force deal. Take the "target"
 and find all his parents. Then find all *their* parents. Then find all their
 children. Then remove the target and the result of step 1 from that. And
 there's your result (after you sort it). C++'s set&lt;&gt; came in very
 handy, since it not only sorts automatically but insures uniqueness (no
 point in storing a parent twice, and uniqueness is bad on the final step.)
 It's not the most elegant solution in the world, but it will easily run fast
 enough. <B>ZorbaTHut</B> built functions for "find all children" and "find all
 parents", so it may be easier to read. <A HREF="/tc?module=MemberProfile&amp;cr=120816" CLASS="bodyGeneric">malpt</A>
 has an equivalent solution
 using Java's HashSet.
</P>
 
<P>
 Somewhat annoyingly, the Division-I Hard problem was solvable brute-force as
 well. My solution generated all the possibilities recursively, and for each
 possibility, it made sure every single result in the list was consistent
 with it. I had to write a little generator to compare two possibilities,
 then it was just a matter of comparing how many potential solutions were
 found. If it was 0 solutions, it was invalid. More than 1 meant unknown. And
 1 gave us the answer (which presumably we've stored somewhere.)
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
