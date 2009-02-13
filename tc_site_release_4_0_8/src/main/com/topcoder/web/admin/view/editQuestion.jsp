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
                        <input type="hidden" name="module" value="UpdateQuestion"/>
                        <tc-webtag:hiddenInput name="<%=Constants.SURVEY_ID%>" />
                        <tc-webtag:hiddenInput name="<%=Constants.QUESTION_ID%>" />
                        <p><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditSurvey&&<%=Constants.SURVEY_ID%>=<%=request.getAttribute(Constants.SURVEY_ID)%>">Edit Survey</a></p>
                        <p><a href="<jsp:getProperty name="sessionInfo" property="servletPath"/>?module=EditAnswer&<%=Constants.QUESTION_ID%>=<%=request.getAttribute(Constants.QUESTION_ID)%>&<%=Constants.SURVEY_ID%>=<%=request.getAttribute(Constants.SURVEY_ID)%>">Add Answer</a></p>
                        <table>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.KEYWORD%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:textInput name="<%=Constants.KEYWORD%>" size="30" maxlength="64" onKeyPress="submitEnter(event)"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.QUESTION_STYLE%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:rscSelect name="<%=Constants.QUESTION_STYLE%>" list='<%=(ResultSetContainer)request.getAttribute("question_style_list")%>' fieldText="question_style_desc" fieldValue="question_style_id"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.QUESTION_TYPE%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:rscSelect name="<%=Constants.QUESTION_TYPE%>" list='<%=(ResultSetContainer)request.getAttribute("question_type_list")%>' fieldText="question_type_desc" fieldValue="question_type_id"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.QUESTION_STATUS%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:rscSelect name="<%=Constants.QUESTION_STATUS%>" list='<%=(ResultSetContainer)request.getAttribute("status_list")%>' fieldText="status_desc" fieldValue="status_id"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.QUESTION_TEXT%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:textArea name="<%=Constants.QUESTION_TEXT%>" rows="2" cols="80"/></td></tr>
                            <tr><td><tc-webtag:errorIterator id="err" name="<%=Constants.REQUIRED%>"><%=err%></tc-webtag:errorIterator></td></tr>
                            <tr><td><tc-webtag:chkBox name="<%=Constants.REQUIRED%>"/></td></tr>
                            <tr><td><input type="submit" name="submit" value="Save"/></td></tr>

                        </table>
                    </form>
                </td>
            </tr>
        </table>
    </body>
</html>