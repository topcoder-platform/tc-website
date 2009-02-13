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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm96_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm96_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505514" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm96" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
    <!-- <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm97_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>-->
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 96</span><br>June 11, 2002
<br /><br />

<span class="bigTitle">Rookie Review</span>
<br/>
<b>Coding Phase</b>
<p>
            The rookies in this match put in a relatively strong performance.
        </p>
<p>
            In Rooms 63 and 66 each, four rookies submitted solutions for all three problems.
            Rooms 64 and 65 were each initially dominated by a single coder.
            And in Room 67 an impressive five rookies submitted solutions to all the problems.
            With 15 rookies submitting all three problems, the odds were very good that at least
            one of these rookies would get them all right.  The winner of the rookie rooms this
            match would surely be one of the following coders.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ul>
            Room 63:
            <ol>
    <li>
      <B>skelter</B>
                    - 1433.92</li>
    <li>
      <B>LunaticFringe</B>
                    - 1382.06</li>
    <li>
      <B>Number3</B>
                    - 1227.96</li>
    <li>
      <B>johnnyoh</B>
                    - 1037.69</li>
  </ol>
            Room 64:
            <ol>
    <li>
      <B>legakis</B>
                    - 1515.66</li>
  </ol>
            Room 65:
            <ol>
    <li>
      <B>merolish</B>
                    - 1141.55</li>
  </ol>
            Room 66:
            <ol>
    <li>
      <B>Oblok</B>
                    - 1440.51</li>
    <li>
      <B>tjq</B>
                    - 1268.16</li>
    <li>
      <B>whobot</B>
                    - 1184.75</li>
    <li>
      <B>lopman</B>
                    - 1136.72</li>
  </ol>
            Room 67:
            <ol>
    <li>
      <B>RobertLu</B>
                    - 1455.16</li>
    <li>
      <B>Wronkyn</B>
                    - 1416.29</li>
    <li>
      <B>tidus</B>
                    - 1296.25</li>
    <li>
      <B>reyes</B>
                    - 1286.05</li>
    <li>
      <B>dr_dad</B>
                    - 1258.94</li>
  </ol>
</ul>
<b>Challenge Phase</b>
<p>
            <B>LunaticFringe</B> knocked <B>skelter</B> out of the running with a challenge
            against <B>skelter</B>'s Level 3 submission, with a test case straight out of the examples section
            of the problem description.  <B>LunaticFringe</B> squandered this 50 point bonus, however, by fruitlessly
            challenging <B>johnnyoh</B>'s Level 3 submission with the same test case.
        </p>
<p>
            In Room 66, <B>Oblok</B> lost 50 points by unsuccessfully challenging <B>tjq</B>'s Level 3 submission.
            <B>Oblok</B> then regained these 50 points by successfully challenging <B>JadeMonkey</B>'s Level 1 submission,
            which failed to place an upper bound on the number of times the reverse-addition process is repeated.
            <B>tjq</B> lost 50 points with an unsuccessful challenge of <B>vfaller</B>'s Level 1 submission.
            <B>lopman</B> also lost 50 points, unsuccessfully challenging <B>whobot</B>'s Level 1 submission.
        </p>
<p>
            In Room 67, <B>RobertLu</B> lost 50 points by unsuccessfully challenging <B>reyes</B>'s Level 2 submission.
            He then earned those points back by successfully challenging <B>dr_dad</B>'s Level 2 submission, effectively knocking
            <B>dr_dad</B> out of the running.
        </p>
<p>
            In the end, the Challenge Result did not shake things up very much.  A couple of coders dropped out of the running, and one lost
            50 points, but other than that the rankings did not change much.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ul>
            Room 63:
            <ol>
    <li>
      <B>LunaticFringe</B>
                    - 1382.06</li>
    <li>
      <B>Number3</B>
                    - 1227.96</li>
    <li>
      <B>johnnyoh</B>
                    - 1037.69</li>
  </ol>
            Room 64:
            <ol>
    <li>
      <B>legakis</B>
                    - 1515.66</li>
  </ol>
            Room 65:
            <ol>
    <li>
      <B>merolish</B>
                    - 1141.55</li>
  </ol>
            Room 66:
            <ol>
    <li>
      <B>Oblok</B>
                    - 1440.51</li>
    <li>
      <B>tjq</B>
                    - 1218.16</li>
    <li>
      <B>whobot</B>
                    - 1184.75</li>
    <li>
      <B>lopman</B>
                    - 1086.72</li>
  </ol>
            Room 67:
            <ol>
    <li>
      <B>RobertLu</B>
                    - 1455.16</li>
    <li>
      <B>Wronkyn</B>
                    - 1416.29</li>
    <li>
      <B>tidus</B>
                    - 1296.25</li>
    <li>
      <B>reyes</B>
                    - 1286.05</li>
  </ol>
</ul>
<b>System Test Phase</b>
<p>
            In Room 63, <B>johnnyoh</B> suffered most from the system tests, losing his Level 2 and Level 3 submissions.
            The other leaders in Room 63 were untouched.
        </p>
<p>
            In Room 65, <B>merolish</B> lost his Level 3 submission.  His points earned from the Level 1 and Level 2 problems
            were sufficient to hold on to the lead in Room 65, but gave him no hope of winning across all the rookie rooms.
        </p>
<p>
            In Room 66, <B>lopman</B> and <B>whobot</B> were victims.  <B>lopman</B> lost Level 2 and Level 3
            submissions, while <B>whobot</B> only lost his Level 2 submission.
        </p>
<p>
            <B>RobertLu</B> lost his lead of Room 67 by failing on his Level 2 submission.
            Also to lose points was <B>tidus</B>, whose Level 3 submission failed to pass the tests.
        </p>
<b>Final Results</b>
<ul>
            Room 63:
            <ol>
    <li>
      <B>LunaticFringe</B>
                    - 1382.06</li>
    <li>
      <B>Number3</B>
                    - 1227.96</li>
  </ol>
            Room 64:
            <ol>
    <li>
      <B>legakis</B>
                    - 1515.66</li>
  </ol>
            Room 66:
            <ol>
    <li>
      <B>Oblok</B>
                    - 1440.51</li>
    <li>
      <B>tjq</B>
                    - 1218.16</li>
  </ol>
            Room 67:
            <ol>
    <li>
      <B>Wronkyn</B>
                    - 1416.29</li>
    <li>
      <B>reyes</B>
                    - 1286.05</li>
  </ol>
</ul>
<p>
                    The leaders shown above each turned in very impressive performances in SRM 98.
                    Such a high number of high scores are rarely seen, as not many rookies can complete
                    the entire problem set.  None could match <B>legakis</B>'s excellent performance,
                    finishing with 1515.66 points, all earned during the Coding Phase.  This was the third highest
                    score in all of Division 2.  Congratulations to <B>legakis</B>, as well as
                    <B>LunaticFringe</B>, <B>Oblok</B>, and <B>Wronkyn</B>, who each
                    obtained yellow ratings after their first night of competition.
                </p>

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
