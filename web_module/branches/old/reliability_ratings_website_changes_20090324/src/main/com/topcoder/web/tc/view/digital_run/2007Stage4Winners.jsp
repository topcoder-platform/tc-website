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
<A href="/tc?&ph=112&module=LeaderBoard&staid=4">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=112&seid=1">Current ROTY leaderboard</A>
</td>
<td align="left" style="padding-left:10px;">
<span class="subtitle">Development Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_dev_overview">Details</A><br>
<A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=4&nr=50&sr=">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=113&seid=1">Current ROTY leaderboard</A>
</td>
</tr>
</table>
</div>
<br><br>
<span class="subtitle">Announcing the Digital Run: Stage 4 Winners</span><br>
Stage 4 of the 2006-7 Digital Run season concluded on May 3, 2007. Here are the winners:
<br><br>
<strong>Design Cup:</strong><br>
A total of 83 competitors earned a combined 78,500.00 placement points. Forty-two designers wound up in the top half and claimed part of the $150,000 prize pool. For the third stage in a row, <tc-webtag:handle coderId="287614" context="algorithm"/> again claimed the top spot in Stage 4 with another strong performance, earing 9,015 points.
<br><br>
Check out the final <A href="/tc?&ph=112&module=LeaderBoard&staid=4">Design Cup: Stage 4 leaderboard</A>.
<br><br>
With the end of Stage 4, the 2007 Design Cup Rookie of the Year competition was concluded as well. Congratulations to <tc-webtag:handle coderId="22651514" context="algorithm"/>, who racked up 11,135 placement points over the course of the year and secured the $10,000 Rookie of the Year prize.
<br><br>
Check out the final <A href="/tc?module=RookieBoard&ph=112&seid=1">Design Cup ROTY leaderboard</A>.
<br><br>
<strong>Development Cup:</strong><br>
In Stage 4, 168 developers (24 more than Stage 3) earned a total of 71,000 placement points. Eighty-four ended up in the money, sharing $37,500 in total prizes. <tc-webtag:handle coderId="14820574" context="algorithm"/> wound up in first place with 4,800 points, earning a total of $13,524.55 in DR prizes. <tc-webtag:handle coderId="14820574" context="algorithm"/>'s victory was the fourth Development Cup win by a Chinese coder and, as in stage 3, 8 of the 10 top spots on the Stage 4 leaderboard went to developers from China.
<br><br>
Check out the final <A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=4&nr=50&sr=">Development Cup: Stage 4 leaderboard</A>.
<br><br>
With the end of Stage 4, the 2007 Development Cup Rookie of the Year competition was wrapped up. Congratulations to <tc-webtag:handle coderId="21221008" context="development"/>, who piled up 8,785 points over the course of the year and took home the $7,500 Rookie of the Year prize.
<br><br>
Check out the final <A href="/tc?module=RookieBoard&ph=113&seid=1">Development Cup: ROTY leaderboard</A>.
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