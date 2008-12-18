<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ page import="com.topcoder.shared.util.ApplicationServer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>

<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<SCRIPT LANGUAGE="JavaScript" SRC="/js/print.js"></SCRIPT>
</head>
<body>
<div id="onTop">
<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>
</div>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<!-- Left Column Begins-->
        <td width="180" id="onLeft">	<jsp:include page="/includes/global_left.jsp">
		<jsp:param name="node" value="algo_match_editorials"/>
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
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_room1" CLASS="bodyText">&#160;&#160;Room 1 Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A href="/tc?module=Static&d1=match_editorials&d2=archive" CLASS="bodyText">Archive</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_rookie" CLASS="bodyText">&#160;&#160;Rookie Review</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><tc-webtag:forumLink forumID="505518" message="Discuss this match" /></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101" CLASS="bodyText">&#160;&#160;Problem Set</A></TD>
         <TD VALIGN="top" CLASS="bodyText"><A HREF="mailto:editorial@topcoder.com" CLASS="bodyText">Want to write a feature?</A></TD>
      </TR>
      <TR>
         <TD VALIGN="top" CLASS="bodyText" colspan="2"><A HREF="/tc?module=Static&d1=match_editorials&d2=srm101_lessons" CLASS="bodyText">&#160;&#160;Lessons Learned</A></TD>
      </TR>
      <TR><TD VALIGN="top" COLSPAN="4" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="5" BORDER="0"/></TD></TR>          
      </TABLE>
      </TD>
   </TR>
    <TR><TD COLSPAN="2" VALIGN="top" BGCOLOR="#FFFFFF" CLASS="smallText"><IMG SRC="/i/clear.gif" WIDTH="1" HEIGHT="10" BORDER="0"/></TD></TR>                
</TABLE>

<span class="bodySubtitle">SRM 101</span><br>June 26, 2002
<br/><br/>

<span class="bigTitle">Rookie Review</span><br/><br/>

<b>Coding Phase</b>
<p>
            Only 20 rookies participated in SRM 101, distributed across three rooms.
            Of these 20, only six managed to submit solutions to all three problems.
        </p>
<p>
        At the end of the Coding Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <b>Simon90210</b>
                    - 1260.33</li>
    <li>
      <b>JHui</b>
                    - 1134.95</li>
    <li>
      <b>mgm</b>
                    - 1069.50</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <b>Merlin[Kyiv]</b>
                    - 1111.61</li>
    <li>
      <b>kirbyzhou</b>
                    - 1106.75</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <b>jeffbadge</b>
                    - 1139.51</li>
  </ol>
</ul>
<b>Challenge Phase</b>
<p>
            Only one challenge occurred in Room 60.
            <b>JHui</b>, then in second place, challenged the leader at the time, <b>Simon90210</b>.
            His challenge of <b>Simon90210</b>'s Level 3 submission was unsuccessful, losing <b>JHui</b>
            50 points, but this did not change the relative rankings in Room 60 at all.
        </p>
<p>
            Room 61 saw a slightly more active Challenge Phase, with a total of three challenges occurring.
            Unfortunately, none of these challenges were successful.  <b>ishan_ritchie</b> was responsible
            for the first two challenges, first against <b>Merlin[Kyiv]</b>'s Level 3 submission and then
            against <b>skywalker</b>'s Level 1 submission.  <b>skywalker</b> submitted the third challenge,
            against <b>kirbyzhou</b>'s Level 3 submission.
        </p>
<p>
            There were a total of four challenges in Room 62.
            The first challenge was the only successful rookie challenge of the match.  This came from
            <b>cristi</b> against <b>jeffbadge</b>'s Level 3 submission.  About six minutes
            later, <b>mleveck</b> challenged <b>jeffbadge</b> and <b>d_sher</b>'s
            Level 1 submissions, but both challenges failed.  <b>d_sher</b> also tried a crack at
            <b>jeffbadge</b>'s Level 1 submission during the last minute of the Challenge Phase, but failed as well.
        </p>
