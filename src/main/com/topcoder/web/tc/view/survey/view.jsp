<%@ page import="com.topcoder.web.tc.Constants"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<jsp:useBean id="surveyId" scope="request" class="java.lang.Long" />
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Survey</title>
</head>
<body>
    <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="surveyForm">
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitSurvey"/>
        <input type="hidden" name="<%=Constants.SURVEY_ID%>" value="<%=surveyId%>"/>
        <tc:questionIterator list="<%=questionInfo%>" id="question">
            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                <tr>
                    <td colspan="3">
                        <jsp:getProperty name="question" property="text"/>
                    </td>
                </tr>
                <tc:answerInput id="answerInput" question="<%=question%>">
                <tr>
                    <td>
                        <%=answerInput%>
                    </td>
                </tr>
                </tc:answerInput>
            </table>
        </tc:questionIterator>
        <table>
            <tr>
                <td colspan="2">
                    <a href="javascript: document.surveyForm.submit();">submit</a>
                </td>
            </tr>
        </table>


    </form>
</body>
</html>
