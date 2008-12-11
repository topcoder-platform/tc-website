<%@ page contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib uri="pacts.tld" prefix="pacts" %>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
    <title>TopCoder PACTs</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <link type="image/x-icon" rel="shortcut icon" href="/i/favicon.ico"/>
    <jsp:include page="../../script.jsp" />
    <jsp:include page="../../style.jsp">
    <jsp:param name="key" value="tc_stats"/>
    </jsp:include>
</head>

<body>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.NoteHeader" %>

<%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.PactsConstants"%><%@ page import="com.topcoder.web.tc.controller.legacy.pacts.common.UserProfile"%>

<%
    UserProfile user = (UserProfile)
            request.getAttribute(PactsConstants.PACTS_INTERNAL_RESULT);
    NoteHeader[] notes = (NoteHeader[])
            request.getAttribute(PactsConstants.NOTE_HEADER_LIST);
    if (notes == null) {
        notes = new NoteHeader[0];
    }
    if (user == null) {
        out.println("no user!!!<br>");
        user = new UserProfile();
    }
%>
<c:set var="user" value="<%=user %>" />

<jsp:include page="../../top.jsp" >
<jsp:param name="level1" value=""/>
</jsp:include>

<table width="100%" border="0" cellpadding="0" cellspacing="0">
<tbody>
    <tr valign="top">
<%-- Left Column Begins--%>
        <td width="180">
            <jsp:include page="../../includes/global_left.jsp">
                <jsp:param name="node" value=""/>
            </jsp:include>
        </td>
<%-- Left Column Ends --%>

<%-- Center Column Begins --%>
        <td width="100%" align="center" class="bodyColumn">
            <div class="fixedWidthBody">

<jsp:include page="../../page_title.jsp" >
<jsp:param name="image" value="pact_s"/>
<jsp:param name="title" value="&nbsp;"/>
</jsp:include>

