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
<div align="center" style="margin-bottom: 10px;">
<img src="/i/digital_run/banner.gif" alt="The Digital Run" />
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
<div align="center"><A href="/tc?module=Static&d1=features&d2=082106"><img src="/i/digital_run/stage1_feature.gif" alt="Stage 1 Analysis" border="0" /></A></div>
<br>
The Digital Run marks another stride for TopCoder in recognizing talent through competition. The Digital Run will reward the top software designers and developers, giving them placement points based on their performance. Place well in a competition, you earn points. Accumulate lots of points over the course of a Stage (4 per year) or year, you win. It's that simple.
<br><br>
<span class="subtitle">How to compete</span><br>
If you're an active competitor in Software Design or Development, you are already competing in the Digital Run. Easy, right?
<br><br>
<span class="subtitle">How to win</span><br>
Each component posted for a competition will carry placement points. Points will be awarded to competitors based on the number of submissions that pass review. The members with the highest point totals at the end of each Stage win big.
<br><br>
<span class="subtitle">Rookie of the Year</span><br>
New competitors can also make a run for the Rookie of the Year title, given to the member with the best performance in his/her first year of competition.
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