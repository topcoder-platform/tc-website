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
    <a href=<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu</a><br/><br/>
    <center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">

        <tr><td colspan=3>Notes for <%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></td></tr>
        <tr><td colspan=3><a href="/tc?module=LegacyReport&t=profile&ha=<%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%>">View Report Profile</a></p></td>

        <tr>
            <td>Text</td>
            <td>Author</td>
            <td>Date</td>
        </tr>

        <% boolean even = true;%>
        <rsc:iterator list="<%=note_list%>" id="resultRow">

            <tr>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%>><%=StringUtils.htmlEncode(resultRow.getStringItem("text"))%></td>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%> valign=top><rsc:item row="<%=resultRow%>" name="submitted_by"/></td>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%> valign=top><rsc:item row="<%=resultRow%>" name="date" format="MM.dd.yyyy hh:mma"/></td>
            </tr>
            <%even=!even;%>

        </rsc:iterator>

    </table><br/><br/>

    </center>
  </body>
</html>
