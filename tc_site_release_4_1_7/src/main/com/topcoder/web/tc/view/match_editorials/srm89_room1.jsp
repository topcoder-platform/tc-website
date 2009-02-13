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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505507" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm89_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 89</span><br>May 18, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P><B>Coding Phase</B><BR/><BR/>
Much like the rest of Division 1, Room 1 submitted a mediocre performance in SRM 89, most likely due to the difficulty 
of the problems.  Initially all but <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">dmwright</A> and 
<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">po</A> opted to begin on the 200 point problem.  Within five minutes, 
<A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">John Dethridge</A>, <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">venco</A>, 
and <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">benetin</A> had each submitted the 200 point problem.  Five minutes later saw submissions 
from <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">DjinnKahn</A> and <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">dvickrey</A>, 
leaving <A HREF="stat?c=round_stats&amp;rd=4165&amp;dn=1" CLASS="bodyGeneric">Sord</A>, <B>dmwright</B>, and <B>po</B> as the only ones not to have submitted a problem.</P>

<P>At the 21 minute mark, <B>venco</B> became the first to submit a 600 point solution for 476.40 points, making him the first to submit two problems. 
He must have observed a problem with his solution, however, because he resubmitted it two minutes later, reducing the value of his solution to 390.55 points. 
At about the same time <B>Sord</B> submitted a solution to the 200 point problem as his first submission and po submitted his 600 point solution, leaving 
<B>dmwright</B> as the only one without a submission.</P>

<P>A few minutes later <B>dmwright</B> through with his 600 point solution, which was immediately followed by <B>John Dethridge's</B> 600 point solution. 
Within five minutes <B>dmwright</B> had also submitted his 200 point solution.</P>

<P><B>DjinnKahn</B>, <B>dvickrey</B>, and <B>Sord</B> were next to submit 600 point solutions over the following half hour.  The 900 point submissions did not 
arrive until the final five minutes of the Coding Phase.  The first 900 point submission came from <B>venco</B>, for 392.79 points.  The last submission of the 
Coding Phase was <B>benetin's</B> 900 point submission, for 490.16.  This gave these two competitors the lead going into the Challenge Phase.  At the end of the 
Coding Phase, the scores were:
<OL>
    <LI>venco: 976.36 (3 submissions)</LI>
    <LI>benetin: 682.72 (2 submissions)</LI>
    <LI>John Dethridge: 597.17 (2 submissions)</LI>
    <LI>dmwright: 555.25 (2 submissions)</LI>
    <LI>DjinnKahn: 538.10 (2 submissions)</LI>
    <LI>dvickrey: 514.56 (2 submissions)</LI>
    <LI>Sord: 419.41 (2 submissions)</LI>
    <LI>po: 381.33 (1 submission)</LI>
</OL>
</P>
<P><B>Challenge Phase</B><BR/><BR/>
<B>venco</B> opened up the Challenge Phase with an unsuccessful challenge of Sord's 200 point submission. <B>John Dethridge</B> then immediately followed up with a 
successful challenge of the same submission, exploiting the fact that <B>Sord's</B> solution incorrectly returned answers with exponents of <TT>1</TT>. This narrowed 
the gap between <B>benetin</B> and <B>John Dethridge</B>.</P>
<P>Things were quiet for the next seven minutes, until <B>dmwright</B> successfully challenged <B>DjinnKahn's</B> 600 point submission, taking advantage of <B>DjinnKahn's</B> 
incorrect implementation of a distance function for the hexagonal coordinate system and pulling himself further ahead of <B>dvickrey</B>.</P>

<P>The final challenge came a few minutes later in the form of another successful challenge by <B>John Dethridge</B> of the other submission from <B>Sord</B>. 
<B>Sord's</B> error consisted of accidentallY doubling the power of a club on the opening stroke.</P>

<P>The Challenge Phase concluded with a close race for second place between <B>John Dethridge</B> and <B>benetin</B>, with <B>venco</B> having a comfortable lead in first place. 
The scores at this point were:
<OL>
    <LI>venco: 926.36</LI>
    <LI>John Dethridge: 697.17</LI>
    <LI>benetin: 682.72</LI>
    <LI>dmwright: 605.25</LI>
    <LI>dvickrey: 514.56</LI>
    <LI>po: 381.33</LI>
    <LI>DjinnKahn: 177.53</LI>
    <LI>Sord: 0.00</LI>
</OL>
</P>
<P><B>System Test Phase</B><BR/><BR/>
The system tests knocked out both 900 point submissions, from <B>benetin</B> and <B>venco</B>. <B>benetin's</B> submission timed out on the <TT>12</TT>x<TT>12</TT> sample case, which 
explains why he submitted it in the final two minutes of the Coding Phase. <B>venco's</B> submission failed to detect that it was impossible to pair up all the students in one of 
the system test cases.</P>
<P>The only other submission to fail the system tests was <B>po's</B> 600 point solution, which strangely enough timed out on one of the sample cases.</P>

<P><B>Final Results</B><BR/><BR/>
The final scores were:
<OL>
    <LI>John Dethridge: 697.17</LI>
    <LI>dmwright: 605.25</LI>
    <LI>venco: 533.57</LI>
    <LI>dvickrey: 514.56</LI>
    <LI>benetin: 192.56</LI>
    <LI>DjinnKahn: 177.53</LI>
    <LI>po: 0.00</LI>
    <LI>Sord: 0.00</LI>
</OL>
</P>


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