<table border="0" cellpadding="1" cellspacing="1">
    <tr>
        <td><b>User:</b></td>
        <% out.print("<td>" + user.getHeader().getHandle() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Status:</b></td>
		<td><%= user.getStatus() %></td>
        
    </tr>

    <tr>
        <td><b>First Name:</b></td>
        <% out.print("<td>" + user.getFirstName() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Middle Name:</b></td>
        <% out.print("<td>" + user.getMiddleName() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Last Name:</b></td>
        <% out.print("<td>" + user.getLastName() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Email:</b></td>
        <% out.print("<td><a href=\"mailto:" + user.getEmail() + "\">" + user.getEmail() + "</a></td>\n");
        %>
    </tr>

    <tr>
        <td><b>Address 1:</b></td>
        <% out.print("<td>" + user.getAddress1() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Address 2:</b></td>
        <% out.print("<td>" + user.getAddress2() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Address 3:</b></td>
        <% out.print("<td>" + user.getAddress3() + "</td>\n");
        %>
    </tr>
    <tr>
        <td><b>City:</b></td>
        <% out.print("<td>" + user.getCity() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>State:</b></td>
        <% out.print("<td>" + user.getState() + "</td><td>(" + user.getStateCode() + ")</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Zip Code:</b></td>
        <% out.print("<td>" + user.getZip() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Province:</b></td>
        <% out.print("<td>" + user.getProvince() + "</td>\n");
        %>
    </tr>
    <tr>
        <td><b>Country:</b></td>
        <% out.print("<td>" + user.getCountry() + "</td><td>(" + user.getCountryCode() + ")</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Home Phone:</b></td>
        <% out.print("<td>" + user.getHomePhone() + "</td>\n");
        %>
    </tr>

    <tr>
        <td><b>Accrual Amount:</b></td>
        <td>$<fmt:formatNumber value="${user.header.accrualAmount}" pattern="###,##0.00" /></td>
    </tr>

<% if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {%>
    <tr>
        <td><b>Has Assignment Document v2.0:</b></td>
        <td>${has_global_ad}</td>
    </tr>
<%}%>



</table>

<% if (notes.length > 0) {
    out.println("<form action=\"" + PactsConstants.INTERNAL_SERVLET_URL + "\" method=\"post\">");
    out.println("<input type=\"hidden\" name=\"" + PactsConstants.TASK_STRING + "\" value=\"" + PactsConstants.VIEW_TASK + "\">");
    out.println("<input type=\"hidden\" name=\"" + PactsConstants.CMD_STRING + "\" value=\"" + PactsConstants.NOTE_CMD + "\">");
    out.println("<input type=\"submit\" value=\"View Note\">");
    out.println("<select name=\"" + PactsConstants.NOTE_ID + "\">");
    for (int n = 0; n < notes.length; n++) {
        out.println("<option value=\"" + notes[n].getId() + "\">" + notes[n].getCreationDate() + " by " + notes[n].getUser().getHandle() + "</option>");
    }
    out.println("</select></form>");
}
%>
<p>

<a href="PactsInternalServlet?module=PaymentList&user_id=<%= user.getHeader().getId() %>">Search for User's Payments</a><br>
    <%
        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.LIST_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.AFFIDAVIT_CMD + "&");
        out.println(PactsConstants.USER_ID + "=" + user.getHeader().getId());
        out.println("\">Search for User's Affidavits</a><br>");

        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.LIST_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.CONTRACT_CMD + "&");
        out.println(PactsConstants.USER_ID + "=" + user.getHeader().getId());
        out.println("\">Search for User's Contracts</a><br>");

        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.MODULE_KEY+"=ViewSearchAssignmentDocumentResult&");
        out.println(PactsConstants.USER_ID + "=" + user.getHeader().getId());
        out.println("\">Search for User's Assignment Documents</a><br>");
        
        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.LIST_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.USER_TAX_FORM_CMD + "&");
        out.println(PactsConstants.USER_ID + "=" + user.getHeader().getId());
        out.println("\">Search for User's Tax Forms</a><br>");

        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.LIST_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.NOTE_CMD + "&");
        out.println(PactsConstants.IN_DEPTH_HANDLE + "=" + user.getHeader().getHandle());
        out.println("\">In-Depth Search for User's Notes</a><br>");

        out.println("<br>");

        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.ADD_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.NOTE_CMD + "&");
        out.println("object_id=" + user.getHeader().getId() + "&");
        out.println("user_id=" + user.getHeader().getId() + "&");
        out.println("object_type=" + PactsConstants.USER_PROFILE_OBJ);
        out.println("\">Add Note</a><br>");
%>            
        <a href="${pacts:addPayment(user.header.id)}">Add Payment</a>
        <br/>

        <a href="${pacts:addAffidavit(user.header.id)}">Add Affidavit</a>
        <br/>
<%
        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.ADD_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.CONTRACT_CMD + "&");
        out.println(PactsConstants.USER_ID + "=" + user.getHeader().getId());
        out.println("\">Add Contract</a><br>");
        %>            

        <a href="${pacts:addAssignmentDocument(user.header.id)}">Add Assignment Document</a>
        <br/>

<%
        out.println("<a href=\"" + PactsConstants.INTERNAL_SERVLET_URL + "?");
        out.print(PactsConstants.TASK_STRING + "=" + PactsConstants.ADD_TASK + "&");
        out.println(PactsConstants.CMD_STRING + "=" + PactsConstants.USER_TAX_FORM_CMD + "&");
        out.println(PactsConstants.USER_ID + "=" + user.getHeader().getId());
        out.println("\">Add Tax Form</a><br>");
    %>

        <a href="${pacts:updateUserAccrual(user.header.id)}">Edit user accrual amount</a>
        <br/>
        
<% if ("on".equalsIgnoreCase(com.topcoder.web.tc.Constants.GLOBAL_AD_FLAG)) {%>
        <c:if test="${not has_global_ad}">
            <a href="${pacts:addGlobalAD(user.header.id)}">Add Assignment Document v2.0</a>
            <br/>
        </c:if>
<%}%>

<jsp:include page="InternalFooter.jsp" flush="true" />

            </div>
        </td>
<%-- Center Column Ends --%>
        
<%-- Right Column Begins --%>
        <td width="170">
            <jsp:include page="../../public_right.jsp">
                <jsp:param name="level1" value="default"/>
            </jsp:include>
        </td>
<%-- Right Column Ends --%>
        
    </tr>
    </tbody>
</table>

<jsp:include page="../../foot.jsp" />
</body>
</html>