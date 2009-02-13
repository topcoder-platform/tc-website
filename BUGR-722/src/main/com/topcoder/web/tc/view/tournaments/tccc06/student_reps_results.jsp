<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer rsc = (ResultSetContainer) request.getAttribute("studentRepList"); %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>

<html>
<head>

    <jsp:include page="/script.jsp"/>
    <title>2006 TopCoder Collegiate Challenge - Computer Programming Tournament</title>
    <link type="text/css" rel="stylesheet" href="/css/TCCC06style.css"/>
    <link type="text/css" rel="stylesheet" href="/css/coders.css"/>
</head>

<body>

<!-- Tab barlinks-->
<jsp:include page="links.jsp">
    <jsp:param name="tabLev1" value="overview"/>
    <jsp:param name="tabLev2" value="student_reps"/>
    <jsp:param name="tabLev3" value="results"/>
</jsp:include>


<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <!-- Body-->
    <tr valign="top">
        <td valign="top" align="center">
            <div class="bodySpacer">

                <span class="bigTitle">Student Rep Referral Leaderboard</span>
                <br><br>
                <span class="bodySubTitle">Congratulations to the winner - <tc-webtag:handle coderId="14949480" />!</span>
                <br><br>
                Here are the results of the TCCC06 Referral Program.
                <br><br>
                <table width="510" border="0" cellpadding="5" cellspacing="2" class="sidebarBox">
                    <tr>
                        <td class="sidebarTitle" width="25%">
                            Handle
                        </td>
                        <td class="sidebarTitle" align="center" width="20%">
                            # of Referrals
                        </td>
                        <td class="sidebarTitle" align="center" width="20%">
                            Qualification<br>
                            Participants
                        </td>
<rsc:iterator list="<%=rsc%>" id="resultRow"><tr><td class="sidebarHandle">
<tc-webtag:handle coderId='<%=resultRow.getLongItem("user_id")%>' darkBG="true"/></td>
<td class="sidebarText" align="center">
<rsc:item name="total_count" row="<%=resultRow%>"/></td>
<td class="sidebarText" align="center">
<rsc:item name="total_comp_count" row="<%=resultRow%>"/></td>
</tr></rsc:iterator>
                    </tr>
                </table>
                <br><br>


            </div>
        </td>


        <!-- Right Column-->
        <td width="170" align="right">
            <jsp:include page="right.jsp">
                <jsp:param name="level1" value="all"/>
            </jsp:include>
        </td>

    </tr>

</table>


<jsp:include page="../../foot.jsp"/>
</body>

</html>
