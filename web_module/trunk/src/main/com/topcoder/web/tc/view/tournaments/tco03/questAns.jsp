<%@ page import="com.topcoder.shared.dataAccess.DataAccess,
                 com.topcoder.shared.util.DBMS,
                 com.topcoder.shared.dataAccess.Request,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>

<%
    DataAccess da = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
    Request r = new Request();
    r.setContentHandle("tco03_question_answers");
    Map m = da.getData(r);
    ResultSetContainer rsc = (ResultSetContainer)m.get("tco03_question_answers");
%>

<html>
    <body>
        <table>
            <rsc:iterator list="<%=rsc%>" id="info">
            <tr>
                <td>
                    <rsc:item row="<%=info%>" name="handle"/>
                </td>
            </tr>
            <tr><td>Question:</td></tr>
            <tr>
                <td>
                    <rsc:item row="<%=info%>" name="question"/>
                </td>
            </tr>
            <tr><td>Response:</td></tr>
            <tr>
                <td>
                    <rsc:item row="<%=info%>" name="response"/>
                </td>
            </tr>
            </rsc:iterator>
        </table>
    </body>
</html>