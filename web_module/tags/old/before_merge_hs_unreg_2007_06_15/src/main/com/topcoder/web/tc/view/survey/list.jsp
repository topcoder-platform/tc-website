<%@ page import="com.topcoder.shared.dataAccess.DataAccessConstants" %>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" %>
<%@ page import="com.topcoder.web.tc.Constants" %>
<%@ page language="java" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<c:set value="<%=com.topcoder.web.common.BaseProcessor.DEFAULTS_KEY%>" var="defaults"/>
<c:set value="<%=DataAccessConstants.START_RANK%>" var="startRank"/>

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
            myForm.<%=DataAccessConstants.START_RANK%>.value = <c:out value="${requestScope[defaults][startRank]}"/> + <%=Constants.DEFAULT_SURVEY_SCROLL_SIZE%>;
            myForm.submit();
        }
        function previous() {
            var myForm = document.surveyListForm;
            myForm.<%=DataAccessConstants.START_RANK%>.value = <c:out value="${requestScope[defaults][startRank]}"/> - <%=Constants.DEFAULT_SURVEY_SCROLL_SIZE%>;
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

<div class="maxWidthBody">

                <jsp:include page="../page_title.jsp">
                    <jsp:param name="image" value="surveys"/>
                    <jsp:param name="title" value="Archive"/>
                </jsp:include>

                <p>The following is a list of polls we occasionally ask the community:</p>


                <div class="pagingBox">
                    <%=(surveyList.croppedDataBefore() ? "<a href=\"#\" onclick=\"previous();return false;\"class=\"bcLink\">&lt;&lt; prev</a>" : "&lt;&lt; prev")%>
                    | <%=(surveyList.croppedDataAfter() ? "<a href=\"#\" onclick=\"next();return false;\"class=\"bcLink\">next &gt;&gt;</a>" : "next &gt;&gt;")%>
                </div>
                <div align="center">
                <table cellpadding="0" cellspacing="0" class="stat">
                <tbody>
                    <tr>
                        <td class="headerC">Date</td>
                        <td class="header">Survey</td>
                        <td class="headerC"><div style="width:70px;">&nbsp;</div></td>
                        <td class="headerC"><div style="width:70px;">&nbsp;</div></td>
                        <td class="headerC">&nbsp;</td>
                    </tr>
                    <form name="surveyListForm" action="${sessionInfo.servletPath}" method="get">
                        <tc-webtag:hiddenInput name="<%=Constants.MODULE_KEY%>" value="SurveyList"/>
                        <tc-webtag:hiddenInput name="<%=DataAccessConstants.START_RANK%>"/>

                        <% boolean even = false; %>
                        <rsc:iterator list="<%=surveyList%>" id="survey">
                            <tr class="<%=even?"dark":"light"%>">
                                <td class="valueC"><rsc:item row="<%=survey%>" name="date" format="MM.dd.yyyy"/></td>
                                <td class="value">
                                    <rsc:item row="<%=survey%>" name="question_text"/>
                                </td>
                                <td class="valueC">
                                    <a class="button" href="?module=SurveyResults&sid=<rsc:item row="<%=survey%>" name="survey_id"/>">Results</a>
                                </td>
                                <td class="valueC">
                                    <% if (survey.getIntItem("answered_flag") == 0 && survey.getIntItem("survey_open") == 1) { %>
                                    <a class="button" href="?module=ViewSurvey&sid=<rsc:item row="<%=survey%>" name="survey_id"/>">Vote</a>
                                    <% } else if (survey.getIntItem("answered_flag") != 0) { %>
                                    <a class="button" href="?module=ViewSurvey&sid=<rsc:item row="<%=survey%>" name="survey_id"/>">My Vote</a>
                                    <% } else { %>
                                    &nbsp;
                                    <% } %>
                                </td>
                                <td class="valueC">
                                    &nbsp;<tc:sponsorImage src='<%=survey.getStringItem("image")%>' href='<%=survey.getStringItem("link")%>' alt="Sponsor" border="0"/>
                                </td>
                            </tr>
                            <% even = !even; %>
                        </rsc:iterator>
                    </form>
                </tbody>
                </table>
                </div>
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