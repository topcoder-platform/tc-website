<%@ page import="java.util.List" %>
<%@ page import="com.topcoder.web.common.voting.CondorcetSchulzeResults"%>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% CondorcetSchulzeResults results = (CondorcetSchulzeResults) request.getAttribute("results");%>


<html>

<head>

    <title>Member Surveys</title>

    <jsp:include page="../script.jsp"/>
</head>

<body>
<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

        <!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="../includes/global_left.jsp">
                <jsp:param name="level1" value="statistics"/>
                <jsp:param name="level2" value="member_surveys"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <!-- Gutter Begins -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1"></td>
        <!-- Gutter Ends -->

        <!-- Center Column Begins -->
        <td width="100%" class="bodyText" valign="top">
            <table width="100%" border="0" cellpadding="10" cellspacing="0" class="bodyText">
                <tr>
                    <td class="bodyText" width="100%"><img src="/i/header_questions.gif" width="210" height="26"
                                                           border="0"><br/>

                        <p align="right" class="bodyText"><a href="/tc?module=SurveyList">Archive</a></p></td>
                </tr>
            </table>

                <% if (results.hasSingleWinner()) {%>
            <p>The winner is <%=results.getWinner().getName()%></p>
            <% } %>
            <table width="510" border="0" cellpadding="5" cellspacing="0" class="formFrame" align="center">
                <tc-webtag:listIterator list="<%=results.getResults()%>" id="result" type="com.topcoder.web.common.voting.RankedResult">
                    <tr>
                        <td><jsp:getProperty name="result" property="rank"/></td>
                        <tc-webtag:useBean id="candidate" name="result" type="com.topcoder.web.common.voting.Candidate" toScope="page" property="candidate" />
                        <td><jsp:getProperty name="candidate" property="name"/></td>
                    </tr>
                </tc-webtag:listIterator>
            </table>
        </td>
        <!-- Center Column Ends -->

        <!-- Gutter -->
        <td width="10"><img src="/i/clear.gif" width="10" height="1" border="0"></td>
        <!-- Gutter Ends -->

        <!-- Right Column Begins -->
        <td width="170">
            <jsp:include page="../public_right.jsp">
                <jsp:param name="level1" value="review_board"/>
                <jsp:param name="level2" value="competition"/>
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