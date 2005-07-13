<%@ page contentType="text/html; charset=ISO-8859-1"
         language="java"
         import="com.topcoder.shared.dataAccess.*,
                 com.topcoder.shared.dataAccess.resultSet.*,
                 java.util.Map,
                 com.topcoder.web.corp.Constants"
         %>
<%@ taglib uri="/rsc-taglib.tld" prefix="rsc" %>
<jsp:usebean id="sessionInfo" class="com.topcoder.web.common.SessionInfo" scope="request" />
<%
        ResultSetContainer rsc = (ResultSetContainer)request.getAttribute("companyUsers");
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<title>TopCoder | Corporate Services</title>

<jsp:include page="../includes/css.jsp" />

<script language="JavaScript" type="text/javascript" src="/js/script.js"></script>

</head>

<body>

<!-- Top begins -->
<jsp:include page="../includes/top.jsp"/>
<!-- Top ends -->

<table width="100%" border="0" cellpadding="0" cellspacing="0">
    <tr valign="top">

<!-- Left Column Begins -->
        <td width="170">
            <jsp:include page="../includes/left.jsp">
                <jsp:param name="level1" value="manageUsers"/>
                <jsp:param name="level2" value="userList"/>
            </jsp:include>
        </td>
<!-- Left Column Ends -->

<!-- Gutter Begins -->
        <td valign="top"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->

<!-- Center Column begins -->
        <td width="100%" align="center"><img src="/i/corp/clear.gif" width="400" height="11" alt="" border="0"><br>
            <table border="0" cellpadding="0" cellspacing="0" width="100%">
                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <h1 class="testHead">Manage Users</h1>
                    </td>
                <tr>

                <tr valign="top">
                    <td class="bodyText" width="100%">
                        <p>Use this page to manage the access that users at your company are given. By clicking <strong>Edit</strong> you can give users
                        overall Administrative access, full access to the Technical Assessment Application, results access to the Technical Assessment Application, or reporting access
                        to the Recruiting Application, depending on which TopCoder programs you have purchased.</p>
                    </td>
                </tr>
            </table>

            <table border="0" cellspacing="10" cellpadding="0" width="80%">
                 <tr>
                    <td><div align="center"><p class="button"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserEdit" class="button">Add New User</a></p></div></td>
                </tr>
            </table>

            <table border="0" cellspacing="0" cellpadding="3" width="80%" class="testFrame">
                <tr valign="middle">
                    <td class="testTableTitle">&#160;Handle</td>
                    <td class="testTableTitle">First Name</td>
                    <td class="testTableTitle">Last Name</td>
                    <td class="testTableTitle">&#160;</td>
                </tr>

        <% /* Setup variables used for row alternating background colors */
                boolean isGreyBGCOLOR = true;
                String bgColor = new String();
        %>

            <rsc:iterator list="<%=rsc%>" id="resultRow" >
        <%
                bgColor = isGreyBGCOLOR ? "#EEEEEE" : "#FFFFFF";
                isGreyBGCOLOR = !isGreyBGCOLOR; // change BGCOLOR for next row.
        %>
                <tr>
                    <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">&#160;
                        <rsc:item row="<%=resultRow%>" name="handle"/></TD>
                    <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">
                        <rsc:item row="<%=resultRow%>" name="first_name"/></TD>
                    <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">
             <rsc:item row="<%=resultRow%>" name="last_name"/></TD>
                    <TD VALIGN="middle" CLASS="bodyText" HEIGHT="15" BGCOLOR="<%=bgColor%>">
                      <% if (sessionInfo.getUserId()==resultRow.getLongItem("user_id")) { %>
                        <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=Registration&id=<rsc:item row="<%=resultRow%>" name="user_id"/>" CLASS="bodyText">Edit</A>
                      <% } else { %>
                        <A HREF="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserEdit&id=<rsc:item row="<%=resultRow%>" name="user_id"/>" CLASS="bodyText">Edit</A>
                      <% } %>
                    </TD>
                </tr>
        </rsc:iterator>

            <table border="0" cellspacing="10" cellpadding="0" width="80%">
                 <tr>
                    <td><div align="center"><p class="button"><a href="<%=request.getAttribute(Constants.KEY_LINK_PREFIX)%>?module=UserEdit" class="button">Add New User</a></p></div></td>
                </tr>
            </table>

            <p><br></p>

        </td>
<!-- Center Column ends -->

<!-- Gutter -->
        <td width="10"><img src="/i/corp/clear.gif" width="10" height="1" alt="" border="0"></td>
<!-- Gutter Ends -->
    </tr>
</table>

<!-- Footer begins -->
  <jsp:include page="../../foot.jsp"/>
<!-- Footer ends -->

</body>
</html>
