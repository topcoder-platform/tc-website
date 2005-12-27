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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm94_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm94_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505512" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm94" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
     <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm95_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 94</span><br>June 3, 2002
<br /><br />

<span class="bigTitle">Room 1 Review</span>
<br/>

<p>Room 1 started out with <B>SnapDragon</B>, <B>derkuci</B>, <B>DjinnKahn</B>, <B>kv</B>, <B>evd</B>, <B>ZorbaTHut</B>, and <B>bigg_nate</B> opening the
level 1 problem, <B>dmwright</B> going for his usual level 2 start, and <B>John Dethridge</B>, starting 4 minutes later, opening the level 1. <B>SnapDragon</B> Submitted
the level one problem just 6 minutes and 18 seconds after opening it, the
fastest in the division, for 333.78 points, and moved on to the level 2. <B>evd</B>
was the next to submit, gaining 314.42 points for 9 minutes of coding, but <B>John Dethridge</B> 
came in next, and since he started 4 minutes into the competition, he
gains 322.28 points. <B>SnapDragon</B> again was the first to submit the Level two for
397.04 points -- having both his level 1 AND 2 complete before <B>dmwright</B>
finishes the level 2. Finally, <B>dmwright</B> submits, just 3 minutes later, for
333.40 points. For the level three, <B>SnapDragon</B> submits just over 35 minutes
into the competition, giving him a division high of 1514.88 points, over 200
points above anyone else in division 1 going into the challenge phase. The next
room 1 finisher was <B>bigg_nate</B>, who finished over an hour after opening his
first problem. Before the challenge, the points looked like this:</p>

<table border="0" cellpadding="0" cellspacing="2" bgcolor="#ffffff" width="100%">
 <tr>
  <td class="bodyText">
  <b>handle </b>
  </td>
  <td class="bodyText">
  <b>Level 1 </b>
  </td>
  <td class="bodyText">
  <b>Level 2 </b>
  </td>
  <td class="bodyText">
  <b>Level 3 </b>
  </td>
  <td class="bodyText">
  <b>Total</b>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>SnapDragon</B></p>
  </td>
  <td class="bodyText">
  <p>333.78</p>
  </td>
  <td class="bodyText">
  <p>397.04</p>
  </td>
  <td class="bodyText">
  <p>784.06</p>
  </td>
  <td class="bodyText">
  <p>1514.88</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>bigg_nate</B></p>
  </td>
  <td class="bodyText">
  <p>278.77</p>
  </td>
  <td class="bodyText">
  <p>311.33</p>
  </td>
  <td class="bodyText">
  <p>650.77</p>
  </td>
  <td class="bodyText">
  <p>1240.87</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>dmwright</B></p>
  </td>
  <td class="bodyText">
  <p>301.57</p>
  </td>
  <td class="bodyText">
  <p>333.40</p>
  </td>
  <td class="bodyText">
  <p>548.38</p>
  </td>
  <td class="bodyText">
  <p>1183.35</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>evd</B></p>
  </td>
  <td class="bodyText">
  <p>314.42</p>
  </td>
  <td class="bodyText">
  <p>362.48</p>
  </td>
  <td class="bodyText">
  <p>492.24</p>
  </td>
  <td class="bodyText">
  <p>1169.14</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>ZorbaTHut</B></p>
  </td>
  <td class="bodyText">
  <p>252.26</p>
  </td>
  <td class="bodyText">
  <p>378.43</p>
  </td>
  <td class="bodyText">
  <p>509.34</p>
  </td>
  <td class="bodyText">
  <p>1140.03</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>kv</B></p>
  </td>
  <td class="bodyText">
  <p>252.50</p>
  </td>
  <td class="bodyText">
  <p>347.23</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>599.73</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>derkuci</B></p>
  </td>
  <td class="bodyText">
  <p>271.95</p>
  </td>
  <td class="bodyText">
  <p>279.90</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>551.85</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>DjinnKahn</B></p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>367.09</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>367.09</p>
  </td>
 </tr>
 <tr>
  <td class="bodyText">
  <p><B>John Dethridge</B></p>
  </td>
  <td class="bodyText">
  <p>322.28</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>none</p>
  </td>
  <td class="bodyText">
  <p>322.28</p>
  </td>
 </tr>
</table>

