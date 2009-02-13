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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505509" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm91_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 91</span><br>May 22, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>

<P>
<B>Coding Phase</B>
</P>

<P>
SRM 91 began in the usual manner in Room One: 
<A HREF="/tc?module=MemberProfile&amp;cr=114853" CLASS="bodyGeneric">dmwright</A>
 opted to begin work on the Level 
2 problem, while everyone else chose to begin with the Level 1 problem. 
<A HREF="/tc?module=MemberProfile&amp;cr=152347" CLASS="bodyGeneric">ZorbaTHut</A>
 drew 
first blood, coming up with a 239.34-point submission in only six minutes 
(the highest Division-I / Level 1 score of the match). 
This was followed shortly by <A HREF="/tc?module=MemberProfile&amp;cr=152073" CLASS="bodyGeneric">NDBronson</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=270505" CLASS="bodyGeneric">John Dethridge</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=153505" CLASS="bodyGeneric">ambrose</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=105922" CLASS="bodyGeneric">qubits</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=274023" CLASS="bodyGeneric">venco</A>, 
<A HREF="/tc?module=MemberProfile&amp;cr=154754" CLASS="bodyGeneric">kv</A>, and 
<A HREF="/tc?module=MemberProfile&amp;cr=153902" CLASS="bodyGeneric">evd</A>, 
in descending order of points earned. The time at this point was 
15 minutes into the contest, everyone had submitted the Level 1 problem except 
<B>dmwright</B>, and everyone was working on the Level 2 problem. 
</P>

<P>
The first to submit a solution for the Level 2 problem was, of course, 
<B>dmwright</B>, 
for 511.44 points and the lead. <B>dmwright</B> then went on to look at the Level 3 
problem, while <B>ZorbaTHut</B> and <B>NDBronson</B> submitted their solutions for the Level 
2 problem. <B>NDBronson</B> spent only a few seconds less time on the Level 2 problem 
than <B>dmwright</B>, giving him a very slight edge. The next Level 2 submissions were 
from <B>kv</B>, <B>venco</B>, <B>qubits</B>, and <B>John Dethridge</B>. For some reason <B>ambrose</B> took an 
eight-minute hiatus between submitting the Level 1 problem and opening the Level 
2 problem, so although his submission was much later, he earned approximately the 
same amount of points as <B>dmwright</B> and <B>NDBronson</B>. 
</P>

<P>
<B>dmwright</B> was first to submit a solution for the Level 3 problem, having started it 
almost 10 minutes before anyone else, for 649.78 points. Shortly thereafter <B>evd</B> 
submitted his Level 2 solution. The next submission was <B>dmwright</B>'s 250, for 
237.05 points, followed shortly by <B>NDBronson</B>'s Level 3 submission for 622.00 
points and <B>venco</B>'s Level 3 submission for 644.00 points. Things were quiet for 
the remaining 15 minutes of the Coding Phase, except for <B>qubits</B> Level 3 submission 
for 472.09 points with 4 seconds remaining on the clock. 
</P>

<P>
At the end of the Coding Phase, the scores were: 
<UL>
   <LI>dmwright - 1398.27</LI> 
   <LI>NDBronson - 1375.02</LI> 
   <LI>venco - 1308.89</LI> 
   <LI>qubits - 1116.76</LI> 
   <LI>ambrose - 745.33</LI> 
   <LI>ZorbaTHut - 717.83</LI> 
   <LI>kv - 676.63</LI> 
   <LI>John Dethridge - 642.33</LI> 
   <LI>evd - 596.73</LI>
</UL>
</P>
 
<P>
<B>Challenge Phase and System Phase</B>
</P>

<P>
The Challenge Phase was particularly uneventful. Presuming from the lateness 
of <B>qubits's</B> submission that it was incorrect, <B>venco</B> unsuccessfully challenged 
it with a timeout case at the 13-second mark. Nothing else happened for the 
remainder of the contest. 
</P>

<P>
The System Test Phase was even more uneventful. Not a single solution failed. 
The winners in Room One in this match earned their place solely through raw coding prowess. 
</P>

<P>
The final scores were thus: 
<UL>
   <LI>dmwright - 1398.27</LI> 
   <LI>NDBronson - 1375.02</LI> 
   <LI>venco - 1258.89</LI> 
   <LI>qubits - 1116.76</LI> 
   <LI>ambrose - 745.33</LI> 
   <LI>ZorbaTHut - 717.83</LI> 
   <LI>kv - 676.63</LI> 
   <LI>John Dethridge - 642.33</LI> 
   <LI>evd - 596.73</LI>
