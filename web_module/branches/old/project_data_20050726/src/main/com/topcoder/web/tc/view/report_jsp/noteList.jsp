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
    <a href=<%=Constants.SERVLET_ADDR+"&"+Constants.TASK_NAME_KEY+"="+Constants.NEW_REPORT_KEY%>><< back to main menu<a><br/><br/>
    <center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">

        <tr><td colspan=4 align=center><b><font size="+2"><%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%></font></b></td></tr>
        <tr><td colspan=4 align=center><a href="/tc?module=LegacyReport&t=profile&ha=<%=request.getAttribute(com.topcoder.web.tc.Constants.HANDLE)%>">View Report Profile</a></td></tr>
        <tr><td colspan=4 align=center><a href="/tc?module=LegacyReport&t=new_report&c=placement_people&db=OLTP">View Placement Registrants</a></td></tr>
        <tr><td colspan=4 align=center>
                <% if (((Boolean)request.getAttribute("registered_for_placement")).booleanValue()) { %>
                     <A HREF="/tc?module=PlacementInfoDetail&uid=<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>">View Placement Information</A>
                <% } %>
        </td></tr>
        <tr><td colspan=4 align=left><A HREF="/tc?module=EditNote&uid=<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>">Add Note</A></td></tr>
        <tr><td colspan=4 align=left><A HREF="/tc?module=ContactDate&uid=<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>">Set Contact Date</A></td></tr>
        <tr>
            <td>Text</td>
            <td>Author</td>
            <td>Date</td>
            <td></td>
        </tr>

        <% boolean even = true;%>
        <rsc:iterator list="<%=note_list%>" id="resultRow">

            <tr>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%>><%=StringUtils.htmlEncode(resultRow.getStringItem("text"))%></td>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%> valign=top><rsc:item row="<%=resultRow%>" name="submitted_by"/></td>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%> valign=top><rsc:item row="<%=resultRow%>" name="date" format="MM.dd.yyyy hh:mma"/></td>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%> valign=top><A HREF="/tc?module=EditNote&uid=<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>&nid=<rsc:item row="<%=resultRow%>" name="note_id"/>">Edit</A>
            </tr>
            <%even=!even;%>

        </rsc:iterator>
        <tr><td colspan=4 align=center><A HREF="/tc?module=EditNote&uid=<%=request.getAttribute(com.topcoder.web.tc.Constants.USER_ID)%>">Add Note</A></td></tr>

    </table><br/><br/>

    </center>
  </body>
</html>
