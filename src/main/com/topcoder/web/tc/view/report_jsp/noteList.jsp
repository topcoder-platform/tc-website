<%@  page
  language="java"
  import="com.topcoder.common.web.data.report.*,
          com.topcoder.shared.dataAccess.resultSet.ResultSetContainer,
          com.topcoder.web.common.StringUtils"
%>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<jsp:useBean id="note_list" scope="request" class="com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"/>

<html>
  <head>
    <title>TopCoder Reporting</title>
  </head>
  <body>
    <a href=<%=Constants.SERVLET_ADDR+"?"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu<a><br/><br/>
    <center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">

        <tr><td>Notes for <%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></td></tr>

        <tr>
            <td>Text</td>
            <td>Author</td>
            <td>Date</td>
        </tr>

        <rsc:iterator list="<%=note_list%>" id="resultRow">
            <tr>
                <td><%=StringUtils.htmlEncode(resultRow.getItem("text"))%></td>
                <td><rsc:item row="<%=resultRow%>" name="submitted_by"/><td>
                <td><rsc:item row="<%=resultRow%>" name="date"/><td>

            </tr>

        </rsc:iterator>

    </table><br/><br/>

    </center>
  </body>
</html>
