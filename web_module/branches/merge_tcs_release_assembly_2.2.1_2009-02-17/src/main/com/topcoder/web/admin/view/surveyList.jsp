<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
                 com.topcoder.web.admin.Constants"%>
<%@ page import="com.topcoder.shared.util.ApplicationServer" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Admin</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" >
</head>
    <body>
        <jsp:include page="top.jsp"/>
        <table>
            <tr valign="top">
                <td>
                    <jsp:include page="left.jsp"/>
                </td>
                <td>
                    <% ResultSetContainer surveyList = (ResultSetContainer)request.getAttribute("admin_survey_list"); %>
                    <table>
                        <tr><td class="big" align="center" colspan="6"><a href="/admin/?module=EditSurvey">Create New</a></td></tr>
                        <tr>
                            <td class="header">ID</td>
                            <td class="header">Links</td>
                            <td class="header">Name</td>
                            <td class="header">Start Date</td>
                            <td class="header">End Date</td>
                            <td class="header">Status</td>
<%--
                            <td class="header">Text</td>
--%>
                            <td class="header"># Questions</td>
                            <td class="header">Results Viewable</td>
                        </tr>
                        <% boolean even = false; %>
                        <rsc:iterator list="<%=surveyList%>" id="survey">
                            <tr>
                                <td class="<%=even?"even":"odd"%>"><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditSurvey&<%=Constants.SURVEY_ID%>=<rsc:item row="<%=survey%>" name="survey_id"/>">edit <rsc:item row="<%=survey%>" name="survey_id"/></a></td>
                                <td class="<%=even?"even":"odd"%>">
                                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=ViewSurvey&amp;<%=Constants.SURVEY_ID%>=<rsc:item row="<%=survey%>" name="survey_id"/>">vote</a> |
                                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=SurveyResults&amp;<%=Constants.SURVEY_ID%>=<rsc:item row="<%=survey%>" name="survey_id"/>">results</a> |
                                    <a href="http://<%=ApplicationServer.SERVER_NAME%>/tc?module=LegacyReport&amp;t=new_report&amp;c=survey_results&amp;db=java:OLTP&amp;<%=Constants.SURVEY_ID%>=<rsc:item row="<%=survey%>" name="survey_id"/>">report</a>
                                </td>
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="name"/></td>
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="start_date" format="yyyy.MM.dd HH:mm"/></td>
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="end_date" format="yyyy.MM.dd HH:mm"/></td>
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="status_desc"/></td>
<%--
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="text"/></td>
--%>
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="question_count"/></td>
                                <td class="<%=even?"even":"odd"%>"><rsc:item row="<%=survey%>" name="results_viewable"/></td>
                            </tr>
                            <% even = !even;%>
                        </rsc:iterator>
                        <tr><td class="big" align="center" colspan="6"><a href="/admin/?module=EditSurvey">Create New</a></td></tr>
                    </table>

                </td>
            </tr>
        </table>
    </body>
</html>
