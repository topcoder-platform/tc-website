<%@  page language="java"  %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder - The Digital Run</title>

<jsp:include page="../../script.jsp" />
<jsp:include page="../../style.jsp">
  <jsp:param name="key" value="tc_stats"/>
</jsp:include>
<jsp:include page="../../script.jsp" />
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
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value="digital_run"/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
<td width="100%" align="center" class="bodyColumn">

<div class="fixedWidthBody">
<div align="center" style="margin-bottom: 20px;">
<A href="/tc?module=Static&d1=digital_run&d2=2008&d3=description"><img src="/i/digital_run/2008SeasonLogo.png" alt="Digital Run" style="border-bottom: 1px solid #999999;"/></A>
</div>

<div align="center" style="margin-bottom: 10px;">

<form action="dummyvalue">
<select name="newurl" onchange="menu_goto(this.form)">
  <option value="/tc?module=Static&d1=digital_run&d2=2006description">2007 Season</option>
  <option value="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=description" selected="selected">2007.5 Season</option>
  <option value="/tc?module=Static&d1=digital_run&d2=2008&d3=description" selected="selected">2008 Season</option>
</select>
</form>

<table cellpadding="0" cellspacing="0" border="0" class="bodyText" style="margin-bottom: 10px;">
<tr>
<td align="left" style="padding-right:10px; border-right: 1px solid #999999;" valign="top">
<span class="subtitle">Design Cup</span><br />
<A href="/tc?module=Static&d1=digital_run&d2=2008&d3=desOverview" class="bcLink">Details</A><br />
<%--
<span class="grayedOut">Current Leaderboard</span>
--%>
<A href="/tc?&pt=1&module=LeaderBoard" class="bcLink">Current Leaderboard</A>
<br />
</td>
<td align="left" style="padding: 0 10px; border-right: 1px solid #999999;" valign="top">
<span class="subtitle" class="bcLink">Development Cup</span><br />
<A href="/tc?module=Static&d1=digital_run&d2=2008&d3=devOverview" class="bcLink">Details</A><br />
<%--
<span class="grayedOut">Current Leaderboard</span>
--%>
<A href="/tc?&pt=2&module=LeaderBoard" class="bcLink">Current Leaderboard</A>
<br />
</td>
<td align="left" style="padding-left:10px;" valign="top">
<span class="subtitle" class="bcLink">Assembly Cup</span><br />
<A href="/tc?module=Static&d1=digital_run&d2=2008&d3=asmOverview" class="bcLink">Details</A><br />
<A href="/tc?&pt=14&module=LeaderBoard" class="bcLink">Current Leaderboard</A>
<br />


</td>
</tr>
</table>

<%--
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=stage1Winners" class="bcLink">Stage 1 Winners</A><br />
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=stage2Winners" class="bcLink">Stage 2 Winners</A><br />
<A href="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=stage3Winners" class="bcLink">Stage 3 Winners</A>
--%>

</div>

The Digital Run is back for the 2008 season!
<br /><br />
<span class="subtitle">How to compete</span><br />
If you're an active competitor in Design, Development or Assembly competitions, you are already competing in the Digital Run. Easy, right?
<br /><br />
<span class="subtitle">How to win</span><br />
Each component or Assembly contest posted for a competition will carry placement points. Points will be awarded to competitors based on the number of submissions that pass review. The members with the highest point totals at the end of each Stage win big.
<br /><br />

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