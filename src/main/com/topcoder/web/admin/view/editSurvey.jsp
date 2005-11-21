<%@ page import="com.topcoder.web.admin.Constants"%>
<%@ page import="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/REC-html40/loose.dtd">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc-webtags.tld" prefix="tc-webtag" %>
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
                    <form action="<jsp:getProperty name="sessionInfo" property="servletPath"/>" method=post name="surveyForm">
                        <input type="hidden" name="module" value="UpdateSurvey"/>
                        <tc-webtag:hiddenInput name="<%=Constants.SURVEY_ID%>" />
                        <p><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditQuestion&<%=Constants.SURVEY_ID%>=<%=request.getAttribute(Constants.SURVEY_ID)%>">Add Question</a></p>
                        <table>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.SURVEY_NAME%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:textInput name="<%=Constants.SURVEY_NAME%>" size="30" maxlength="50" onKeyPress="submitEnter(event)"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.SURVEY_END%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:textInput name="<%=Constants.SURVEY_END%>" size="16" maxlength="16" onKeyPress="submitEnter(event)"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.SURVEY_START%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:textInput name="<%=Constants.SURVEY_START%>" size="16" maxlength="16" onKeyPress="submitEnter(event)"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.SURVEY_STATUS%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:rscSelect name="<%=Constants.SURVEY_STATUS%>" list='<%=(ResultSetContainer)request.getAttribute("status_list")%>' fieldText="status_desc" fieldValue="status_id"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.SURVEY_TEXT%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:textArea name="<%=Constants.SURVEY_TEXT%>" rows="2" cols="80"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.RESULTS_VIEWABLE%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:chkBox name="<%=Constants.RESULTS_VIEWABLE%>"/></td></tr>
                            <tr><td><input type="submit" name="submit" value="Save"/></td></tr>

                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>

