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
<A href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=3&nr=50&sr=1">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=112">Current ROTY leaderboard</A>
</td>
<td align="left" style="padding-left:10px;">
<span class="subtitle">Development Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_dev_overview">Details</A><br>
<A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=3&nr=50&sr=">Current leaderboard</A><br>
<A href="/tc?module=RookieBoard&ph=113">Current ROTY leaderboard</A>
</td>
</tr>
</table>
</div>
<br><br>
<span class="subtitle">Announcing the Digital Run: Stage 3 Winners</span><br>
Stage 3 of the Digital Run concluded on February 1, 2007. Here are the winners: 
<br><br>
<strong>Design Cup:</strong><br>
With a dozen more designers joining the fray in Stage 3, a total of 75 competitors earned a combined 72,980 placement points. Thanks to a four-way tie for 37th place, 40 designers wound up finishing in the top half and claiming part of the $150,000 prize pool. After a record-setting finish in Stage 2, <tc-webtag:handle coderId="287614" context="design"/> again claimed the top spot in Stage 3 with another commanding performance. With 11,015 points, <tc-webtag:handle coderId="287614" context="design"/> again claimed more than 15% of all the total points available during the stage and eclipsed his own record of 10,570 points. He also set the new record for winnings, netting total prizes of more than $50,000. 
<br><br>
Check out the final <A href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=3&nr=50&sr=1">Design Cup: Stage 3 leaderboard</A>.
<br><br>
<strong>Development Cup:</strong><br>
In Stage 3, 146 developers earned a total of 75,400 in placement points. Seventy-four of them ended up in the money, sharing $37,500 in total prizes. <tc-webtag:handle coderId="14926554" context="development"/> wound up in first place with a very strong 8,915 points, almost doubling <tc-webtag:handle coderId="10526732" context="development"/>'s previous record of 4,980 points from Stage 2. <tc-webtag:handle coderId="14926554" context="development"/> set a new record for earnings as well, with total prizes of $14,299. <tc-webtag:handle coderId="14926554" context="development"/>'s victory capped another strong stage for Chinese coders, with 8 of the 10 top spots going to developers from China.
<br><br>
Check out the final <A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=3&nr=50&sr=">Development Cup: Stage 3 leaderboard</A>.
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