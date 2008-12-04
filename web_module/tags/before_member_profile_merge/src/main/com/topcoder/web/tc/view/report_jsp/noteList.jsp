<%@ page
        language="java"
        import="com.topcoder.common.web.data.report.Constants,
                com.topcoder.shared.dataAccess.resultSet.ResultSetContainer"
        %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page import="com.topcoder.web.common.StringUtils" %>
<%@ taglib uri="rsc-taglib.tld" prefix="rsc" %>
<% ResultSetContainer note_list = (ResultSetContainer) request.getAttribute("note_list");%>

<html>
<head>
    <title>TopCoder Reporting</title>
</head>

<body>
<a href=<%=Constants.SERVLET_ADDR + "&" + Constants.TASK_NAME_KEY + "=" + Constants.NEW_REPORT_KEY%>>&lt;&lt; back to
    main menu</a><br/><br/>
<center>
    <br/>
    <br/>

    <table width="100%" border="0" cellpadding="3" cellspacing="0">

        <c:set value="<%=Constants.HANDLE%>" var="handle"/>
        <c:set value="<%=Constants.GIVEN_NAME%>" var="givenName"/>
        <c:set value="<%=Constants.SURNAME%>" var="surname"/>
        <tr><td colspan=4 align=center><b><font size="+2">${requestScope[handle]}</font></b></td></tr>
        <tr><td colspan=4 align=center>${requestScope[givenName]} ${requestScope[surname]}</td></tr>
        <tr><td colspan=4 align=center><a href="/tc?module=LegacyReport&t=profile&ha=${requestScope[handle]}">View
            Report Profile</a>
        </td></tr>
        <tr><td colspan=4 align=center><a href="/tc?module=LegacyReport&t=new_report&c=placement_people&db=java:OLTP">View
            Placement Registrants</a></td></tr>
        <tr><td colspan=4 align=center>
            <% if (((Boolean) request.getAttribute("registered_for_placement")).booleanValue()) { %>
            <A HREF="/tc?module=PlacementInfoDetail&uid=<%=request.getAttribute(Constants.USER_ID)%>">View Placement
                Information</A>
            <% } %>
        </td></tr>
        <tr><td colspan=4 align=left><A HREF="/tc?module=EditNote&uid=<%=request.getAttribute(Constants.USER_ID)%>">Add
            Note</A></td></tr>
        <tr><td colspan=4 align=left><A HREF="/tc?module=ContactDate&uid=<%=request.getAttribute(Constants.USER_ID)%>">Set
            Contact Date</A></td></tr>
        <tr><td colspan=4 align=left><A HREF="mailto:<%=request.getAttribute(Constants.EMAIL).toString()%>">Send
            Email</A>
        </td></tr>
        <tr>
            <td>Text</td>
            <td>Author</td>
            <td>Date</td>
            <td></td>
        </tr>

        <% boolean even = true;%>
        <rsc:iterator list="<%=note_list%>" id="resultRow">

            <tr>
                <td <%=even ? "bgcolor=\"#ccffcc\"" : ""%>><%=StringUtils.htmlEncode(resultRow.getStringItem("text"))%></td>
                <td <%=even ? "bgcolor=\"#ccffcc\"" : ""%> valign=top>
                    <rsc:item row="<%=resultRow%>" name="submitted_by"/></td>
                <td <%=even ? "bgcolor=\"#ccffcc\"" : ""%> valign=top>
                    <rsc:item row="<%=resultRow%>" name="date" format="MM.dd.yyyy hh:mma"/></td>
                <td <%=even?"bgcolor=\"#ccffcc\"":""%> valign=top>
                    <A HREF="/tc?module=EditNote&uid=<%=request.getAttribute(Constants.USER_ID)%>&nid=<rsc:item row="<%=resultRow%>" name="note_id"/>">Edit</A>
            </tr>
            <%even = !even;%>

        </rsc:iterator>
        <tr><td colspan=4 align=center><A HREF="/tc?module=EditNote&uid=<%=request.getAttribute(Constants.USER_ID)%>">Add
            Note</A></td></tr>

    </table>
    <br/><br/>

</center>
</body>
</html>
