<%@ page import="com.topcoder.web.tc.Constants,
                 com.topcoder.web.tc.view.tag.AnswerInput"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<%@ taglib uri="/tc-webtags.tld" prefix="tc-webtag" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<jsp:useBean id="surveyInfo" scope="request" class="com.topcoder.web.tc.model.Survey" />
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<html>
<head>
<title>TopCoder Survey</title>
</head>
<body>
    <form action="<jsp:getProperty name="sessionInfo" property="ServletPath"/>" method="POST" name="surveyForm">
        <input type="hidden" name="<%=Constants.MODULE_KEY%>" value="SubmitSurvey"/>
        <input type="hidden" name="<%=Constants.SURVEY_ID%>" value="<%=surveyInfo.getId()%>"/>
        <tc:questionIterator list="<%=questionInfo%>" id="question">
            <table width="100%" border="0" cellpadding="3" cellspacing="0">
                <tr>
                    <td>
                        <jsp:getProperty name="question" property="text"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        <tc-webtag:errorIterator id="err" name="<%=AnswerInput.PREFIX+question.getId()%>"><%=err%><br/></tc-webtag:errorIterator>
                    </td>
                </tr>
                <tc:answerInput id="answerInput" question="<%=question%>">
                <tr>
                    <td>
                        <%=answerText%>
                    </td>
                    <td>
                        <%=answerInput%>
                    </td>
                </tr>
                </tc:answerInput>
            </table>
        </tc:questionIterator>
        <table>
            <tr>
                <td>
                    <a href="javascript: document.surveyForm.submit();">submit</a>
                </td>
            </tr>
        </table>


    </form>
</body>
</html>
