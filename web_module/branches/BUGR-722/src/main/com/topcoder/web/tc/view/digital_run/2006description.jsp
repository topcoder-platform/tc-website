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
<A href="/digitalrun"><img src="/i/digital_run/digital_run_logo.png" alt="Digital Run" style="border-bottom: 1px solid #999999;"/></A>
</div>

<div align="center">

<form action="dummyvalue">
<select name="newurl" onchange="menu_goto(this.form)">
  <option value="/tc?module=Static&d1=digital_run&d2=2006description" selected="selected">2007 Season</option>
  <option value="/tc?module=Static&d1=digital_run&d2=2007dot5&d3=description">2007.5 Season</option>
  <option value="/tc?module=Static&d1=digital_run&d2=2008&d3=description">2008 Season</option>
</select>
</form>

<table cellpadding="0" cellspacing="0" border="0" class="bodyText" style="margin-bottom: 10px;">
<tr>
<td align="left" style="padding-right:10px;border-right: 1px solid #999999;">
<span class="subtitle">Design Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_des_overview" class="bcLink">Details</A><br>
<A href="/tc?module=LeaderBoard&ph=112&staid=4" class="bcLink">Results</A><br>
<A href="/tc?module=RookieBoard&ph=112&seid=1" class="bcLink">ROTY results</A>
</td>
<td align="left" style="padding-left:10px;">
<span class="subtitle" class="bcLink">Development Cup Series</span><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006_dev_overview" class="bcLink">Details</A><br>
<A href="/tc?module=LeaderBoard&ph=113&staid=4" class="bcLink">Results</A><br>
<A href="/tc?module=RookieBoard&ph=113&seid=1" class="bcLink">ROTY results</A>
</td>
</tr>
</table>

<strong>
<A href="/tc?module=Static&d1=digital_run&d2=2006_stage1_winners" class="bcLink">Stage 1 Winners</A><br>
<A href="/tc?module=Static&d1=digital_run&d2=2006Stage2Winners" class="bcLink">Stage 2 Winners</A><br>
<A href="/tc?module=Static&d1=digital_run&d2=2007Stage3Winners" class="bcLink">Stage 3 Winners</A><br>
<A href="/tc?module=Static&d1=digital_run&d2=2007Stage4Winners" class="bcLink">Stage 4 &amp; Rookie of the Year Winners</A>
</strong>

</div>
<%--
<div align="center"><A href="/tc?module=Static&d1=digital_run&d2=2006_des_prizes"><img src="/i/digital_run/designPrizesDoubled.png" alt="Design Prizes Doubled!" border="0" /></A></div>
--%>
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
               <jsp:param name="level1" value="default"/>
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