<%@ page import="com.topcoder.shared.dataAccess.DataAccess,
                 com.topcoder.shared.util.DBMS,
                 com.topcoder.shared.dataAccess.Request,
                 java.util.Map,
                 com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"%>
<%@  page language="java"  %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<%@ taglib uri="tc.tld" prefix="tc" %>
<jsp:include page="../../script.jsp"/>

<jsp:useBean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%
    ResultSetContainer rsc = null;
    if (sessionInfo.isAdmin()) {
        DataAccess da = new DataAccess(DBMS.OLTP_DATASOURCE_NAME);
        Request r = new Request();
        r.setContentHandle("tccc04_question_answers");
        Map m = da.getData(r);
        rsc = (ResultSetContainer)m.get("tccc04_question_answers");
    }
    String curr = "";
%>

<html>
    <body>
        <table>
            <rsc:iterator list="<%=rsc%>" id="info">
                <% if (!curr.equals(info.getStringItem("handle"))) {%>
                    <tr>
                        <td class="formTextOdd">
                            <rsc:item row="<%=info%>" name="handle"/>
                        </td>
                    </tr>
                <% } %>
                <% curr = info.getStringItem("handle"); %>
            </rsc:iterator>
        </table>
        <% curr="";%>

        <table>
            <rsc:iterator list="<%=rsc%>" id="info">
                <% if (!curr.equals(info.getStringItem("handle"))) {%>
                    <tr><td><br/><br/><br/></td></tr>
                    <tr>
                        <td class="formTextOdd">
                            <h2><rsc:item row="<%=info%>" name="handle"/></h2>
                        </td>
                    </tr>
                <% } %>
                <tr>
                    <td class="formTextOdd">
                        Question:  <rsc:item row="<%=info%>" name="question"/>
                    </td>
                </tr>
                <tr>
                    <td class="formTextEven">
                        Response:<br/>
                        <rsc:item row="<%=info%>" name="response"/>
                    </td>
                </tr>
                <% curr = info.getStringItem("handle"); %>
            </rsc:iterator>
        </table>
    </body>
</html>