<p>
The challenge phase brought two challenges. One from <B>derkuci</B> trying for a
timeout on <B>ZorbaTHut</B>'s Counter solution, and one from <B>kv</B> on <B>bigg_nate</B>'s
SquareFind solution, submitting a parallelogram that was not square. Neither
challenge succeeded.<br/>
<br/>
In the testing phase, one solution of each problem failed. <B>evd</B>'s level 3 failed
with a timeout, dropping him below <B>ZorbaTHut</B>. <B>kv</B>'s SquareFind failed due to his
assumption that the input array would always have at least 4 elements in it.
Finally, in <B>DjinnKahn</B>'s NumberFill solution, he forgot to check for the case
that an area had no numbers in it.<br/>
<br/>
<B>SnapDragon</B> takes the win with 1514.88 points, giving him 92 rating points for
his highest ever 3005 rating, and making him the number 1 rated coder at
TopCoder, moving past both NDBronson and reid. For second place, <B>bigg_nate</B> gets
92 rating points. <B>ZorbaTHut</B> gains 39 points, but it's not enough to stop
<B>dmwright</B>'s 55-point gain from knocking him out of 4th place, just 11 points
ahead. <B>DjinnKahn</B> loses 177 rating points, and <B>John Dethridge</B> loses 100 rating
points.<br/>
<br/>
Here is the room 1 log:<br/>
9:00:03 PM - <B>SnapDragon</B> opens the Level One problem <br/>
9:00:07 PM - <B>derkuci</B> opens the Level One problem <br/>
9:00:10 PM - <B>DjinnKahn</B> opens the Level One problem <br/>
9:00:41 PM - <B>kv</B> opens the Level One problem <br/>
9:00:46 PM - <B>evd</B> opens the Level One problem <br/>
9:00:51 PM - <B>ZorbaTHut</B> opens the Level One problem <br/>
9:01:35 PM - <B>bigg_nate</B> opens the Level One problem <br/>
9:02:12 PM - <B>dmwright</B> opens the Level Two problem <br/>
9:03:51 PM - <B>John Dethridge</B> opens the Level One problem <br/>
9:06:22 PM - <B>SnapDragon</B> submits the Level One problem for 333.78 points <br/>
9:06:29 PM - <B>SnapDragon</B> opens the Level Two problem <br/>
9:10:32 PM - <B>evd</B> submits the Level One problem for 314.42 points <br/>
9:10:41 PM - <B>evd</B> opens the Level Two problem <br/>
9:12:19 PM - <B>John Dethridge</B> submits the Level One problem for 322.28 points <br/>
9:14:07 PM - <B>John Dethridge</B> opens the Level Three problem <br/>
9:16:20 PM - <B>derkuci</B> submits the Level One problem for 271.95 points <br/>
9:16:46 PM - <B>bigg_nate</B> submits the Level One problem for 278.77 points <br/>
9:17:03 PM - <B>bigg_nate</B> opens the Level Two problem <br/>
9:17:09 PM - <B>SnapDragon</B> submits the Level Two problem for 397.04 points <br/>
9:17:22 PM - <B>SnapDragon</B> opens the Level Three problem <br/>
9:17:33 PM - <B>derkuci</B> opens the Level Two problem <br/>
9:19:58 PM - <B>kv</B> submits the Level One problem for 252.50 points <br/>
9:20:07 PM - <B>kv</B> opens the Level Two problem <br/>
9:20:10 PM - <B>ZorbaTHut</B> submits the Level One problem for 252.26 points <br/>
9:20:17 PM - <B>ZorbaTHut</B> opens the Level Two problem <br/>
9:20:23 PM - <B>dmwright</B> submits the Level Two problem for 333.40 points <br/>
9:20:54 PM - <B>dmwright</B> opens the Level Three problem <br/>
9:25:24 PM - <B>evd</B> submits the Level Two problem for 362.48 points <br/>
9:25:35 PM - <B>evd</B> opens the Level Three problem <br/>
9:27:31 PM - <B>DjinnKahn</B> opens the Level Two problem <br/>
9:33:09 PM - <B>ZorbaTHut</B> submits the Level Two problem for 378.43 points <br/>
9:33:13 PM - <B>ZorbaTHut</B> opens the Level Three problem <br/>
9:35:14 PM - <B>SnapDragon</B> submits the Level Three problem for 784.06 points <br/>
9:36:37 PM - <B>kv</B> submits the Level Two problem for 347.23 points <br/>
9:36:48 PM - <B>kv</B> opens the Level Three problem <br/>
9:38:05 PM - <B>bigg_nate</B> submits the Level Two problem for 311.33 points <br/>
9:38:16 PM - <B>bigg_nate</B> opens the Level Three problem <br/>
9:41:42 PM - <B>DjinnKahn</B> submits the Level Two problem for 367.09 points <br/>
9:42:02 PM - <B>DjinnKahn</B> opens the Level Three problem <br/>
9:43:15 PM - <B>derkuci</B> submits the Level Two problem for 279.90 points <br/>
9:44:16 PM - <B>derkuci</B> opens the Level Three problem <br/>
9:55:40 PM - <B>dmwright</B> submits the Level Three problem for 548.38 points <br/>
9:55:48 PM - <B>dmwright</B> opens the Level One problem <br/>
10:04:08 PM - <B>bigg_nate</B> submits the Level Three problem for 650.77 points <br/>
10:07:34 PM - <B>dmwright</B> submits the Level One problem for 301.57 points <br/>
10:07:40 PM - <B>evd</B> submits the Level Three problem for 492.24 points <br/>
10:12:46 PM - <B>ZorbaTHut</B> submits the Level Three problem for 509.34 points <br/>
10:15:35 PM - <B>John Dethridge</B> opens the Level Two problem <br/>
10:26:27 PM - <B>kv</B> challenges <B>bigg_nate</B> on the Level One problem Unsuccessfully <br/>
10:32:34 PM - <B>derkuci</B> challenges <B>ZorbaTHut</B> on the Level Three problem
Unsuccessfully</p>


<p>
<img src="/i/m/schveiguy_mug.gif" alt="" width="55" height="61" border="0" hspace="6" vspace="1" align="left" class="myStatsPhoto"/><br />
By&#160;<tc-webtag:handle coderId="273217" context="algorithm"/><br />
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
