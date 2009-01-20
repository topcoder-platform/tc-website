<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_main"/>
</jsp:include>
<jsp:include page="../script.jsp" />
</head>
<body>

<jsp:include page="../top.jsp" >
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
   <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<div align="center" style="margin-bottom: 20px;">
<img src="/i/digital_run/digital_run_logo.png" alt="Digital Run" style="border-bottom: 1px solid #999999;"/>
</div>

<div align="center">
<table cellpadding="0" cellspacing="0" border="0" class="bodyText">
<tr>
<td align="left" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_des_overview">Details</A><br>
<A href="/tc?&ph=112&module=LeaderBoard">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=112">Current ROTY leaderboard</A>
</td>
<td align="left" style="padding-left:10px;">
<span class="subtitle">Development Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_dev_overview">Details</A><br>
<A href="/tc?&ph=113&module=LeaderBoard">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=113">Current ROTY leaderboard</A>
</td>
</tr>
</table>
</div>
<br><br>
<span class="subtitle">Announcing the Digital Run: Stage 2 winners</span><br>
Stage 2 of the Digital Run concluded on November 2, 2006. Here are the winners: 
<br><br>
<strong>Design Cup:</strong><br>
Over the course of Stage 2, 63 designers racked up a total of 69,000 placement points. Twenty-one finished in the top third, splitting the total prize pool of $75,000. After a respectable 14th-place finish in Stage 1, argolite emerged as the early leader in Stage 2 of the Digital Run's Design Cup -- and only opened up the lead from there. In Stage 1, aubergineanode set the bar for victory high with 7,060 points; argolite blew past this mark in Stage 2, earning a total of 10,570 points (that's more than 15% of all the points won, by all designers, in the stage) and total prizes of $30,335.
<br><br>
Read an <A href="/tc?module=Static&d1=features&d2=112806">interview with argolite</A>.
<br><br>
Check out the final <A href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=2&nr=50&sr=1">Design Cup: Stage 2 leaderboard</A>.
<br><br>
<strong>Development Cup:</strong><br>
More than twice the number of designers participated in Stage 2 of the Development Cup, with a total of 160 developers  racking up 67,555 in points. Thanks to the large number of participants, more than 50 developers finished in the top third for the stage, sharing $37,500 in total prizes. zjq wound up on top, taking first place for Stage 2 with 4,980 points and total prizes of $13,732.
<br><br>
Check out the final <A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=2&nr=50&sr=1">Development Cup: Stage 2 leaderboard</A>.
<br><br>
And remember: Design Cup <A href="/tc?module=Static&d1=digital_run&d2=2006_des_prizes">prizes for Stage 3 have been doubled</A>!
<br><br>
</div>
</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../public_right.jsp">
               <jsp:param name="level1" value="privatelabel"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../foot.jsp" />

</body>

</html>