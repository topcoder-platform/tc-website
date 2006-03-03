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

<span class="bigTitle">Lessons Learned the Hard Way</span>

<P>
SRM 87 had 623 registrants, and this resulted in 41 rooms in Division-II, of 
which 5 rooms were in the non-rated competition. 
</P>

<P>
The problem slate in Division-II formed a good test: the 250 had a sting in 
its tail which led to an exciting challenge round, the 550 was a reasonable 
problem which tested knowledge of data structures, and the 1050 was a more 
complex challenge which involved navigating a graph. 
</P>

<P>
For the green section, the result appears to have been an excellent 
contest.  In the grey rooms, however, no-one in the bottom 10 rooms 
managed a successful 1050.  In a discussion in the lobby, the idea of 
deliberately varying the difficulty of the Division-II slate (one 
relatively easy, one more challenging each week) was put forward. 
This may be worth trying, either officially or unofficially in the future. 
Certainly, SRM 87 was more than a "typing contest" in most rooms. 
</P>

<P>
<B>250 (Eenie):</B><BR/> 
This problem was a simple token counting problem based on childrens' 
counting games like "Eenie meenie miney mo".  Input was a string representing the rhyme, 
and the number of children in the circle.  The problem was to return 
the number of the child selected.  The twist was that the counting was 
1-based. 
</P>

<P>
I got a feeling from many of the failed solutions, that the coder felt it 
was merely a typing speed test.  In java, the solution is simple, using a 
StringTokenizer and the countTokens() method.  It is interesting that many Java coders among 
those whose problems I surveyed did not think of this method in the heat of battle. 
</P>

<P>
<B>Problems identified:</B> 
<OL>
   <LI> A surprising number of people failed this by unthinking use of the mod function. This failed because mod returns a value in [0, n-1] rather that [1, n]</LI> 
   <LI> Counting the children against the words, rather than vice versa.</LI> 
   <LI> Correctly identifying the problem case of where count = n, but returning 1 or the number of words instead of n.</LI> 
   <LI> Use of regular instead of modular division.</LI>
</OL>
</P>
 
<P>
This problem led to a very eventful first minute or so of challenge phase in 
some rooms, as a lucky coder challenged several problems successfully one after another. 
</P>

<P>
<B>550 (losers):</B><BR/> 
This problem involved scoring a mythical game, where points are awarded for 
the first 3 positions in each round.  Given a list of round results, the goal was to 
return an alphabetically sorted String[] of the lowest scorer or scorers.  The points awarded were 6 
for 1st, 3 for 2nd and 2 for 3rd. 
</P>

<P>
This problem was simplified by a knowledge of standard data structures such 
as java.util.HashSet or c++ map, for example. 
</P>

<P>
<B>Problems:</B> 
<OL>
   <LI> Failure to return more than one name when a tie occured, resulting from using a constant, where a loop index was required. </LI>
   <LI> Failing to add elements outside the top 3 to the data structure.  This never registered contestants who never placed.</LI> 
   <LI> Failing to deduce the scoring mechanism correctly from the problem description.  In this category, one finds people giving points beyond third.</LI> 
   <LI> Code path failure using combined conditions.  One example of this involved checking that this  was a scoring entry and that a HashTable included the key.  In the false part of the condition, the coder didn't check the Hashtable again, and instead reset the accumulated score for that key to zero.</LI> 
</OL>
</P>

<P>
<B>1050 (AuntUncle):</B><BR/> 
The goal was to take a series of triples, representing 2 parents and a 
child, and return the set of siblings of the parents of a specified target. 
Including the parents or the target was forbidden. 
</P>

<P>
The problem proved quite tricky, with a large number of submissions failing. 
Among the errors found were: 
</P>

<P>
<OL>
   <LI> Use of String.endsWith() rather than tokenizing first, resulting in spurious errors</LI> 
   <LI> Returning parents as uncles or aunts.</LI> 
   <LI> Segfaulting.</LI> 
   <LI> Returning the target. </LI>
   <LI> The case including an incestuous family tree caused some problems. </LI>
   <LI> Nullpointer Exception traversing HashMaps in java when there were no links between the families specified.</LI>
</OL>
</P>

          
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
