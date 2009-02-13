<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<% ResultSetContainer surveyList = (ResultSetContainer) request.getAttribute("surveyList");%>
<html>

<head>

    <title>Member Surveys</title>

    <jsp:include page="/script.jsp"/>
    <jsp:include page="/style.jsp">
        <jsp:param name="key" value="tc_stats"/>
    </jsp:include>


    <script type="text/javascript">
        function next() {
            var myForm = document.surveyListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) + <%=Constants.DEFAULT_SURVEY_SCROLL_SIZE%>;
            myForm.submit();
        }
        function previous() {
            var myForm = document.surveyListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = parseInt(myForm.<%=DataAccessConstants.START_RANK%>.value) - <%=Constants.DEFAULT_SURVEY_SCROLL_SIZE%>;
            myForm.submit();
        }
    </script>


</head>

<body>

<jsp:include page="../top.jsp">
    <jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

        <!-- Left Column Begins -->
        <td width="180">
            <jsp:include page="/includes/global_left.jsp">
                <jsp:param name="node" value="competitor_surveys"/>
            </jsp:include>
        </td>
        <!-- Left Column Ends -->

        <td width="100%" align="center" class="bodyColumn">

            <div class="fixedWidthBody">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="surveys"/>
                    <jsp:param name="title" value="Archive"/>
                </jsp:include>

                <p>We occasionally poll TopCoder competitors to find out answers to questions that are important to the
                    coding
                    community.
                    The following is a list of those questions. Feel free to click "Results" next to any question to see
                    how
                    the TopCoder member
                    base responded or click "Vote" to participate in any survey. Any survey you have already
                    participated in
                    will not have a "Vote"
                    button next to it.</p>


                <div class="pagingBox">
                    <%=(surveyList.croppedDataBefore() ? "<a href=\"#\" onclick=\"previous();return false;\"class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
                    | <%=(surveyList.croppedDataAfter() ? "<a href=\"#\" onclick=\"next();return false;\"class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                </div>
                <table border="0" cellpadding="5" cellspacing="0" class="bodyText" width="500" align="center">
                    <form name="surveyListForm" action="${sessionInfo.servletPath}" method="get">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SurveyList"/>
                        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>

                        <% boolean even = false; %>
                        <rsc:iterator list="<%=surveyList%>" id="survey">
                            <tr class="<%=even?"formTextOdd":"formTextEven"%>">
                                <td><rsc:item row="<%=survey%>" name="date" format="MM.dd.yyyy"/></td>
                                <td>
                                    <rsc:item row="<%=survey%>" name="question_text"/>
                                </td>
                                <td nowrap valign="top">
                                    <a href="?module=SurveyResults&sid=<rsc:item row="<%=survey%>" name="survey_id"/>"><img src="/i/results.gif" width="60" height="18" border="0"></a>
                                </td>
                                <td nowrap valign="top">
                                    <% if (survey.getIntItem("answered_flag") == 0 && survey.getIntItem("survey_open") == 1) { %>
                                    <a href="?module=ViewSurvey&sid=<rsc:item row="<%=survey%>" name="survey_id"/>"><img src="/i/answer.gif" width="60" height="18" border="0"></a>
                                    <% } %>
                                </td>
                                <td valign="top">
                                    <tc:sponsorImage src='<%=survey.getStringItem("image")%>' href='<%=survey.getStringItem("link")%>' alt="survey logo" width="100" height="53" align="left" border="0"/>
                                </td>
                            </tr>
                            <% even = !even; %>
                        </rsc:iterator>
                    </form>
                </table>
                <div class="pagingBox">
                    <%=(surveyList.croppedDataBefore() ? "<a href=\"#\" onclick=\"previous();return false;\"class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
                    | <%=(surveyList.croppedDataAfter() ? "<a href=\"#\" onclick=\"next();return false;\"class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                </div>

            </div>

        </td>

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