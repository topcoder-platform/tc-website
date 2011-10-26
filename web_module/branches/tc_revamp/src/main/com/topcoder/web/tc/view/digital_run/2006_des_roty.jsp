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
<jsp:include page="/page_title.jsp" >
<jsp:param name="image" value="digital_run_20061031"/>
<jsp:param name="title" value="Design Cup Series"/>
</jsp:include>

<div style="float:right; text-align:right;">
<A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_overview">Overview</A>
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_schedule">Schedule</A>
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_prizes">Prizes</A>
 | Rookie of the Year
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_rules">Rules</A><br>
<A class="bcLink" href="/tc?&ph=112&module=LeaderBoard">Current leaderboard</A> | 
<A class="bcLink" href="/tc?module=RookieBoard&ph=112">Current ROTY leaderboard</A>
</div>
<span class="title">Rookie of the Year</span>
<br><br>
We will also recognize a TopCoder&#174; Rookie of the Year.  Placement Points will accumulate for Rookie of the Year in the <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_overview">same manner</A> as they do for all component competitions:
<br><br>
If a competitor has passed review in fewer than 6 design competitions as of May 11, 2006, the competitor will be considered eligible to be a design rookie for the 2007 TopCoder&#174; Design Cup Series.  If a competitor passes review on fewer than 6 design components during the 2007 TopCoder&#174; Design Cup Series, the next Series year will be that competitor's rookie year.  If a competitor passes review on 6 or more design components during the 2007 TopCoder&#174; Design Cup Series, it will count as the competitor's rookie year and the competitor will be eligible for TopCoder Rookie of the Year prizes. 
<br><br>
TopCoder Rookie of the Year prizes for design competitors total $30,000 and will be awarded as follows:
<br><br>
<strong>Rookie of the Year Prizes</strong><br>
<strong>1st</strong> - $10,000<br>
<strong>2nd</strong> - $7,500<br>
<strong>3rd</strong> - $5,000<br>
<strong>4th</strong> - $2,500<br>
<strong>5th</strong> - $1,500<br>
<strong>6th</strong> - $1,250<br>
<strong>7th</strong> - $750<br>
<strong>8th</strong> - $500<br>
<strong>9th</strong> - $500<br>
<strong>10th</strong> - $500
<br><br>
As an added prize, the top design rookie will win a trip to the TCO finals and will be recognized as the TopCoder Rookie of the Year.
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