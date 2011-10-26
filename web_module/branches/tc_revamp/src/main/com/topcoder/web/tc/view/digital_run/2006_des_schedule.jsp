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
 | Schedule
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_prizes">Prizes</A>
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_roty">Rookie of the Year</A>
 | <A class="bcLink" href="/tc?module=Static&d1=digital_run&d2=2006_des_rules">Rules</A><br>
<A class="bcLink" href="/tc?&ph=112&module=LeaderBoard">Current leaderboard</A> | 
<A class="bcLink" href="/tc?module=RookieBoard&ph=112">Current ROTY leaderboard</A>
</div>
<span class="title">Schedule</span>
<br><br>
Includes components posted within the following date range, inclusive:
<br><br>
<strong>Stage #1:</strong> May 11, 2006 - August 3, 2006<br>
<strong>Stage #2:</strong> August 4, 2006 - November 2, 2006<br>
<strong>Stage #3:</strong> November 3, 2006 - February 1, 2007<br>
<strong>Stage #4:</strong> February 2, 2007 - May 3, 2007
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