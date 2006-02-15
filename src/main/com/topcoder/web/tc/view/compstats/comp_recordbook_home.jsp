<%@ page language="java"
         import="com.topcoder.shared.dataAccess.resultSet.*" %>

<%@ page import="java.util.Iterator" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder Statistics</title>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/style.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/coders.css"/>
<LINK REL="stylesheet" TYPE="text/css" HREF="/css/stats.css"/>
<link type="text/css" rel="stylesheet" href="/css/tcStyles.css"/>
</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">
        <!-- Left Column Begins-->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="development"/>
                <jsp:param name="level2" value="components"/>
            </jsp:include>
        </td>


        <!-- Left Column Ends -->

        <!-- Center Column Begins -->
        <TD CLASS="statTableSpacer" WIDTH="100%" VALIGN="top">
<jsp:include page="../page_title.jsp">
    <jsp:param name="image" value="statistics_w"/>
    <jsp:param name="title" value="Component Competition Record Book"/>
</jsp:include>

<div align="center">
Best Average Component Project Placement<br>
<A href="/tc?module=ComponentRecordbook&c=avg_placement&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=avg_placement&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=avg_placement&type=component">overall</A>

<br><br>

Highest Component Project Prize Earners<br>
<A href="/tc?module=ComponentRecordbook&c=component_money&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=component_money&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=component_money&type=component">overall</A>

<br><br>

Highest Component Project Scores<br>
<A href="/tc?module=ComponentRecordbook&c=high_scores&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=high_scores&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=high_scores&type=component">overall</A>

<br><br>

Largest Component Project Prizes<br>
<A href="/tc?module=ComponentRecordbook&c=largest_comp_prize&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=largest_comp_prize&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=largest_comp_prize&type=component">overall</A>

<br><br>

Most Component Reviews<br>
<A href="/tc?module=ComponentRecordbook&c=most_reviews&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=most_reviews&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=most_reviews&type=component">overall</A>

<br><br>

Most Component Contest Submissions<br>
<A href="/tc?module=ComponentRecordbook&c=most_submissions&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=most_submissions&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=most_submissions&type=component">overall</A>

<br><br>

Most Component Project Wins<br>
<A href="/tc?module=ComponentRecordbook&c=most_wins&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=most_wins&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=most_wins&type=component">overall</A>

<br><br>

Highest Component Contest Overall Earners<br>
<A href="/tc?module=ComponentRecordbook&c=overall_money">overall</A>

<br><br>

Highest Component Contest Royalty Earners<br>
<A href="/tc?module=ComponentRecordbook&c=royalties">overall</A>

<br><br>

Highest Component Tournament Winnings<br>
<A href="/tc?module=ComponentRecordbook&c=tournament_money&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=tournament_money&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=tournament_money&type=component">overall</A>

<br><br>

Best Component Project Winning Percentage<br>
<A href="/tc?module=ComponentRecordbook&c=win_percentage&type=design">design</A> | 
<A href="/tc?module=ComponentRecordbook&c=win_percentage&type=development">development</A> | 
<A href="/tc?module=ComponentRecordbook&c=win_percentage&type=component">overall</A>

</div>

        </td>
        <!-- Center Column Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
        <!-- Right Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->
    </tr>
</table>

<jsp:include page="../foot.jsp"/>

</body>

</html>