</UL>
</P>

<P>
<B>Room One Log</B>
</P>

<P>
 9:00:02 PM - ZorbaTHut opens the Level One problem<BR/>
 9:00:03 PM - venco opens the Level One problem<BR/>
 9:00:05 PM - dmwright opens the Level Two problem<BR/>
 9:00:06 PM - kv opens the Level One problem<BR/>
 9:00:07 PM - qubits opens the Level One problem<BR/>
 9:00:40 PM - NDBronson opens the Level One problem<BR/>
 9:00:44 PM - John Dethridge opens the Level One problem<BR/>
 9:02:54 PM - ambrose opens the Level One problem<BR/>
 9:05:31 PM - evd opens the Level One problem<BR/>
 9:06:04 PM - ZorbaTHut submits the Level One problem for 239.34 points<BR/>
 9:06:12 PM - ZorbaTHut opens the Level Two problem<BR/>
 9:07:18 PM - NDBronson submits the Level One problem for 237.26 points<BR/>
 9:08:02 PM - John Dethridge submits the Level One problem for 234.82 points<BR/>
 9:08:27 PM - John Dethridge opens the Level Two problem<BR/>
 9:08:36 PM - qubits submits the Level One problem for 230.09 points<BR/>
 9:08:44 PM - qubits opens the Level Two problem<BR/>
 9:09:33 PM - NDBronson opens the Level Two problem<BR/>
 9:09:40 PM - venco submits the Level One problem for 225.26 points<BR/>
 9:09:58 PM - venco opens the Level Two problem<BR/>
 9:10:47 PM - kv submits the Level One problem for 220.51 points<BR/>
 9:10:55 PM - ambrose submits the Level One problem for 232.09 points<BR/>
 9:11:12 PM - kv opens the Level Two problem<BR/>
 9:14:39 PM - evd submits the Level One problem for 227.38 points<BR/>
 9:14:55 PM - evd opens the Level Two problem<BR/>
 9:15:46 PM - dmwright submits the Level Two problem for 511.44 points<BR/>
 9:16:05 PM - dmwright opens the Level Three problem<BR/>
 9:18:29 PM - ambrose opens the Level Two problem<BR/>
 9:24:39 PM - ZorbaTHut submits the Level Two problem for 478.49 points<BR/>
 9:24:47 PM - ZorbaTHut opens the Level Three problem<BR/>
 9:24:54 PM - NDBronson submits the Level Two problem for 515.76 points<BR/>
 9:26:18 PM - NDBronson opens the Level Three problem<BR/>
 9:31:39 PM - kv submits the Level Two problem for 456.12 points<BR/>
 9:31:57 PM - venco submits the Level Two problem for 439.63 points<BR/>
 9:32:15 PM - kv opens the Level Three problem<BR/>
 9:32:28 PM - venco opens the Level Three problem<BR/>
 9:33:17 PM - qubits submits the Level Two problem for 414.58 points<BR/>
 9:33:23 PM - qubits opens the Level Three problem<BR/>
 9:33:47 PM - John Dethridge submits the Level Two problem for 407.51 points<BR/>
 9:34:02 PM - ambrose submits the Level Two problem for 513.24 points<BR/>
 9:34:16 PM - John Dethridge opens the Level Three problem<BR/>
 9:34:48 PM - ambrose opens the Level Three problem<BR/>
 9:39:48 PM - dmwright submits the Level Three problem for 649.78 points<BR/>
 9:40:14 PM - dmwright opens the Level One problem<BR/>
 9:45:01 PM - evd submits the Level Two problem for 369.35 points<BR/>
 9:45:15 PM - evd opens the Level Three problem<BR/>
 9:46:57 PM - dmwright submits the Level One problem for 237.05 points<BR/>
 9:52:00 PM - NDBronson submits the Level Three problem for 622.00 points<BR/>
 9:56:36 PM - venco submits the Level Three problem for 644.00 points<BR/>
10:14:56 PM - qubits submits the Level Three problem for 472.09 points<BR/>
10:20:13 PM - venco challenges qubits on the Level Three problem unsuccessfully<BR/> 
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