<p>
        At the end of the Challenge Phase, the scores were:
    </p>
<ul>
            Room 60:
            <ol>
    <li>
      <b>Simon90210</b>
                    - 1260.33</li>
    <li>
      <b>JHui</b>
                    - 1084.95</li>
    <li>
      <b>mgm</b>
                    - 1069.50</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <b>Merlin[Kyiv]</b>
                    - 1111.61</li>
    <li>
      <b>kirbyzhou</b>
                    - 1106.75</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <b>cristi</b>
                    - 606.50</li>
    <li>
      <b>jeffbadge</b>
                    - 461.76</li>
  </ol>
</ul>
<b>System Test Phase</b>
<p>
            No rookie managed to get all three problems correct.
            Since only one submission was shown to be wrong in the Challenge Phase, there were many solutions invalidated
            by the system tests.
        </p>
<p>
            <b>Simon90210</b> was hit the hardest by the system tests.  Despite initially leading across all rookie
            rooms with over 1200 points, <b>Simon90210</b> lost credit for all three of his problems due to the system tests.
            This left the lead to <b>JHui</b> and <b>mgm</b>, each of which lost his Level 3 solution to the
            system tests.  <b>JHui</b> also lost his Level 1 submission, but <b>mgm</b> lost his Level 2 solution,
            leaving <b>JHui</b> ahead of <b>mgm</b>.
        </p>
<p>
            <b>Merlin[Kyiv]</b> was the only rookie to get the Level 3 problem right, losing only his Level 2 submission
            to the system tests.  <b>kirbyzhou</b> lost both his Level 2 and Level 3 problems, as well as the majority of his points.
        </p>
<p>
            Only two coders lost points in Room 62.  <b>d_sher</b>'s Level 2 submission failed, and <b>mleveck</b>'s
            Level 1 submission failed.  Since <b>mleveck</b> had two unsuccessful challenges during the Challenge Phase, this
            left him with a very unfortunate score of -100 points.
        </p>
<b>Final Results</b>
<ul>
            Room 60:
            <ol>
    <li>
      <b>JHui</b>
                    - 346.79</li>
    <li>
      <b>mgm</b>
                    - 211.34</li>
    <li>
      <b>denny</b>
                    - 195.54</li>
  </ol>
            Room 61:
            <ol>
    <li>
      <b>Merlin[Kyiv]</b>
                    - 666.30</li>
    <li>
      <b>ishan_ritchie</b>
                    - 531.16</li>
    <li>
      <b>skywalker</b>
                    - 428.64</li>
    <li>
      <b>kirbyzhou</b>
                    - 221.91</li>
    <li>
      <b>mickle</b>
                    - 206.47</li>
  </ol>
            Room 62:
            <ol>
    <li>
      <b>cristi</b>
                    - 606.50</li>
    <li>
      <b>jeffbadge</b>
                    - 461.76</li>
    <li>
      <b>d_sher</b>
                    - 122.10</li>
  </ol>
</ul>
<p>
                    All rookies that scored greater than zero points are listed above.  It is clear that Room 61 had the strongest performance,
                    with five out of the six coders that submitted problems getting positive scores, three of which were in the top five rookie
                    scores.  <b>Merlin[Kyiv]</b> is the winner with 666.30 points, mostly due to his correct submission of the Level 3 problem.
                    Nearly half of the rookies this match ended up with a score of zero or worse.
                </p>


<div class="authorPhoto">
    <img src="/i/m/Logan_mug.gif" alt="Author" />
</div>
<div class="authorText">
By&#160;<tc-webtag:handle coderId="112902" context="algorithm"/><br />
    <em>TopCoder Member</em>
</div>


</div>
</td>

<!-- Center Column Ends -->

<!-- Right Column Begins -->
         <td width="170" id="onRight">
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

<div id="onBottom">
<jsp:include page="../foot.jsp" />
</div>

</body>

</html>

