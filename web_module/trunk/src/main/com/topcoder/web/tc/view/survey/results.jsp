<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="/tc.tld" prefix="tc" %>
<jsp:useBean id="questionInfo" scope="request" class="java.util.List" />
<html>
<head>
<title>TopCoder Survey Results</title>
</head>
<body>
    <tc:questionIterator list="<%=questionInfo%>" id="resultRow">
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr>
                <td colspan="2">
                    <jsp:getProperty name="questionInfo" property="text"/>
                </td>
            </tr>
            <rsc:iterator list="<%=questionInfo.getAnswerInfo()%>" id="answer">
            <tr>
                <td>
                    <rsc:item row="answer" name="answer_text"/>
                </td>
                <td>
                    <rsc:item row="answer" name="count"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
    </tc:questionIterator>
</body>
</html>
