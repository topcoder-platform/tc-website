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
                        <input type="hidden" name="module" value="UpdateAnswer"/>
                        <tc-webtag:hiddenInput name="<%=Constants.SURVEY_ID%>" />
                        <tc-webtag:hiddenInput name="<%=Constants.QUESTION_ID%>" />
                        <tc-webtag:hiddenInput name="<%=Constants.ANSWER_ID%>" />
                        <p><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditSurvey&&<%=Constants.SURVEY_ID%>=<%=request.getAttribute(Constants.SURVEY_ID)%>">Edit Survey</a></p>
                        <p><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditQuestion&<%=Constants.QUESTION_ID%>=<%=request.getAttribute(Constants.QUESTION_ID)%>&<%=Constants.SURVEY_ID%>=<%=request.getAttribute(Constants.SURVEY_ID)%>">Edit Question</a></p>
                        <table>
                            <tr><td colspan="2"><tc-webtag:errorIterator id="err" name="<%=Constants.SORT%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td>Sort</td><td><tc-webtag:textInput name="<%=Constants.SORT%>" size="3" maxlength="5" onKeyPress="submitEnter(event)"/></td></tr>
                            <tr><td colspan="2"><tc-webtag:errorIterator id="err" name="<%=Constants.ANSWER_TEXT%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td>Text</td><td><tc-webtag:textArea name="<%=Constants.ANSWER_TEXT%>" rows="2" cols="80"/></td></tr>
                            <tr><td colspan="2"><input type="submit" name="submit" value="Save"/></td></tr>
                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>
