<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="surveyList" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer" />
<html>
<head>
<title>TopCoder Survey List</title>
</head>
<body>
        <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <rsc:iterator list="<%=surveyList%>" id="survey">
            <tr>
                <td>
                    <rsc:item row="<%=survey%>" name="question_text"/>
                </td>
                <td>
                    <a href="?&module=SurveyResults&sid=<rsc:item row="<%=survey%>" name="survey_id"/>">view results</a>
                </td>
            </tr>
            </rsc:iterator>
        </table>
</body>
</html>
