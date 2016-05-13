<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="/script.jsp" />
<jsp:include page="/style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../script.jsp" />
<script language="javascript" type="text/javascript">
<!--
function menu_goto( menuform )
{
    selecteditem = menuform.newurl.selectedIndex ;
    newurl = menuform.newurl.options[ selecteditem ].value ;
    if (newurl.length != 0) {
      location.href = newurl ;
    }
}
//-->
</script>
</head>
<body>

<jsp:include page="../../top.jsp" >
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
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=description"><img src="/i/digital_run/2007dot5SeasonLogo.png" alt="Digital Run" style="border-bottom: 1px solid #999999;"/></A>
</div>

<div align="center" style="margin-bottom: 10px;">

<form action="dummyvalue">
<select name="newurl" onchange="menu_goto(this.form)">
  <option value="/tc?module=Static&d1=digital_run&d2=2006description">2007 Season</option>
  <option value="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=description" selected="selected">2007.5 Season</option>
</select>
</form>

<table cellpadding="0" cellspacing="0" border="0" class="bodyText" style="margin-bottom: 10px;">
<tr>
<td align="left" style="padding-right:10px; border-right: 1px solid #999999;" valign="top">
<span class="subtitle">Design Cup</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=desOverview" class="bcLink">Details</A><br>
<A href="/tc?&ph=112&module=LeaderBoard" class="bcLink">Current Leaderboard</A><br>
</td>
<td align="left" style="padding: 0 10px; border-right: 1px solid #999999;" valign="top">
<span class="subtitle" class="bcLink">Development Cup</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=devOverview" class="bcLink">Details</A><br>
<A href="/tc?&ph=113&module=LeaderBoard" class="bcLink">Current Leaderboard</A><br>
</td>
<td align="left" style="padding-left:10px;" valign="top">
<span class="subtitle" class="bcLink">Assembly Cup</span> <span class="bigRed">NEW!</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=asmOverview" class="bcLink">Details</A><br>
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=asmLeaderboardS2" class="bcLink">Current Leaderboard</A><br>

</td>
</tr>
</table>

<div align="left">
<br /><br />
<span class="subtitle">Announcing the Digital Run: Stage 1 Winners</span><br />
Stage 1 of the 2007.5 Digital Run season concluded on August 31, 2007. Here are the winners:
<br /><br />
<strong>Design Cup:</strong><br />
A total of 99 competitors earned over a combined 160,000 placement points - 81,500 points more than the 2007 Digital Run Stage 4. Fifty designers wound up in the top half and claimed part of the $300,000 prize pool. <tc-webtag:handle coderId="21926605" context="design"/> claimed the top spot in Stage 1 with 18,515 points.
<br /><br />
Check out the final <A href="/tc?module=LeaderBoard&ph=112&sc=&sd=&staid=5&nr=50&sr=">Design Cup: Stage 1 leaderboard</A>.
<br /><br />
<%--
With the end of Stage 4, the 2007 Design Cup Rookie of the Year competition was concluded as well. Congratulations to <tc-webtag:handle coderId="22651514" context="algorithm"/>, who racked up 11,135 placement points over the course of the year and secured the $10,000 Rookie of the Year prize.
<br /><br />
Check out the final <A href="/tc?module=RookieBoard&ph=112&seid=1">Design Cup ROTY leaderboard</A>.
<br /><br />
--%>
<strong>Development Cup:</strong><br />
In Stage 1, the top five developers earned a total of 24,606 placement points. One hundred thirteen ended up in the money, sharing $75,000 in total prizes. <tc-webtag:handle coderId="15046749" context="development"/> won first place with 7,975 points, earning a total of $18,036.17 in DR prizes. <tc-webtag:handle coderId="15046749" context="development"/>'s victory was the fifth Development Cup win by a Chinese coder insuring another top 10 finish for China in the Digital Run.
<br /><br />
Check out the final <A href="/tc?module=LeaderBoard&ph=113&sc=&sd=&staid=5&nr=50&sr=">Development Cup: Stage 1 leaderboard</A>.
<br /><br />
<%--
With the end of Stage 4, the 2007 Development Cup Rookie of the Year competition was wrapped up. Congratulations to <tc-webtag:handle coderId="21221008" context="development"/>, who piled up 8,785 points over the course of the year and took home the $7,500 Rookie of the Year prize.
<br /><br />
Check out the final <A href="/tc?module=RookieBoard&ph=113&seid=1">Development Cup: ROTY leaderboard</A>.
<br /><br />
--%>
<strong>Assembly Cup:</strong><br />
<tc-webtag:handle coderId="11790647" context="development"/> earned first place and claimed the $20,000 prize in TopCoder's inaugural Assembly Cup with 21,170 points. Those who got a piece of the $90,000 in prize money had a combined total of 91,335 points.
<br /><br />
Check out the final <A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=asmLeaderboardS1">Assembly Cup: Stage 1 leaderboard</A>.
<br /><br />
</div>

</div>

</td>
<%-- Center Column Ends --%>

<%-- Right Column Begins --%>
         <td width="170">
            <jsp:include page="../../public_right.jsp">
               <jsp:param name="level1" value="default"/>
            </jsp:include>
         </td>
<%-- Right Column Ends --%>

<%-- Gutter --%>
         <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
<%-- Gutter Ends --%>
    </tr>
</table>

<jsp:include page="../../foot.jsp" />

</body>

</html>