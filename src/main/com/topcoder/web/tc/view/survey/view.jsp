<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<html>
<head>
<title>TopCoder Survey</title>
</head>
<body>
    <tc:questionIterator list="<%=questionInfo%>" id="question">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="3">
                    <jsp:getProperty name="question" property="text"/>
                </td>
            </tr>
            <tc:answerIterator list="<%=question.getAnswerInfo()%>" id="question">
            <tr>
                <td>
                    <tc:answerInput question="<%=question%>" answer="<%=answer%>"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
    </tc:questionIterator>
</body>
</html>
